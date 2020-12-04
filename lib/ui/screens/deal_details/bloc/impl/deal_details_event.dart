part of 'deal_details_bloc_impl.dart';

abstract class _DealDetailsEvent {
  const _DealDetailsEvent();
}

class _LoadDealEvent extends _DealDetailsEvent {
  final String dealId;
  final Request request;

  _LoadDealEvent({this.dealId, this.request})
      : assert(dealId != null || request != null);
}

class _OverrideDealEvent extends _DealDetailsEvent {
  final Filters filters;
  final String dealId;

  _OverrideDealEvent(this.filters, this.dealId);
}
