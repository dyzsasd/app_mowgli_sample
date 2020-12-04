import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mowgli/ui/divider.dart';
import 'package:mowgli/ui/resources/app_colors.dart';
import 'package:mowgli/ui/resources/app_styles.dart';
import 'package:mowgli/ui/resources/translations.dart';
import 'package:mowgli/utils/date_utils.dart';
import 'package:mowgli/utils/text_utils.dart';
import 'package:vertical_calendar/vertical_calendar.dart';

class Calendar extends StatefulWidget {
  final DateTime minDate;
  final DateTime maxDate;
  final DateTime initialMinDate;
  final DateTime initialMaxDate;
  final ValueChanged<DateTime> onDayPressed;
  final PeriodChanged onRangeSelected;

  Calendar(
      {this.minDate,
      this.maxDate,
      this.initialMinDate,
      this.initialMaxDate,
      this.onDayPressed,
      this.onRangeSelected});

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime minDate;
  DateTime maxDate;

  @override
  void initState() {
    super.initState();
    minDate = widget.initialMinDate;
    maxDate = widget.initialMaxDate;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: const CalendarHeader(),
        ),
        const Separator(),
        Expanded(
          child: VerticalCalendar(
            minDate: widget.minDate ?? DateTime.now(),
            maxDate:
                widget.maxDate ?? DateTime.now().add(const Duration(days: 369)),
            initialMinDate: widget.initialMinDate,
            initialMaxDate: widget.initialMaxDate,
            onRangeSelected: (DateTime min, DateTime max) {
              setState(() {
                minDate = min;
                maxDate = max;
              });

              if (widget.onRangeSelected != null) {
                widget.onRangeSelected(min, max);
              }
            },
            monthBuilder: (BuildContext context, int month, int year) {
              return CalendarMonthView(month: month, year: year);
            },
            dayBuilder: (BuildContext context, DateTime date,
                {bool isSelected}) {
              return CalendarDayView(
                isSelected: isSelected,
                isASingleSelection: minDate != null && maxDate == null,
                isSelectedLimitStart:
                    isSelected && minDate != null && date.isSameDay(minDate),
                isSelectedLimitEnd:
                    isSelected && maxDate != null && date.isSameDay(maxDate),
                date: date,
              );
            },
            onDayPressed: widget.onDayPressed,
            listPadding: const EdgeInsets.symmetric(horizontal: 24.0),
          ),
        )
      ],
    );
  }
}

class CalendarMonthView extends StatelessWidget {
  final int month;
  final int year;

  CalendarMonthView({@required this.month, @required this.year});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
      child: Text(
        DateFormat('MMMM yyyy')
            .format(DateTime(year, month))
            .toFirstLettersUpperCase,
        style: AppTextStyles.h2Bold,
      ),
    );
  }
}

class CalendarDayView extends StatelessWidget {
  final bool isSelected;
  final bool isASingleSelection;
  final bool isSelectedLimitStart;
  final bool isSelectedLimitEnd;
  final DateTime date;

  CalendarDayView(
      {@required this.isSelected,
      @required this.isASingleSelection,
      @required this.isSelectedLimitStart,
      @required this.isSelectedLimitEnd,
      @required this.date});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: CustomPaint(
        painter: _CalendarDayBackgroundPainter(
          isSelected: isSelected,
          isSingle: isASingleSelection,
          isSelectionLimit: isSelectedLimitStart || isSelectedLimitEnd,
          isSelectedEnd:
              !(date.isFirstDayOfMonth && date.weekday == DateTime.sunday) &&
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
                  (date.weekday == DateTime.sunday && !isSelectedLimitStart)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1.5),
          child: Center(
            child: Text(
              DateFormat('d').format(date),
              style: TextStyle(
                  color: textColor,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }

  Color get textColor {
    if (isSelectedLimitStart || isSelectedLimitEnd) {
      return AppColors.white;
    } else {
      return null;
    }
  }
}

class _CalendarDayBackgroundPainter extends CustomPainter {
  final bool isSelected;
  final bool isSingle;
  final bool isSelectionLimit;
  final bool isSelectedStart;
  final bool isSelectedEnd;
  final Paint _paint;

  _CalendarDayBackgroundPainter(
      {this.isSelected,
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

      canvas.drawCircle(
          Offset(size.width / 2, size.height / 2),
          min(size.width, size.height) / 2,
          _paint
            ..color = isSelectionLimit
                ? AppColors.calendarDayRangeLimit
                : AppColors.calendarDayInRange);
    }
  }

  @override
  bool shouldRepaint(_CalendarDayBackgroundPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(_CalendarDayBackgroundPainter oldDelegate) =>
      true;
}

class CalendarHeader extends StatelessWidget {
  const CalendarHeader();

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 22.0),
        child: Table(
          children: <TableRow>[
            TableRow(
              children: List<Text>.generate(
                DateTime.daysPerWeek,
                (int dayOfWeek) => Text(
                  Translations.of(context)
                      .calendarDay((dayOfWeek + 1).toString())
                      .safeSubstring(0, 3),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CalendarTab extends StatelessWidget {
  final String label;
  final bool isSelected;

  CalendarTab({@required this.label, @required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 12.0),
        child: Text(
          label,
          style: AppTextStyles.h2Bold.copyWith(
              color: isSelected ? Theme.of(context).primaryColorDark : null),
        ),
      ),
    );
  }
}
