import 'package:flutter/material.dart';

class ProgressOverlay extends StatelessWidget {
  final Widget child;
  final bool showOverlay;
  final bool topSafeArea;
  final bool bottomSafeArea;

  ProgressOverlay(
      {@required this.child,
      this.showOverlay = false,
      this.topSafeArea = true,
      this.bottomSafeArea = true})
      : assert(child != null);

  @override
  Widget build(BuildContext context) {
    return MaskOverlay(
      child: child,
      topChild: const CircularProgressIndicator(),
      showOverlay: showOverlay,
      topSafeArea: topSafeArea,
      bottomSafeArea: bottomSafeArea,
    );
  }
}

class MaskOverlay extends StatelessWidget {
  final Widget child;
  final Widget topChild;
  final bool showOverlay;
  final bool topSafeArea;
  final bool bottomSafeArea;

  MaskOverlay(
      {@required this.child,
      @required this.topChild,
      this.showOverlay = false,
      this.topSafeArea = true,
      this.bottomSafeArea = true});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SafeArea(
                child: child, top: topSafeArea, bottom: bottomSafeArea),
        Positioned.fill(
          child: Visibility(
            visible: showOverlay,
            child: AbsorbPointer(
              absorbing: showOverlay,
              child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  alignment: Alignment.center,
                  color: Colors.white.withOpacity(0.6),
                  child: topChild),
            ),
          ),
        )
      ],
    );
  }
}
