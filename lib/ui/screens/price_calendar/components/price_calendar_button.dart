import 'package:flutter/material.dart';
import 'package:mowgli/ui/components/buttons.dart';
import 'package:mowgli/ui/resources/translations.dart';
import 'package:mowgli/ui/screens/price_calendar/bloc/price_calendar_bloc.dart';

class PriceCalendarValidateButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PriceCalendarBloc, PriceCalendarState>(
      buildWhen: (PriceCalendarState oldState, PriceCalendarState newState) =>
          oldState.isSavable != newState.isSavable,
      builder: (BuildContext context, PriceCalendarState state) {
        return _PriceCalendarButtonContainer(
          visible: state.isSavable,
        );
      },
    );
  }
}

class _PriceCalendarButtonContainer extends StatefulWidget {
  final bool visible;

  _PriceCalendarButtonContainer({@required this.visible});

  @override
  _PriceButtonContainerState createState() => _PriceButtonContainerState();
}

class _PriceButtonContainerState extends State<_PriceCalendarButtonContainer>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this)
      ..addListener(() => setState(() {}));
    _animation = Tween<double>(begin: 148.0, end: 0.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));

    if (widget.visible) {
      _controller.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(_PriceCalendarButtonContainer oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.visible != widget.visible) {
      if (widget.visible) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0.0, _animation.value),
      child: _Button(),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}

class _Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool hasBottomPadding = MediaQuery.of(context).padding.bottom > 0;

    return SafeArea(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: <Color>[
          Colors.white.withOpacity(0.01),
          Colors.white.withOpacity(0.5),
          Colors.white.withOpacity(0.75)
        ], stops: <double>[
          0.0,
          0.75,
          1.0
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Padding(
          padding: EdgeInsetsDirectional.only(
              start: 24.0,
              end: 24.0,
              top: 8.0,
              bottom: hasBottomPadding ? 0.0 : 8.0),
          child: AppButton(
            label: Translations.of(context).priceCalendarButtonConfirm,
            type: AppButtonType.normalDark,
            onPressed: () {
              context.bloc<PriceCalendarBloc>().generateFiltersOverride();
            },
          ),
        ),
      ),
    );
  }
}
