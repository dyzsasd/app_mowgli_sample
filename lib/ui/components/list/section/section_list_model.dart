import 'package:flutter/foundation.dart';
import 'package:mowgli/ui/components/list/destination/list_item_destination_data.dart';
import 'package:mowgli/ui/screens/shared/model/request/request.dart';

class SectionListData {
  final Iterable<ListItemDestinationData> offers;
  final Request request;
  final String nextRequestToken;

  SectionListData(
      {@required this.offers,
      @required this.request,
      @required this.nextRequestToken});
}
