import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mowgli/ui/divider.dart';
import 'package:mowgli/ui/resources/app_styles.dart';

class ScaffoldBottomButtonContainer extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  final bool visible;
  final bool bottomContainerVisible;

  ScaffoldBottomButtonContainer(
      {@required this.label,
      this.visible = true,
      this.onPressed,
      this.bottomContainerVisible})
      : assert(label != null),
        assert(visible != null);

  @override
  _ScaffoldBottomButtonContainerState createState() =>
      _ScaffoldBottomButtonContainerState();
}

class _ScaffoldBottomButtonContainerState
    extends State<ScaffoldBottomButtonContainer>
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
  void didUpdateWidget(ScaffoldBottomButtonContainer oldWidget) {
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
      child: ScaffoldBottomContainer(
        bottomContainerVisible: widget.bottomContainerVisible,
        child: ScaffoldBottomButton(
          label: widget.label,
          onPressed: widget.onPressed,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}

class ScaffoldBottomContainer extends StatelessWidget {
  final Widget child;
  final double verticalPadding;
  final bool bottomContainerVisible;

  ScaffoldBottomContainer(
      {@required this.child,
      this.verticalPadding,
      this.bottomContainerVisible});

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: bottomContainerVisible ?? true,
        child: ColoredBox(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Separator(),
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: verticalPadding ?? 16.0),
                child: child,
              ),
            ],
          ),
        ));
  }
}

class ScaffoldBottomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  ScaffoldBottomButton({@required this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    BorderRadius radius = const BorderRadius.all(Radius.circular(6.0));

    return InkWell(
      borderRadius: radius,
      onTap: onPressed,
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          constraints: BoxConstraints.tightFor(width: 148.0, height: 49.0),
          decoration: BoxDecoration(
              borderRadius: radius, color: Theme.of(context).primaryColorDark),
          child: Center(
            child: Text(label,
                textAlign: TextAlign.center, style: AppTextStyles.h2Button),
          ),
        ),
      ),
    );
  }
}
