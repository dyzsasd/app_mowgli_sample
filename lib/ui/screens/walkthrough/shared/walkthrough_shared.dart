import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mowgli/ui/resources/app_icons.dart';

class WalkthroughContainer extends StatelessWidget {
  final String imageSrc;
  final String title;
  final String subtitle;
  final String positiveLabel;
  final VoidCallback positiveCallback;
  final String negativeLabel;
  final VoidCallback negativeCallback;

  WalkthroughContainer(
      {@required this.imageSrc,
      @required this.title,
      @required this.subtitle,
      @required this.positiveLabel,
      @required this.positiveCallback,
      this.negativeLabel,
      this.negativeCallback});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: IconTheme(
        data: IconThemeData(color: const Color(0xFFFFFFFF)),
        child: DefaultTextStyle(
          style: TextStyle(
              color: const Color(0xFFFFFFFF), height: 1.56, fontSize: 16.0),
          textAlign: TextAlign.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              children: <Widget>[
                Expanded(flex: 54, child: Center(child: Image.asset(imageSrc))),
                Expanded(
                    flex: 25,
                    child: _WalkthroughTextContainer(
                      line1: title,
                      line2: subtitle,
                    )),
                Expanded(
                  flex: 21,
                  child: _WalkthroughButtonBar(
                    positiveLabel: positiveLabel,
                    positiveCallback: positiveCallback,
                    negativeLabel: negativeLabel,
                    negativeCallback: negativeCallback,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _WalkthroughTextContainer extends StatelessWidget {
  final String line1;
  final String line2;

  _WalkthroughTextContainer({this.line1, this.line2});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          line1,
          style: const TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 22.0),
        Expanded(child: AutoSizeText(line2, minFontSize: 5.0)),
      ],
    );
  }
}

final BorderRadius _kButtonRadius = BorderRadius.circular(6.0);

class _WalkthroughButtonBar extends StatelessWidget {
  final String positiveLabel;
  final VoidCallback positiveCallback;
  final String negativeLabel;
  final VoidCallback negativeCallback;

  _WalkthroughButtonBar(
      {@required this.positiveLabel,
      @required this.positiveCallback,
      this.negativeLabel,
      this.negativeCallback});

  @override
  Widget build(BuildContext context) {
    BoxConstraints constraints =
        BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.47);

    return Center(
      child: SizedBox(
        height: 50.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.ideographic,
          children: <Widget>[
            if (negativeLabel != null)
              ConstrainedBox(
                constraints: constraints,
                child: _WalkthroughInvisibleButton(
                  label: negativeLabel,
                  onTap: negativeCallback,
                ),
              ),
            ConstrainedBox(
              constraints: constraints,
              child: _WalkthroughPlainButton(
                label: positiveLabel,
                onTap: positiveCallback,
                trailingChild: negativeLabel == null
                    ? Container(
                        width: 26.0,
                        height: 26.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context)
                                .primaryColorDark
                                .withOpacity(0.5)),
                        child: Icon(AppIcons.next))
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WalkthroughPlainButton extends StatelessWidget {
  final String label;
  final Widget trailingChild;
  final VoidCallback onTap;

  _WalkthroughPlainButton(
      {@required this.label, @required this.onTap, this.trailingChild});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        borderRadius: _kButtonRadius,
        child: Ink(
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: _kButtonRadius),
          child: Container(
            alignment: Alignment.center,
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 11.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                  child: AutoSizeText(
                    label,
                    style: const TextStyle(
                        height: 1.0,
                        fontWeight: FontWeight.w500,
                        fontSize: 18.0),
                    minFontSize: 5,
                    maxLines: 1,
                  ),
                ),
                if (trailingChild != null)
                  SizedBox(
                    width: 40.0,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(start: 15.0),
                      child: ConstrainedBox(
                          constraints: BoxConstraints.tight(Size.square(26.0)),
                          child: IconTheme.merge(
                              data: IconThemeData(size: 15.0),
                              child: trailingChild)),
                    ),
                  )
              ],
            ),
          ),
        ));
  }
}

class _WalkthroughInvisibleButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  _WalkthroughInvisibleButton({@required this.label, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: _kButtonRadius,
      child: Container(
        alignment: Alignment.center,
        padding:
            const EdgeInsetsDirectional.only(end: 8.0, top: 11.0, bottom: 11.0),
        child: AutoSizeText(
          label,
          style: const TextStyle(height: 1.0, fontSize: 18.0),
          minFontSize: 5,
          maxLines: 1,
        ),
      ),
    );
  }
}
