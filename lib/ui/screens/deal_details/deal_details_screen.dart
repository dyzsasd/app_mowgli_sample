import 'package:flutter/material.dart';
import 'package:mowgli/ui/components/appbar.dart';
import 'package:mowgli/ui/resources/app_colors.dart';
import 'package:mowgli/ui/resources/translations.dart';
import 'package:mowgli/ui/screens/alerts/subscriptions/bloc/alerts_subscriptions_bloc.dart';
import 'package:mowgli/ui/screens/deal_details/bloc/deal_details_bloc.dart';
import 'package:mowgli/ui/screens/deal_details/components/deal_details_body.dart';
import 'package:mowgli/ui/screens/shared/model/filters/filters.dart';
import 'package:mowgli/ui/screens/shared/model/location.dart';
import 'package:mowgli/ui/screens/shared/model/request/request.dart';
import 'package:mowgli/ui/utils/image_utils.dart';
import 'package:mowgli/utils/text_utils.dart';
import 'package:provider/provider.dart';

class DealDetailsScreen extends StatelessWidget {
  final DealDetailsScreenArgs args;

  DealDetailsScreen(this.args) : assert(args != null);

  @override
  Widget build(BuildContext context) {
    Request request = args.request;
    if (request.filters == null) {
      request = request.copyWith(filters: Filters.empty());
    }
    return Provider<DealDetailsScreenArgs>.value(
      value: args,
      child: BlocProvider<DealDetailsBloc>(
        create: (_) => DealDetailsBloc(
            args.dealId, request, args.arrival, context.imagesWidth),
        lazy: false,
        child: Scaffold(
          appBar: _DealDetailsAppBar(args),
          body: DealDetailsBody(),
          backgroundColor: AppColors.dealDetailsScaffoldBackground,
        ),
      ),
    );
  }
}

class DealDetailsScreenArgs {
  final String dealId;
  final Location departure;
  final Location arrival;
  final String mainThumbnail;
  final Request request;
  final String heroTag;

  DealDetailsScreenArgs.request({
    @required this.request,
    this.departure,
    this.arrival,
    this.mainThumbnail,
    this.dealId,
    this.heroTag,
  }) : assert(request != null);

  DealDetailsScreenArgs.dealId({
    @required this.dealId,
    @required this.request,
    this.departure,
    this.arrival,
    this.mainThumbnail,
    this.heroTag,
  })  : assert(dealId != null),
        assert(request != null);

  static DealDetailsScreenArgs of(BuildContext context) {
    return Provider.of<DealDetailsScreenArgs>(context, listen: false);
  }
}

class _DealDetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final DealDetailsScreenArgs args;

  _DealDetailsAppBar(this.args);

  @override
  Widget build(BuildContext context) {
    String title;

    if (TextUtils.isEmpty(args.departure?.label) ||
        TextUtils.isEmpty(args.arrival?.label)) {
      title = Translations.of(context).dealDetailsAppBarTitleEmpty;
    } else {
      title = Translations.of(context).dealDetailsAppBarTitle(
          departureCity: args.departure.label, arrivalCity: args.arrival.label);
    }

    return MowgliAppBar(
      context: context,
      bottomLineBorder: false,
      title: Text(title),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
