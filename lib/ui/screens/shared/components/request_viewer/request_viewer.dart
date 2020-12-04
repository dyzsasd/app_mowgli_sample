import 'package:flutter/material.dart';
import 'package:mowgli/ui/components/list.dart';
import 'package:mowgli/ui/components/list/section/section_list.dart';
import 'package:mowgli/ui/components/list/section/section_list_model.dart';
import 'package:mowgli/ui/resources/translations.dart';
import 'package:mowgli/ui/screens/homepage/bloc/homepage_bloc.dart';
import 'package:mowgli/ui/screens/section_details/bloc/section_details_bloc.dart';
import 'package:mowgli/ui/screens/shared/components/request_viewer/bloc/request_viewer_bloc.dart';
import 'package:mowgli/ui/screens/shared/components/request_viewer/model/request_viewer_data_content.dart';
import 'package:mowgli/ui/screens/shared/components/notifications.dart';
import 'package:mowgli/ui/screens/shared/model/request/request.dart';
import 'package:mowgli/ui/utils/image_utils.dart';

class RequestListViewerScreen extends StatefulWidget {
  final SectionListData sectionData;
  final Request request;
  final PreferredSizeWidget appBar;

  RequestListViewerScreen(
      {@required this.request, this.sectionData, this.appBar});

  @override
  _RequestListViewerScreenState createState() =>
      _RequestListViewerScreenState();
}

class _RequestListViewerScreenState extends State<RequestListViewerScreen> {
  RequestViewerBloc _bloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(RequestListViewerScreen oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.request != widget.request) {
      _bloc?.updateLocation(widget.request);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RequestViewerBloc>(
      create: (_) => _bloc = RequestViewerBloc(
          widget.sectionData, widget.request, context.imagesWidth),
      child: Scaffold(
        appBar: widget.appBar,
        body: Stack(
          children: <Widget>[
            Positioned.fill(child: _RequestViewerBody()),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: _SubscribeToNotificationsContainer(),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _bloc?.close();
    super.dispose();
  }
}

class _RequestViewerBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestViewerBloc, RequestViewerState>(
      buildWhen: (RequestViewerState o, RequestViewerState n) =>
          o.runtimeType != n.runtimeType,
      builder: (BuildContext context, RequestViewerState state) {
        return state.map(
            (RequestViewerStateData data) =>
                _RequestViewerBodyList(content: data.data),
            loading: (_) => const _RequestViewerBodyLoading(),
            error: (_) => const _RequestViewerBodyError(),
            empty: (_) => const _RequestViewerBodyEmpty());
      },
    );
  }
}

class _RequestViewerBodyLoading extends StatelessWidget {
  const _RequestViewerBodyLoading();

  @override
  Widget build(BuildContext context) {
    return const LoadingList();
  }
}

class _RequestViewerBodyEmpty extends StatelessWidget {
  const _RequestViewerBodyEmpty();

  @override
  Widget build(BuildContext context) {
    return EmptyList(label: Translations.of(context).destinationViewerEmpty);
  }
}

class _RequestViewerBodyError extends StatelessWidget {
  const _RequestViewerBodyError();

  @override
  Widget build(BuildContext context) {
    Translations translations = Translations.of(context);

    return ErrorList<RequestViewerBloc>(
      errorLabel: translations.destinationViewerErrorMessage,
      retryLabel: translations.destinationViewerErrorButton,
    );
  }
}

class _RequestViewerBodyList extends StatelessWidget {
  final RequestDetailsContent content;

  _RequestViewerBodyList({@required this.content});

  @override
  Widget build(BuildContext context) {
    return SectionList(
      bottomPadding: 55.0,
      imagesWidth: context.imagesWidth,
      section: SectionListData(
          offers: content.sectionData.offers,
          request: content.sectionData.request,
          nextRequestToken: content.sectionData.nextRequestToken),
    );
  }
}

class _SubscribeToNotificationsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestViewerBloc, RequestViewerState>(
      buildWhen: (RequestViewerState o, RequestViewerState n) =>
          o.isReady != n.isReady,
      builder: (BuildContext context, RequestViewerState state) {
        return Visibility(
          visible: false,
          child: SubscribeToNotificationsButton(
            request: state.maybeWhen(
                (RequestDetailsContent content) => content.request,
                orElse: () => null),
          ),
        );
      },
    );
  }
}
