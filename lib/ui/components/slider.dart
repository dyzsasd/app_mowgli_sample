import 'dart:math' as math;
import 'dart:ui' show lerpDouble;

import 'package:flutter/cupertino.dart' hide CupertinoThumbPainter;
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class EasySlider extends StatelessWidget {
  final num minValue;
  final num maxValue;
  final num currentMinValue;
  final num currentMaxValue;
  final int divisions;
  final ValueChanged<num> onMinChanged;
  final ValueChanged<num> onMaxChanged;
  final VoidCallback onThumbUp;

  EasySlider({
    @required this.maxValue,
    @required this.currentMaxValue,
    @required this.onMinChanged,
    @required this.onMaxChanged,
    this.divisions,
    this.minValue,
    this.currentMinValue,
    this.onThumbUp,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Slider(
        divisions: divisions,
        minValue: minValue != null
            ? ((currentMinValue ?? minValue) - minValue) / (maxValue - minValue)
            : null,
        maxValue: ((currentMaxValue ?? maxValue) - (minValue ?? 0.0)) /
            (maxValue - (minValue ?? 0.0)),
        onMinChanged: minValue != null
            ? (double value) {
                double res = ((maxValue - minValue) * value) + minValue;

                if (minValue is double) {
                  onMinChanged(res);
                } else if (minValue is int) {
                  onMinChanged(res.floor());
                }
              }
            : null,
        onMaxChanged: (double value) {
          double res =
              ((maxValue - (minValue ?? 0.0)) * value) + (minValue ?? 0.0);

          if (maxValue is double) {
            onMaxChanged(res);
          } else if (maxValue is int) {
            onMaxChanged(res.floor());
          }
        },
        onThumbUp: onThumbUp,
      ),
    );
  }
}

/// A slider with a value between 0 et 1
class Slider extends StatelessWidget {
  final double minValue;
  final double maxValue;
  final int divisions;
  final ValueChanged<double> onMinChanged;
  final ValueChanged<double> onMaxChanged;
  final VoidCallback onThumbUp;

  Slider({
    @required this.maxValue,
    @required this.onMaxChanged,
    this.divisions,
    this.minValue,
    this.onMinChanged,
    this.onThumbUp,
  });

  @override
  Widget build(BuildContext context) {
    return _CupertinoRangeSlider(
        minValue: minValue != null ? math.max(0.0, minValue ?? 0.0) : null,
        maxValue: math.min(1.0, maxValue ?? 1.0),
        activeColor: Theme.of(context).primaryColorDark,
        onMinChanged: minValue != null ? onMinChanged : null,
        onMaxChanged: onMaxChanged,
        divisions: divisions,
        onThumbUp: onThumbUp);
  }
}

class _CupertinoRangeSlider extends StatefulWidget {
  final double minValue;
  final double maxValue;
  final ValueChanged<double> onMinChanged;
  final ValueChanged<double> onMaxChanged;
  final double min;
  final double max;
  final int divisions;
  final Color activeColor;
  final VoidCallback onThumbUp;

  const _CupertinoRangeSlider({
    @required this.maxValue,
    @required this.onMaxChanged,
    this.minValue,
    this.onMinChanged,
    this.onThumbUp,
    Key key,
    this.min: 0.0,
    this.max: 1.0,
    this.divisions,
    this.activeColor: CupertinoColors.activeBlue,
  })  : assert(maxValue != null),
        assert(min != null),
        assert(max != null),
        assert(divisions == null || divisions > 0),
        super(key: key);

  @override
  _CupertinoRangeSliderState createState() => _CupertinoRangeSliderState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('minValue', minValue));
    properties.add(DoubleProperty('maxValue', maxValue));
    properties.add(DoubleProperty('min', min));
    properties.add(DoubleProperty('max', max));
  }
}

class _CupertinoRangeSliderState extends State<_CupertinoRangeSlider>
    with TickerProviderStateMixin {
  void _handleMinChanged(double value) {
    assert(widget.onMinChanged != null);
    final double nextValue = value * (widget.max - widget.min) + widget.min;
    final double v = nextValue > widget.maxValue ? widget.maxValue : nextValue;
    widget.onMinChanged(v);
  }

  void _handleMaxChanged(double value) {
    assert(widget.onMaxChanged != null);
    final double nextValue = value * (widget.max - widget.min) + widget.min;
    final double v = nextValue < (widget.minValue ?? 0.0)
        ? (widget.minValue ?? 0.0)
        : nextValue;
    widget.onMaxChanged(v);
  }

  @override
  Widget build(BuildContext context) {
    return _CupertinoSliderRenderObjectWidget(
      minValue: widget.minValue != null
          ? (widget.minValue - widget.min) / (widget.max - widget.min)
          : null,
      maxValue: (widget.maxValue - widget.min) / (widget.max - widget.min),
      divisions: widget.divisions,
      activeColor: widget.activeColor,
      onMinChanged: widget.minValue != null
          ? widget.onMinChanged != null
              ? _handleMinChanged
              : null
          : null,
      onMaxChanged: widget.onMaxChanged != null ? _handleMaxChanged : null,
      onThumbUp: widget.onThumbUp,
      vsync: this,
    );
  }
}

class _CupertinoSliderRenderObjectWidget extends LeafRenderObjectWidget {
  final double minValue;
  final double maxValue;
  final int divisions;
  final Color activeColor;
  final ValueChanged<double> onMinChanged;
  final ValueChanged<double> onMaxChanged;
  final VoidCallback onThumbUp;
  final TickerProvider vsync;

  const _CupertinoSliderRenderObjectWidget({
    Key key,
    this.minValue,
    this.maxValue,
    this.divisions,
    this.activeColor,
    this.onMinChanged,
    this.onMaxChanged,
    this.onThumbUp,
    this.vsync,
  }) : super(key: key);

  @override
  _RenderCupertinoSlider createRenderObject(BuildContext context) {
    return _RenderCupertinoSlider(
      minValue: minValue,
      maxValue: maxValue,
      divisions: divisions,
      activeColor: activeColor,
      onMinChanged: onMinChanged,
      onMaxChanged: onMaxChanged,
      onThumbUp: onThumbUp,
      vsync: vsync,
      textDirection: Directionality.of(context),
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, _RenderCupertinoSlider renderObject) {
    renderObject
      ..minValue = minValue
      ..maxValue = maxValue
      ..divisions = divisions
      ..activeColor = activeColor
      ..onMinChanged = onMinChanged
      ..onMaxChanged = onMaxChanged
      ..onThumbUp = onThumbUp
      ..textDirection = Directionality.of(context);
    // Ticker provider cannot change since there's a 1:1 relationship between
    // the _SliderRenderObjectWidget object and the _SliderState object.
  }
}

const double _kPadding = 8.0;
const int _kMinThumb = 1;
const int _kMaxThumb = 2;
const Color _kTrackColor = Color(0xFFB5B5B5);
const double _kSliderHeight = 2.0 * (_CupertinoThumbPainter.radius + _kPadding);
const double _kSliderWidth = 176.0; // Matches Material Design slider.
const Duration _kDiscreteTransitionDuration = Duration(milliseconds: 500);

const double _kAdjustmentUnit =
    0.1; // Matches iOS implementation of material slider.

class _RenderCupertinoSlider extends RenderConstrainedBox {
  final _CupertinoThumbPainter _thumbPainter;

  _RenderCupertinoSlider({
    @required double maxValue,
    @required TextDirection textDirection,
    double minValue,
    int divisions,
    Color activeColor,
    ValueChanged<double> onMinChanged,
    ValueChanged<double> onMaxChanged,
    VoidCallback onThumbUp,
    TickerProvider vsync,
  })  : assert(maxValue != null && maxValue >= 0.0 && maxValue <= 1.0),
        assert(textDirection != null),
        _thumbPainter = _CupertinoThumbPainter(borderColor: activeColor),
        _minValue = minValue,
        _maxValue = maxValue,
        _divisions = divisions,
        _activeColor = activeColor,
        _onMinChanged = onMinChanged,
        _onMaxChanged = onMaxChanged,
        onThumbUp = onThumbUp,
        _textDirection = textDirection,
        super(
            additionalConstraints: const BoxConstraints.tightFor(
                width: _kSliderWidth, height: _kSliderHeight)) {
    _drag = HorizontalDragGestureRecognizer()
      ..onStart = _handleDragStart
      ..onUpdate = _handleDragUpdate
      ..onEnd = _handleDragEnd;
    _minPosition = AnimationController(
      value: minValue,
      duration: _kDiscreteTransitionDuration,
      vsync: vsync,
    )..addListener(markNeedsPaint);
    _maxPosition = AnimationController(
      value: maxValue,
      duration: _kDiscreteTransitionDuration,
      vsync: vsync,
    )..addListener(markNeedsPaint);
  }

  double get minValue => _minValue;
  double _minValue;

  double get maxValue => _maxValue;
  double _maxValue;

  set minValue(double value) {
    if (minValue != null) {
      assert(value != null && value >= 0.0 && value <= 1.0);
      if (value == _minValue) {
        return;
      }
      _minValue = value;
      if (divisions != null)
        _minPosition.animateTo(value, curve: Curves.fastOutSlowIn);
      else
        _minPosition.value = value;
    }
  }

  set maxValue(double value) {
    assert(value != null && value >= 0.0 && value <= 1.0);
    if (value == _maxValue) {
      return;
    }
    _maxValue = value;
    if (divisions != null)
      _maxPosition.animateTo(value, curve: Curves.fastOutSlowIn);
    else
      _maxPosition.value = value;
  }

  int get divisions => _divisions;
  int _divisions;

  set divisions(int value) {
    if (value == _divisions) {
      return;
    }
    _divisions = value;
    markNeedsPaint();
  }

  Color get activeColor => _activeColor;
  Color _activeColor;

  set activeColor(Color value) {
    if (value == _activeColor) {
      return;
    }
    _activeColor = value;
    markNeedsPaint();
  }

  ValueChanged<double> get onMinChanged => _onMinChanged;
  ValueChanged<double> _onMinChanged;

  ValueChanged<double> get onMaxChanged => _onMaxChanged;
  ValueChanged<double> _onMaxChanged;

  VoidCallback onThumbUp;

  set onMinChanged(ValueChanged<double> value) {
    if (value == _onMinChanged) {
      return;
    }
    final bool wasInteractive = isInteractive;
    _onMinChanged = value;
    if (wasInteractive != isInteractive) {
      markNeedsSemanticsUpdate();
    }
  }

  set onMaxChanged(ValueChanged<double> value) {
    if (value == _onMaxChanged) {
      return;
    }

    final bool wasInteractive = isInteractive;
    _onMaxChanged = value;
    if (wasInteractive != isInteractive) {
      markNeedsSemanticsUpdate();
    }
  }

  TextDirection get textDirection => _textDirection;
  TextDirection _textDirection;

  set textDirection(TextDirection value) {
    assert(value != null);
    if (_textDirection == value) {
      return;
    }
    _textDirection = value;
    markNeedsPaint();
  }

  AnimationController _minPosition;
  AnimationController _maxPosition;

  HorizontalDragGestureRecognizer _drag;
  double _currentDragValue = 0.0;
  int pickedThumb = 123;

  double get _discretizedCurrentDragValue {
    double dragValue = _currentDragValue.clamp(0.0, 1.0);
    if (divisions != null)
      dragValue = (dragValue * divisions).round() / divisions;
    return dragValue;
  }

  double get _trackLeft => _kPadding;

  double get _trackRight => size.width - _kPadding;

  double get _minThumbCenter {
    double visualPosition;
    switch (textDirection) {
      case TextDirection.rtl:
        visualPosition = 1.0 - _minValue;
        break;
      case TextDirection.ltr:
        visualPosition = _minValue;
        break;
    }
    return lerpDouble(_trackLeft + _CupertinoThumbPainter.radius,
        _trackRight - _CupertinoThumbPainter.radius, visualPosition);
  }

  double get _maxThumbCenter {
    double visualPosition;
    switch (textDirection) {
      case TextDirection.rtl:
        visualPosition = 1.0 - _maxValue;
        break;
      case TextDirection.ltr:
        visualPosition = _maxValue;
        break;
    }
    return lerpDouble(_trackLeft + _CupertinoThumbPainter.radius,
        _trackRight - _CupertinoThumbPainter.radius, visualPosition);
  }

  bool get isInteractive => minValue != null
      ? (onMinChanged != null && onMaxChanged != null)
      : onMaxChanged != null;

  void _handleDragStart(DragStartDetails details) {
    if (isInteractive) {
      _currentDragValue = pickedThumb == _kMinThumb ? _minValue : _maxValue;

      if (pickedThumb == _kMinThumb) {
        onMinChanged(_discretizedCurrentDragValue);
      } else {
        onMaxChanged(_discretizedCurrentDragValue);
      }
    }
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    if (isInteractive) {
      final double extent = math.max(_kPadding,
          size.width - 2.0 * (_kPadding + _CupertinoThumbPainter.radius));
      final double valueDelta = details.primaryDelta / extent;
      switch (textDirection) {
        case TextDirection.rtl:
          _currentDragValue -= valueDelta;
          break;
        case TextDirection.ltr:
          _currentDragValue += valueDelta;
          break;
      }

      if (pickedThumb == _kMinThumb && minValue != null) {
        onMinChanged(_discretizedCurrentDragValue);
      } else {
        onMaxChanged(_discretizedCurrentDragValue);
      }
    }
  }

  void _handleDragEnd(DragEndDetails details) {
    if (onThumbUp != null) {
      onThumbUp();
    }

    _currentDragValue = 0.0;
  }

  @override
  bool hitTestSelf(Offset position) {
    if (minValue != null &&
        (position.dx - _minThumbCenter).abs() <
            _CupertinoThumbPainter.radius + _kPadding) {
      pickedThumb = _kMinThumb;
      return true;
    }

    if ((position.dx - _maxThumbCenter).abs() <
        _CupertinoThumbPainter.radius + _kPadding) {
      pickedThumb = _kMaxThumb;
      return true;
    }

    return false;
  }

  @override
  void handleEvent(PointerEvent event, BoxHitTestEntry entry) {
    assert(debugHandleEvent(event, entry));
    if (event is PointerDownEvent && isInteractive) {
      _drag.addPointer(event);
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final Color betweenColor = _activeColor;
    final Color aroundColor = _kTrackColor;

    final double trackCenter = offset.dy + size.height / 2.0;
    final double trackLeft = offset.dx + _trackLeft;
    final double trackTop = trackCenter - 2.0;
    final double trackBottom = trackCenter + 2.0;
    final double trackRight = offset.dx + _trackRight;

    final double trackMinActive =
        offset.dx + (minValue != null ? _minThumbCenter : 0);
    final double trackMaxActive = offset.dx + _maxThumbCenter;

    final Canvas canvas = context.canvas;
    final Paint paint = Paint();

    paint.color = aroundColor;
    canvas.drawRRect(
        RRect.fromLTRBXY(
            trackLeft, trackTop, trackRight, trackBottom, 1.0, 1.0),
        paint);

    paint.color = betweenColor;
    canvas.drawRRect(
        RRect.fromLTRBXY(
            trackMinActive, trackTop, trackMaxActive, trackBottom, 1.0, 1.0),
        paint);

    final Offset minThumbCenter = Offset(trackMinActive, trackCenter);
    final Offset maxThumbCenter = Offset(trackMaxActive, trackCenter);

    if (minValue != null) {
      _thumbPainter.paint(
          canvas,
          Rect.fromCircle(
              center: minThumbCenter, radius: _CupertinoThumbPainter.radius));
    }

    _thumbPainter.paint(
        canvas,
        Rect.fromCircle(
            center: maxThumbCenter, radius: _CupertinoThumbPainter.radius));
  }

  @override
  void describeSemanticsConfiguration(SemanticsConfiguration config) {
    super.describeSemanticsConfiguration(config);

    config.isSemanticBoundary = isInteractive;
    if (isInteractive) {
      config.onIncrease = _increaseAction;
      config.onDecrease = _decreaseAction;
    }
  }

  double get _semanticActionUnit =>
      divisions != null ? 1.0 / divisions : _kAdjustmentUnit;

  void _increaseAction() {
    if (isInteractive) {
      if (minValue != null && pickedThumb == _kMinThumb) {
        onMinChanged((minValue + _semanticActionUnit).clamp(0.0, 1.0));
      } else {
        onMaxChanged((maxValue + _semanticActionUnit).clamp(0.0, 1.0));
      }
    }
  }

  void _decreaseAction() {
    if (isInteractive) {
      if (minValue != null && pickedThumb == _kMinThumb) {
        onMinChanged((minValue - _semanticActionUnit).clamp(0.0, 1.0));
      } else {
        onMaxChanged((maxValue - _semanticActionUnit).clamp(0.0, 1.0));
      }
    }
  }
}

class _CupertinoThumbPainter {
  /// Creates an object that paints an iOS-style slider thumb.
  const _CupertinoThumbPainter({
    @required this.borderColor,
    this.color = CupertinoColors.white,
  });

  final Color color;
  final Color borderColor;
  static const double radius = 14.0;

  void paint(Canvas canvas, Rect rect) {
    final RRect rrect = RRect.fromRectAndRadius(
      rect,
      Radius.circular(rect.shortestSide / 2.0),
    );

    canvas.drawRRect(
      rrect.inflate(1.0),
      Paint()..color = borderColor,
    );
    canvas.drawRRect(rrect, Paint()..color = color);
  }
}
