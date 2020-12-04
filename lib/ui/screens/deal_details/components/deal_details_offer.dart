import 'dart:math';

import 'package:css_text/css_text.dart';
import 'package:flutter/material.dart';
import 'package:mowgli/app/app_services.dart';
import 'package:mowgli/data/network/dio/subscription/model/request/add_subscription_request.dart';
import 'package:mowgli/ui/components/badge.dart';
import 'package:mowgli/ui/components/buttons.dart';
import 'package:mowgli/ui/resources/app_colors.dart';
import 'package:mowgli/ui/resources/app_icons.dart';
import 'package:mowgli/ui/resources/app_styles.dart';
import 'package:mowgli/ui/resources/translations.dart';
import 'package:mowgli/ui/screens/deal_details/bloc/deal_details_bloc.dart';
import 'package:mowgli/ui/screens/deal_details/components/offer/deal_details_offer_border.dart';
import 'package:mowgli/ui/screens/deal_details/components/offer/deal_details_offer_hop.dart';
import 'package:mowgli/ui/screens/deal_details/model/deal_details_data_content.dart';
import 'package:mowgli/ui/screens/shared/components/bloc/notifications_bloc.dart';
import 'package:mowgli/ui/screens/shared/model/request/request.dart';
import 'package:mowgli/ui/utils/bloc.dart';
import 'package:mowgli/ui/utils/date_ui_utils.dart';
import 'package:mowgli/ui/utils/dialog_utils.dart';
import 'package:mowgli/ui/utils/text_ui_utils.dart';
import 'package:mowgli/utils/app_utils.dart';
import 'package:mowgli/utils/platform_utils.dart';
import 'package:share/share.dart';

const double kDealDetailsOfferEndPadding = 11.0;
const double kDealDetailsOfferChevronSize = 30.0;

class DealDetailsOfferCell extends StatefulWidget {
  final DealDetailsOffer offer;
  final Request request;
  final bool openByDefault;
  final ValueChanged<Key> onItemOpened;
  final ValueChanged<Key> onItemClosed;

  DealDetailsOfferCell(
      {this.offer,
      this.request,
      this.openByDefault = true,
      this.onItemOpened,
      this.onItemClosed,
      Key key})
      : super(key: key);

  @override
  _DealDetailsOfferCellState createState() => _DealDetailsOfferCellState();
}

class _DealDetailsOfferCellState extends State<DealDetailsOfferCell>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _iconTurns;

  final Animatable<double> _iconTurnTween = Tween<double>(begin: 26.0, end: 0.0)
      .chain(CurveTween(curve: Curves.fastOutSlowIn));

  bool isExpanded = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 150), vsync: this);
    _iconTurns = _controller.drive(_iconTurnTween);
    _controller.addListener(onAnimationChanged);

    if (widget.openByDefault) {
      isExpanded = true;
      _controller.value = 1.0;
    } else {
      isExpanded = false;
      _controller.value = 0.0;
    }
  }

  @override
  void didUpdateWidget(DealDetailsOfferCell oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.openByDefault && !isExpanded) {
      isExpanded = true;
      _controller.value = 1.0;
    } else if (!widget.openByDefault && isExpanded) {
      isExpanded = false;
      _controller.value = 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: DealDetailsOfferBorder(_iconTurns.value),
        borderRadius: const BorderRadius.all(Radius.circular(6.0)),
      ),
      padding: const EdgeInsetsDirectional.only(
          start: 9.0,
          end: 9.0,
          top: kDealDetailsOfferEndPadding,
          bottom: kDealDetailsOfferEndPadding),
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.black.withOpacity(0.04),
        customBorder: DealDetailsOfferInkWellBorder(
            chevronHeight: !isExpanded ? kDealDetailsOfferChevronSize : 0.0,
            endPadding: kDealDetailsOfferEndPadding),
        onTap: () {
          if (isExpanded) {
            collapse();
          } else {
            expand();
          }
        },
        child: Column(
          children: <Widget>[
            _DealDetailsTopContainer(widget.offer, widget.request),
            _DealDetailsBottomContainer(
                offer: widget.offer,
                isExpanded: isExpanded,
                onSeparatorClicked: collapse),
            Offstage(
              offstage: isExpanded,
              child: Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: _Chevron(
                  key: Key('Collapsed_Chevron'),
                  direction: !isExpanded
                      ? VerticalDirection.up
                      : VerticalDirection.down,
                  onTap: expand,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void expand() {
    setState(() => isExpanded = true);
    _controller.forward();

    if (widget.onItemOpened != null) {
      widget.onItemOpened(widget.key);
    }

    ApplicationServices.analytics.eventShowMowgliTipsClicked();
  }

  void collapse() {
    setState(() => isExpanded = false);
    _controller.reverse();

    if (widget.onItemClosed != null) {
      widget.onItemClosed(widget.key);
    }
  }

  void onAnimationChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    _controller.removeListener(onAnimationChanged);
    _controller.dispose();
    super.dispose();
  }
}

class _DealDetailsTopContainer extends StatelessWidget {
  final DealDetailsOffer offer;
  final Request request;

  _DealDetailsTopContainer(this.offer, this.request);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 1.0),
          child: _DealDetailsFirstLine(
              dealId: offer.id,
              request: request,
              currency: offer.currency,
              price: offer.price,
              date: offer.date,
              destinationName: offer.destinationName,
              originName: offer.originName,
              fromDate: offer.fromDate,
              toDate: offer.toDate),
        ),
        if (offer.outboundHop != null)
          Padding(
            padding: const EdgeInsetsDirectional.only(
                end: kDealDetailsOfferEndPadding),
            child: DealDetailsHop(hop: offer.outboundHop),
          ),
        if (offer.inboundHop != null)
          Padding(
            padding: const EdgeInsetsDirectional.only(
                end: kDealDetailsOfferEndPadding),
            child: DealDetailsHop(hop: offer.inboundHop),
          ),
      ],
    );
  }
}

class _DealDetailsFirstLine extends StatelessWidget {
  final String dealId;
  final String currency;
  final num price;
  final DateTime date;
  final DateTime fromDate;
  final DateTime toDate;
  final String destinationName;
  final String originName;
  final Request request;

  _DealDetailsFirstLine(
      {@required this.dealId,
      @required this.currency,
      @required this.price,
      @required this.date,
      @required this.destinationName,
      @required this.originName,
      @required this.fromDate,
      @required this.toDate,
      @required this.request});

  @override
  Widget build(BuildContext context) {
    return BlocCreatorWithBuilder<NotificationsBloc, NotificationsState>(
        create: (_) => NotificationsBloc(),
        builder: (BuildContext context, NotificationsState state) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    Translations.of(context).genericPriceItem(
                        value: TextUIUtils.formatPrice(price)),
                    style: AppTextStyles.h1,
                  ),
                  Text(
                    Translations.of(context).genericTimeItem(
                        duration: DateUIUtils.getDiffDuration(
                            Translations.of(context), date)),
                    style: AppTextStyles.pW500,
                  )
                ],
              ),
              Row(children: <Widget>[
                InkWell(
                  onTap: () async {
                    state.when((_) => unsubscribeToNotifications(context),
                        initial: () async {
                          bool res = await ApplicationServices.notifications
                              .enableNotifications();

                          if (res == true) {
                            await ApplicationServices.analytics
                                .eventFollowDealEnabled(originName,
                                    destinationName, fromDate, toDate);

                            context
                                .bloc<NotificationsBloc>()
                                .subscribeToNotifications(
                                    request: request,
                                    currentPrice: price,
                                    currentPriceCurrency: currency,
                                    dealId: dealId,
                                    subscriptionType:
                                        SubscriptionType.dealFollow,
                                    fromLabel: originName,
                                    toLabel: destinationName);
                          }
                        },
                        loading: () => null,
                        error: (_) => null);
                  },
                  customBorder: const CircleBorder(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      AppIcons.bell,
                      color: state.when((_) => AppColors.primary,
                          initial: () => AppColors.text3,
                          loading: () => AppColors.text3,
                          error: (_) => AppColors.buttonErrorBackground),
                      size: 26.0,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    await ApplicationServices.analytics.eventShareClicked();

                    await Share.share(Translations.of(context).detailsShareDeal(
                        destination: destinationName,
                        price: TextUIUtils.formatPrice(price),
                        iosLink:
                            'https://apps.apple.com/fr/app/mowgli-deals-de-vols/id1515349938',
                        packageName: await AppUtils.packageName));
                  },
                  customBorder: const CircleBorder(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      PlatformUtils.isAndroid
                          ? AppIcons.shareAndroid
                          : AppIcons.shareIos,
                      color: AppColors.text3,
                      size: 26.0,
                    ),
                  ),
                )
              ])
            ],
          );
        });
  }

  void unsubscribeToNotifications(BuildContext context) {
    context.bloc<NotificationsBloc>().unsubscribeToNotifications();
  }
}

class MessageNotification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Translations translations = Translations.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SafeArea(
        top: true,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
          ),
          padding: const EdgeInsets.all(23.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(AppIcons.bell,
                  color: AppColors.buttonDarkBackground, size: 30.0),
              const SizedBox(width: 20.0),
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                    Text(
                      translations.overlayMessageAlertCreatedTitle,
                      style: AppTextStyles.h4Bold.copyWith(
                          color: AppColors.dealDetailsNotificationsContent,
                          height: 1.3),
                    ),
                    Text(
                      translations.overlayMessageAlertCreated,
                      textAlign: TextAlign.start,
                      style: AppTextStyles.h4Bold.copyWith(
                          color: AppColors.dealDetailsNotificationsContent,
                          height: 1.3),
                    ),
                  ]))
            ],
          ),
        ),
      ),
    );
  }
}

class _DealDetailsBottomContainer extends StatelessWidget {
  final DealDetailsOffer offer;
  final bool isExpanded;
  final VoidCallback onSeparatorClicked;

  _DealDetailsBottomContainer(
      {@required this.offer,
      @required this.isExpanded,
      this.onSeparatorClicked});

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: !isExpanded,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _Separator(onTap: onSeparatorClicked, visible: isExpanded),
          Padding(
            padding: const EdgeInsetsDirectional.only(
                end: kDealDetailsOfferEndPadding),
            child: _TipsContainer(tips: offer.tips),
          ),
          const SizedBox(height: 30.0),
          _OfferCheckAvailabilityButton(offer: offer)
        ],
      ),
    );
  }
}

class _Separator extends StatelessWidget {
  final VoidCallback onTap;
  final bool visible;

  _Separator({this.onTap, this.visible = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: visible ? 1.0 : 0.0,
            color: AppColors.cardBorder,
          ),
        ),
        _Chevron(
          key: Key('Expanded_Chevron'),
          onTap: onTap,
          direction: visible ? VerticalDirection.down : VerticalDirection.up,
        ),
      ],
    );
  }
}

class _Chevron extends StatefulWidget {
  final VoidCallback onTap;
  final VerticalDirection direction;

  _Chevron({this.direction = VerticalDirection.down, this.onTap, Key key})
      : super(key: key);

  @override
  _ChevronState createState() => _ChevronState();
}

class _ChevronState extends State<_Chevron>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _iconTurns;

  final Animatable<double> _iconTurnTween = Tween<double>(begin: 0.0, end: 0.5)
      .chain(CurveTween(curve: Curves.fastOutSlowIn));

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: kThemeAnimationDuration, vsync: this);
    _iconTurns = _controller.drive(_iconTurnTween);

    if (widget.direction == VerticalDirection.up) {
      _controller.value = pi;
    }
  }

  @override
  void didUpdateWidget(_Chevron oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.direction != oldWidget.direction) {
      if (widget.direction == VerticalDirection.down) {
        _controller.reverse();
      } else {
        _controller.forward();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kDealDetailsOfferChevronSize,
      height: kDealDetailsOfferChevronSize,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.cardBorder),
          shape: BoxShape.circle),
      child: InkWell(
        customBorder: CircleBorder(),
        onTap: widget.onTap,
        child: RotationTransition(
          turns: _iconTurns,
          child: Icon(
            AppIcons.chevronDown,
            color: AppColors.primaryDarkAlt,
            size: 10.0,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _TipsContainer extends StatelessWidget {
  final DealDetailsOfferTips tips;

  _TipsContainer({@required this.tips}) : assert(tips != null);

  @override
  Widget build(BuildContext context) {
    String badge = _badgeLabel(Translations.of(context));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: <Widget>[
            Text(
              Translations.of(context).detailsTipsTitle,
              style: AppTextStyles.h3Bold,
            ),
            if (badge != null) ...[
              const SizedBox(width: 11.0),
              Badge.superDeal(label: BadgeLabel(badge))
            ]
          ],
        ),
        if (tips.hasTips) const SizedBox(height: 21.0),
        if (tips.hasLowestPriceTip) _TipItem(tip: tips.lowestPrice),
        if (tips.hasTips) const SizedBox(height: 30.0),
        if (tips.hasAveragePriceTip) _TipItem(tip: tips.averagePrice)
      ],
    );
  }

  String _badgeLabel(Translations translations) {
    if (tips.averagePrice.type ==
        DealDetailsOfferTipAveragePriceType.superDeal) {
      return translations.detailsTipsBadgeSuperDeal;
    }

    return null;
  }
}

class _TipItem extends StatelessWidget {
  final DealDetailsOfferTip tip;

  _TipItem({@required this.tip}) : assert(tip != null);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _TipItemIcon(tip),
        const SizedBox(width: 12.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                tip.title,
                style: AppTextStyles.h4Medium
                    .copyWith(color: AppColors.primaryDarkAlt),
              ),
              const SizedBox(height: 1.0),
              HTML.toRichText(context, tip.description)
            ],
          ),
        )
      ],
    );
  }
}

class _TipItemIcon extends StatelessWidget {
  final IconData data;

  factory _TipItemIcon(DealDetailsOfferTip tip) {
    if (tip is DealDetailsOfferTipAveragePrice) {
      return _TipItemIcon.averagePrice();
    } else if (tip is DealDetailsOfferTipLowestPrice) {
      return _TipItemIcon.lowestPrice();
    }

    throw Exception('Unknown tip type ${tip.runtimeType}');
  }

  const _TipItemIcon.averagePrice() : data = AppIcons.deal;

  const _TipItemIcon.lowestPrice() : data = AppIcons.priceHistory;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 34.0,
      height: 34.0,
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: AppColors.primaryDarkAlt,
            borderRadius: const BorderRadius.all(Radius.circular(6.0))),
        child: Center(
          child: Icon(
            data,
            size: 21.0,
            color: AppColors.dealTipIcon,
          ),
        ),
      ),
    );
  }
}

class _OfferCheckAvailabilityButton extends StatelessWidget {
  final DealDetailsOffer offer;

  _OfferCheckAvailabilityButton({@required this.offer});

  @override
  Widget build(BuildContext context) {
    Translations translations = Translations.of(context);

    return AppButton(
      label: translations.dealDetailsOfferButtonCheckAvailability,
      type: AppButtonType.normalDark,
      onPressed: () {
        ApplicationServices.analytics.eventCheckAvailability(offer?.originName,
            offer?.destinationName, offer?.fromDate, offer?.toDate);

        DialogUtils.showErrorDialog(context,
            title:
                translations.dealDetailsOfferButtonCheckAvailabilityDialogTitle,
            text: translations
                .dealDetailsOfferButtonCheckAvailabilityDialogMessage);
      },
    );
  }
}
