import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mowgli/ui/components/badge.dart';
import 'package:mowgli/ui/components/buttons.dart';
import 'package:mowgli/ui/divider.dart';
import 'package:mowgli/ui/resources/app_icons.dart';
import 'package:mowgli/ui/resources/app_styles.dart';
import 'package:mowgli/ui/screens/alerts/subscriptions/bloc/alerts_subscriptions_bloc.dart';
import 'package:mowgli/ui/utils/bloc.dart';
import 'package:mowgli/utils/collections/iterable_utils.dart';

class ListItemTitle extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry padding;

  ListItemTitle({@required this.label, this.padding, this.onPressed})
      : assert(label != null);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding:
            padding ?? EdgeInsets.symmetric(horizontal: 24.0, vertical: 17.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                label,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
            Visibility(
              visible: onPressed != null,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 6.0),
                child: RotatedBox(
                  quarterTurns: 2,
                  child: Icon(
                    AppIcons.back,
                    size: 15.0,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

const double kListItemCellHorizontalPadding = 23.0;

class ListItemCell extends StatelessWidget {
  final String label;
  final IconData icon;
  final List<BadgeLabel> badges;
  final VoidCallback onPressed;

  ListItemCell({@required this.label, this.icon, this.badges, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        constraints: BoxConstraints(minHeight: 79.0, minWidth: double.infinity),
        alignment: AlignmentDirectional.centerStart,
        padding: const EdgeInsets.symmetric(
            horizontal: kListItemCellHorizontalPadding, vertical: 12.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    label,
                    style: AppTextStyles.h2Bold,
                  ),
                  if (IterableUtils.isNotEmpty(badges))
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Wrap(
                        spacing: 5.0,
                        runSpacing: 5.0,
                        children: badges
                            .map((BadgeLabel label) =>
                                Badge.generic(label: label))
                            .toList(growable: false),
                      ),
                    )
                ],
              ),
            ),
            if (icon != null)
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 8.0),
                child: Icon(icon,
                    color: Theme.of(context).primaryColor, size: 14.0),
              )
          ],
        ),
      ),
    );
  }
}

class EmptyList extends StatelessWidget {
  final String label;

  const EmptyList({@required this.label}) : assert(label != null);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.5,
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(height: 1.5),
        ),
      ),
    );
  }
}

class LoadingList extends StatelessWidget {
  const LoadingList();

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class ErrorList<B extends BaseBloc<Object, Object>> extends StatelessWidget {
  final String errorLabel;
  final String retryLabel;
  final VoidCallback retryCallback;

  ErrorList({@required this.errorLabel, this.retryLabel, this.retryCallback});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              errorLabel,
              textAlign: TextAlign.center,
              style: TextStyle(height: 1.5),
            ),
            if (retryLabel != null) ...<Widget>[
              const SizedBox(height: 20.0),
              AppButton(
                onPressed: retryCallback ??
                    () {
                      context.bloc<B>().forceReload();
                    },
                label: retryLabel,
              )
            ]
          ],
        ),
      ),
    );
  }
}

class SeparatedListView extends ListView {
  SeparatedListView({
    @required IndexedWidgetBuilder itemBuilder,
    @required int itemCount,
    Key key,
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    ScrollController controller,
    bool primary,
    ScrollPhysics physics,
    bool shrinkWrap = false,
    EdgeInsetsGeometry padding,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
    double cacheExtent,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    ScrollViewKeyboardDismissBehavior keyboardDismissBehavior =
        ScrollViewKeyboardDismissBehavior.manual,
  }) : super.separated(
            key: key,
            scrollDirection: scrollDirection,
            reverse: reverse,
            controller: controller,
            primary: primary,
            physics: physics,
            shrinkWrap: shrinkWrap,
            padding: padding,
            itemBuilder: itemBuilder,
            itemCount: itemCount,
            addAutomaticKeepAlives: addAutomaticKeepAlives,
            addRepaintBoundaries: addRepaintBoundaries,
            addSemanticIndexes: addSemanticIndexes,
            cacheExtent: cacheExtent,
            dragStartBehavior: dragStartBehavior,
            keyboardDismissBehavior: keyboardDismissBehavior,
            separatorBuilder: (BuildContext context, int position) =>
                const Separator());
}
