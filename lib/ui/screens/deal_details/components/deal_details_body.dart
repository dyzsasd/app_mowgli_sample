import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mowgli/app/app_services.dart';
import 'package:mowgli/ui/components/buttons.dart';
import 'package:mowgli/ui/components/list.dart';
import 'package:mowgli/ui/components/placeholder.dart';
import 'package:mowgli/ui/resources/app_images.dart';
import 'package:mowgli/ui/resources/translations.dart';
import 'package:mowgli/ui/screens/deal_details/bloc/deal_details_bloc.dart';
import 'package:mowgli/ui/screens/deal_details/components/deal_details_layout.dart';
import 'package:mowgli/ui/screens/deal_details/components/deal_details_notification.dart';
import 'package:mowgli/ui/screens/deal_details/components/deal_details_offer.dart';
import 'package:mowgli/ui/screens/deal_details/deal_details_screen.dart';
import 'package:mowgli/ui/screens/deal_details/model/deal_details_data_content.dart';
import 'package:mowgli/ui/screens/price_calendar/price_calendar_screen.dart';
import 'package:mowgli/ui/screens/routes.dart';
import 'package:mowgli/ui/screens/shared/model/filters/filters.dart';
import 'package:mowgli/ui/screens/shared/model/request/request.dart';
import 'package:mowgli/utils/text_utils.dart';
import 'package:provider/provider.dart';

class DealDetailsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double horizontalPadding = 0;

    if (screenWidth > 600) {
      horizontalPadding = (screenWidth - 600) / 2;
    } else {
      horizontalPadding = 0;
    }

    return Provider<DealDetailsBodyData>.value(
      value: DealDetailsBodyData(horizontalPadding),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _DealPicture(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: BlocBuilder<DealDetailsBloc, DealDetailsState>(
                builder: (BuildContext context, DealDetailsState state) {
                  return state.when(
                      (DealDetailsContent data, _) => _DealList(data: data),
                      loading: () => _DealLoading(),
                      error: () => _DealError());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DealDetailsBodyData {
  final double horizontalPadding;

  DealDetailsBodyData(this.horizontalPadding);

  static DealDetailsBodyData of(BuildContext context) {
    return Provider.of<DealDetailsBodyData>(context);
  }
}

class _DealPicture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double imageHeight;

    if (mediaQuery.orientation == Orientation.portrait) {
      imageHeight = mediaQuery.size.width * 0.52;
    } else {
      imageHeight = mediaQuery.size.height * 0.52;
    }

    return BlocBuilder<DealDetailsBloc, DealDetailsState>(
      builder: (BuildContext context, DealDetailsState state) {
        String thumbnail = state.maybeWhen(
            (DealDetailsContent data, _) => data.mainOffer?.thumbnail,
            orElse: () => null);

        if (TextUtils.isEmpty(thumbnail)) {
          thumbnail = DealDetailsScreenArgs.of(context).mainThumbnail;
        }

        Widget child;
        if (TextUtils.isNotEmpty(thumbnail)) {
          child = CachedNetworkImage(
            imageUrl: thumbnail,
            fit: BoxFit.cover,
            height: imageHeight,
            placeholder: (BuildContext context, String url) =>
                const ImagePlaceholder(),
            errorWidget: (BuildContext context, String url, Object error) =>
                const ImagePlaceholder(),
          );
        } else {
          child = const ImagePlaceholder();
        }

        String heroTag = DealDetailsScreenArgs.of(context).heroTag;
        if (TextUtils.isNotEmpty(heroTag)) {
          child = Hero(tag: heroTag, child: child);
        }

        return SizedBox(
            width: double.infinity, height: imageHeight, child: child);
      },
    );
  }
}

class _DealLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircularProgressIndicator(),
    ));
  }
}

class _DealError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Translations translations = Translations.of(context);

    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Center(
        child: FractionallySizedBox(
          widthFactor: 0.5,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                translations.dealDetailsErrorLabel,
                textAlign: TextAlign.center,
                style: TextStyle(height: 1.5),
              ),
              const SizedBox(height: 20.0),
              AppButton(
                onPressed: () {
                  context.bloc<DealDetailsBloc>().forceReload();
                },
                label: translations.dealDetailsErrorButton,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _DealList extends StatelessWidget {
  final DealDetailsContent data;

  _DealList({@required this.data});

  @override
  Widget build(BuildContext context) {
    int shift = data.mainOffer != null ? 2 : 1;
    int count = shift + (data.sections?.length ?? 0) + 1;

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      // Main offer + sections + button + notifications
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        if (position == 0 && data.mainOffer != null) {
          Request offerRequest = data.request
              .updateWithDates(data.mainOffer.fromDate, data.mainOffer.toDate);
          return Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: _MainOfferCell(data.mainOffer, offerRequest),
          );
        } else if (position == 1) {
          return DealDetailsNotification();
        } else if (position == count - 1) {
          return _PriceCalendarButton(onPressed: () {
            context.bloc<DealDetailsBloc>().state.maybeWhen(
                (DealDetailsContent data, Filters filters) async {
              ApplicationServices.analytics.eventCalendarDealsClicked();

              Object res = await Navigator.of(context).pushNamed(
                AppRoutes.routePriceCalendar,
                arguments: PriceCalendarScreenArgs(data?.request, filters),
              );

              if (res is PriceCalendarScreenResult) {
                context
                    .bloc<DealDetailsBloc>()
                    .overrideContentWith(res.filters, res.dealId);
              }
            }, orElse: () => <dynamic>{});
          });
        }

        if (data.sections != null) {
          DealDetailsSection section =
              data.sections.elementAt(position - shift);

          switch (section.type) {
            case DealDetailsSectionType.row:
              return DealDetailsSectionRow(section: section);
            case DealDetailsSectionType.list:
              return DealDetailsSectionList(section: section);
          }
          throw Exception('Unknown element $section');
        }
      },
    );
  }
}

class _MainOfferCell extends StatelessWidget {
  final DealDetailsOffer offer;
  final Request request;

  _MainOfferCell(this.offer, this.request);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Column(
        children: <Widget>[
          ListItemTitle(
            label: Translations.of(context).dealDetailsMainOfferTitle,
            padding: const EdgeInsetsDirectional.only(
                start: 9.0, end: 9.0, top: 20.0, bottom: 17.0),
          ),
          DealDetailsOfferCell(
            offer: offer,
            request: request,
          ),
        ],
      ),
    );
  }
}

class _PriceCalendarButton extends StatelessWidget {
  final VoidCallback onPressed;

  _PriceCalendarButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Column(
        children: <Widget>[
          ListItemTitle(
            label: Translations.of(context).detailsButtonCalendar,
            padding: const EdgeInsetsDirectional.only(
                start: 9.0, end: 9.0, top: 20.0, bottom: 17.0),
            onPressed: onPressed,
          ),
          Padding(
              padding: const EdgeInsetsDirectional.only(
                  start: 9.0, end: 9.0, top: 20.0, bottom: 17.0),
              child: GestureDetector(
                  onTap: onPressed,
                  child: SvgPicture.asset(AppImages.imageCalendar,
                      fit: BoxFit.cover)))
        ],
      ),
    );
  }
}
