import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mowgli/app/app_services.dart';
import 'package:provider/provider.dart';

abstract class BaseBloc<E, S> extends Bloc<E, S> {
  E _lastEvent;

  BaseBloc(S initialState) : super(initialState);

  void dispatch(E event) {
    add(event);
  }

  void dispatchLastEvent() {
    if (_lastEvent != null) {
      dispatch(_lastEvent);
    }
  }

  void forceReload() {
    dispatchLastEvent();
  }

  @override
  void onEvent(E event) {
    _lastEvent = event;
    super.onEvent(event);
  }

  void logEvent({String message, Object error, StackTrace stackTrace}) {
    ApplicationServices.logs.debug(
        tag: loggerTag, message: message, error: error, stackTrace: stackTrace);
  }

  void logError({String message, Object error, StackTrace stackTrace}) {
    ApplicationServices.logs.error(
        tag: loggerTag, message: message, error: error, stackTrace: stackTrace);
  }

  String get loggerTag => runtimeType.toString();
}

/// Provides a [BlocProvider] and a [BlocListener] at the same time
class BlocCreatorWithListener<B extends Bloc<Object, S>, S>
    extends StatelessWidget {
  final Create<B> create;
  final BlocWidgetListener<S> listener;
  final BlocListenerCondition<S> listenWhen;
  final Widget child;
  final bool lazy;

  BlocCreatorWithListener({
    @required this.create,
    @required this.listener,
    this.child,
    this.lazy,
    this.listenWhen,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<B>(
        create: create,
        lazy: lazy,
        child: BlocListener<B, S>(
          listener: listener,
          listenWhen: listenWhen,
          child: child,
        ));
  }
}

/// Provides a [BlocProvider] and a [BlocListener] at the same time
class BlocCreatorWithBuilder<B extends Bloc<Object, S>, S>
    extends StatelessWidget {
  final Create<B> create;
  final BlocWidgetBuilder<S> builder;
  final BlocListenerCondition<S> buildWhen;
  final bool lazy;

  BlocCreatorWithBuilder({
    @required this.create,
    @required this.builder,
    this.lazy,
    this.buildWhen,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<B>(
        create: create,
        lazy: lazy,
        child: BlocBuilder<B, S>(
          builder: builder,
          buildWhen: buildWhen,
        ));
  }
}

/// Provides a [BlocProvider] and a [BlocListener] at the same time
class BlocCreatorWithConsumer<B extends Bloc<Object, S>, S>
    extends StatelessWidget {
  final Create<B> create;
  final BlocWidgetBuilder<S> builder;
  final BlocListenerCondition<S> buildWhen;
  final BlocWidgetListener<S> listener;
  final BlocListenerCondition<S> listenWhen;
  final bool lazy;

  BlocCreatorWithConsumer(
      {@required this.create,
      @required this.builder,
      @required this.listener,
      this.lazy,
      this.buildWhen,
      this.listenWhen});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<B>(
        create: create,
        lazy: lazy,
        child: BlocConsumer<B, S>(
          builder: builder,
          buildWhen: buildWhen,
          listener: listener,
          listenWhen: listenWhen,
        ));
  }
}
