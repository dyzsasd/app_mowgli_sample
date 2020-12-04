import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:kotlin_flavor/scope_functions.dart';
import 'package:mowgli/app/app.dart';
import 'package:mowgli/ui/components/calendar.dart';
import 'package:mowgli/ui/components/overlay.dart';
import 'package:mowgli/ui/divider.dart';
import 'package:mowgli/ui/resources/app_colors.dart';
import 'package:mowgli/ui/resources/app_styles.dart';
import 'package:mowgli/ui/resources/translations.dart';
import 'package:mowgli/ui/screens/price_calendar/bloc/price_calendar_bloc.dart';
import 'package:mowgli/ui/screens/price_calendar/model/price_calendar_model.dart';
import 'package:mowgli/ui/utils/text_ui_utils.dart';
import 'package:mowgli/utils/date_utils.dart';
import 'package:vertical_calendar/vertical_calendar.dart';

class PriceCalendarView extends StatefulWidget {
  @override
  _PriceCalendarViewState createState() => _PriceCalendarViewState();
}

class _PriceCalendarViewState extends State<PriceCalendarView> {
  DateTime minDate;
  DateTime maxDate;
  String dealId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    minDate =
        context.bloc<PriceCalendarBloc>().state.content.minCalendarSelected;
    maxDate =
        context.bloc<PriceCalendarBloc>().state.content.maxCalendarSelected;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PriceCalendarBloc, PriceCalendarState>(
      listenWhen: (PriceCalendarState oldState, PriceCalendarState newState) =>
          oldState.isLoading != newState.isLoading,
      listener: (BuildContext context, PriceCalendarState state) {
        if (!state.isLoading) {
          resetSelection(false);
        }
      },
      buildWhen: (PriceCalendarState oldState, PriceCalendarState newState) =>
          oldState.isLoading != newState.isLoading,
      builder: (BuildContext context, PriceCalendarState state) {
        return ProgressOverlay(
          showOverlay: state.isLoading,
          child: Column(
            children: <Widget>[
              _CalendarTabs(
                  minDate: minDate,
                  maxDate: maxDate,
                  onMinPressed: () => resetSelection(),
                  onMaxPressed: () => resetMaxSelection()),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: const CalendarHeader(),
                    ),
                    const Separator(),
                    Expanded(
                      child: VerticalCalendar(
                        minDate:
                            state.content.minCalendarRange ?? DateTime.now(),
                        maxDate: state.content.maxCalendarRange ??
                            DateTime.now().add(env.defaultDuration),
                        onDayPressed: (DateTime date) =>
                            onDayPressed(date, state.content),
                        monthBuilder:
                            (BuildContext context, int month, int year) {
                          return CalendarMonthView(month: month, year: year);
                        },
                        dayBuilder: (BuildContext context, DateTime date,
                            {bool isSelected}) {
                          return _CalendarDay(
                              date: date,
                              value: getChildValue(date, state.content),
                              minDateSelected: minDate,
                              maxDateSelected: maxDate,
                              isSelected: isChildSelected(date));
                        },
                        listPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  bool isChildSelected(DateTime date) {
    if (minDate != null && maxDate != null) {
      return date.isBetween(minDate, maxDate);
    } else if (minDate != null) {
      return date == minDate;
    } else {
      return false;
    }
  }

  PriceCalendarValueItem getChildValue(
      DateTime date, PriceCalendarContent content) {
    if (minDate == null) {
      return content.calendarValues[date]?.minPrice;
    } else {
      return content.calendarValues[minDate]?.let((self) => self[date]);
    }
  }

  void onDayPressed(DateTime date, PriceCalendarContent content) {
    bool hasChanged = false;

    // Reset
    if (minDate != null && maxDate != null) {
      resetSelection();
      return;
    }

    if (minDate == null) {
      if (content.calendarValues[date] != null) {
        minDate = date;
        maxDate = null;
        hasChanged = true;

        onMinDateSelected();
      }
    } else {
      if (content.calendarValues[minDate][date] != null) {
        maxDate = date;
        dealId = content.calendarValues[minDate][date].dealId;
        hasChanged = true;

        onRangeSelected();
      }
    }

    if (hasChanged) {
      setState(() {});
    }
  }

  void resetSelection([bool notifyBloc = true]) {
    setState(() {
      minDate = null;
      maxDate = null;
      dealId = null;
    });

    if (notifyBloc) {
      context.bloc<PriceCalendarBloc>().clearCalendarSelection();
    }
  }

  void resetMaxSelection([bool notifyBloc = true]) {
    setState(() {
      maxDate = null;
      dealId = null;
    });

    if (notifyBloc) {
      context.bloc<PriceCalendarBloc>().clearCalendarSelection();
    }
  }

  void onMinDateSelected() {
    context
        .bloc<PriceCalendarBloc>()
        .onCalendarRangeSelected(minDate, null, dealId);
  }

  void onRangeSelected() {
    context
        .bloc<PriceCalendarBloc>()
        .onCalendarRangeSelected(minDate, maxDate, dealId);
  }
}

class _CalendarDay extends StatelessWidget {
  final DateTime date;
  final PriceCalendarValueItem value;
  final DateTime minDateSelected;
  final DateTime maxDateSelected;
  final bool isSelected;

  _CalendarDay(
      {@required this.date,
      this.value,
      this.minDateSelected,
      this.maxDateSelected,
      this.isSelected});

  @override
  Widget build(BuildContext context) {
    bool isSelectedLimitStart = date.isSameDay(minDateSelected);
    bool isSelectedLimitEnd = date.isSameDay(maxDateSelected);

    bool isSelectionLimit = isSelectedLimitStart || isSelectedLimitEnd;

    Color textColor = findTextColor(isSelectionLimit);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: CustomPaint(
        painter: _CalendarDayBackgroundPainter(
            value: value,
            isSelected: isSelected,
            isSingle: minDateSelected != null && maxDateSelected == null,
            isSelectionLimit: isSelectionLimit,
            isSelectedEnd: !(date.isFirstDayOfMonth &&
                    date.weekday == DateTime.sunday) &&
                (!date.isLastDayOfMonth) &&
                (!isSelectedLimitEnd) &&
                ((isSelectedLimitStart && date.weekday != DateTime.sunday) ||
                    date.day == 1 ||
                    date.weekday < DateTime.sunday),
            isSelectedStart: (!date.isFirstDayOfMonth &&
                    date.weekday == DateTime.sunday) &&
                !(date.isLastDayOfMonth && date.weekday == DateTime.monday) &&
                (isSelectedLimitEnd ||
                    date.isLastDayOfMonth ||
                    (date.weekday == DateTime.sunday &&
                        !isSelectedLimitStart))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Center(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final bool hasPrice = value != null;
                final int children = hasPrice ? 2 : 2;

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          maxHeight: constraints.maxHeight / children),
                      child: AutoSizeText(
                        DateFormat('d').format(date),
                        style: AppTextStyles.h4Medium
                            .copyWith(color: textColor, fontSize: 13.0),
                        minFontSize: 5.0,
                      ),
                    ),
                    Visibility(
                      visible: hasPrice,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                            maxHeight: constraints.maxHeight / children),
                        child: AutoSizeText(
                          TextUIUtils.formatPriceWithCurrency(
                              value?.price, '€'),
                          maxLines: 1,
                          minFontSize: 5.0,
                          style: GoogleFonts.robotoCondensed(
                              color: textColor,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Color findTextColor(bool isSelectionLimit) {
    if (value != null || (isSelected && isSelectionLimit)) {
      return AppColors.white;
    } else {
      return null;
    }
  }
}

class _CalendarDayBackgroundPainter extends CustomPainter {
  final PriceCalendarValueItem value;
  final bool isSelected;
  final bool isSingle;
  final bool isSelectionLimit;
  final bool isSelectedStart;
  final bool isSelectedEnd;
  final Paint _paint;

  _CalendarDayBackgroundPainter(
      {this.value,
      this.isSelected,
      this.isSingle,
      this.isSelectionLimit,
      this.isSelectedStart,
      this.isSelectedEnd})
      : _paint = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    if (isSelected) {
      if (!isSingle) {
        if (isSelectedStart) {
          canvas.drawRect(Rect.fromLTWH(0, 0, size.width / 2, size.height),
              _paint..color = AppColors.calendarDayInRange);
        } else if (isSelectedEnd) {
          canvas.drawRect(
              Rect.fromLTWH(size.width / 2, 0, size.width, size.height),
              _paint..color = AppColors.calendarDayInRange);
        }
      }
    }

    canvas.drawCircle(Offset(size.width / 2, size.height / 2),
        min(size.width, size.height) / 2, _paint..color = backgroundColor);
  }

  Color get backgroundColor {
    if (isSelected) {
      if (isSelectionLimit) {
        return AppColors.calendarDayRangeLimit;
      } else {
        return AppColors.calendarDayInRange;
      }
    } else if (value != null) {
      switch (value.type) {
        case PriceCalendarValueItemType.lowest:
          return AppColors.priceCalendarDayUnselectedLowPrice;
        case PriceCalendarValueItemType.medium:
          return AppColors.priceCalendarDayUnselectedMediumPrice;
        case PriceCalendarValueItemType.high:
          return AppColors.priceCalendarDayUnselectedHighPrice;
      }
    }

    return AppColors.priceCalendarDayUnselectedNoPrice;
  }

  @override
  bool shouldRepaint(_CalendarDayBackgroundPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(_CalendarDayBackgroundPainter oldDelegate) =>
      true;
}

class _CalendarTabs extends StatelessWidget {
  final DateTime minDate;
  final DateTime maxDate;
  final VoidCallback onMinPressed;
  final VoidCallback onMaxPressed;

  _CalendarTabs(
      {@required this.minDate,
      @required this.maxDate,
      this.onMinPressed,
      this.onMaxPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
            child: _CalendarDepartureTab(minDate, onPressed: onMinPressed)),
        Expanded(
            child:
                _CalendarArrivalTab(minDate, maxDate, onPressed: onMaxPressed)),
      ],
    );
  }
}

class _CalendarDepartureTab extends StatelessWidget {
  final DateTime date;
  final VoidCallback onPressed;

  _CalendarDepartureTab(this.date, {this.onPressed});

  @override
  Widget build(BuildContext context) {
    Translations translations = Translations.of(context);
    bool isSelected = date == null;

    return InkWell(
      onTap: date != null ? onPressed : null,
      child: CalendarTab(
        label: isSelected
            ? translations.priceCalendarTabDeparture
            : date.formatDate(),
        isSelected: isSelected,
      ),
    );
  }
}

class _CalendarArrivalTab extends StatelessWidget {
  final DateTime minDate;
  final DateTime maxDate;
  final VoidCallback onPressed;

  _CalendarArrivalTab(this.minDate, this.maxDate, {this.onPressed});

  @override
  Widget build(BuildContext context) {
    Translations translations = Translations.of(context);
    bool isSelected = minDate != null && maxDate == null;

    return InkWell(
      onTap: minDate != null && maxDate != null ? onPressed : null,
      child: CalendarTab(
        label: maxDate != null
            ? maxDate.formatDate()
            : translations.priceCalendarTabArrival,
        isSelected: isSelected,
      ),
    );
  }
}
