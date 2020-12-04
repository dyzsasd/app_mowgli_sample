import 'package:flutter/material.dart';
import 'package:mowgli/ui/components/appbar.dart';
import 'package:mowgli/ui/resources/translations.dart';
import 'package:mowgli/ui/screens/alerts/subscriptions/bloc/alerts_subscriptions_bloc.dart';
import 'package:mowgli/ui/screens/filters/components/filters_bottom_button.dart';
import 'package:mowgli/ui/screens/filters/components/filters_list_item.dart';
import 'package:mowgli/ui/screens/filters/items/budget/bloc/filters_budget_bloc.dart';
import 'package:mowgli/ui/screens/filters/items/stopovers/bloc/filters_stopovers_bloc.dart';
import 'package:mowgli/ui/screens/shared/model/filters/filters.dart';
import 'package:mowgli/ui/utils/bloc.dart';
import 'package:mowgli/utils/num_utils.dart';

class FiltersBudgetScreen extends StatelessWidget {
  final FiltersBudgetScreenArgs args;

  FiltersBudgetScreen(this.args);

  @override
  Widget build(BuildContext context) {
    Translations translations = Translations.of(context);

    return BlocCreatorWithListener<BudgetFilterBloc, BudgetFilterState>(
      create: (_) => BudgetFilterBloc(
          args.budget,
          NumUtils.parseInt(translations.filtersItemBudgetMinValue, 0),
          NumUtils.parseInt(translations.filtersItemBudgetMaxValue, 9999)),
      listenWhen: (_, BudgetFilterState state) => state.isReady,
      listener: (BuildContext context, BudgetFilterState state) {
        Navigator.of(context).pop(state.budget);
      },
      child: Scaffold(
        appBar: MowgliAppBar(
          context: context,
          title: Text(translations.filtersItemBudget),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: BlocBuilder<BudgetFilterBloc, BudgetFilterState>(
                  buildWhen: (_, BudgetFilterState state) => state.isCurrent,
                  builder: (BuildContext context, BudgetFilterState state) {
                    return FilterListSliderItem(
                      title: translations.filtersItemBudget,
                      subtitle: translations.filtersItemBudgetSubtitle(
                          startBudget: state.budget.min ?? state.minValue,
                          endBudget: state.budget.max ?? state.maxValue),
                      //minValue: state.minValue,
                      maxValue: state.maxValue,
                      currentMinValue: state.budget.min,
                      currentMaxValue: state.budget.max,
                      onMinChanged: (num value) {
                        context.bloc<BudgetFilterBloc>().changeMinBudget(value);
                      },
                      onMaxChanged: (num value) {
                        context.bloc<BudgetFilterBloc>().changeMaxBudget(value);
                      },
                    );
                  }),
            ),
            BlocBuilder<BudgetFilterBloc, BudgetFilterState>(
              builder: (BuildContext context, BudgetFilterState state) {
                return FiltersBottomButtonContainer(
                  visible: !state.isInitial,
                  label: translations.filtersButtonApply,
                  onPressed: () {
                    context.bloc<BudgetFilterBloc>().generateFilter();
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class FiltersBudgetScreenArgs {
  final BudgetFilter budget;

  FiltersBudgetScreenArgs(this.budget);
}
