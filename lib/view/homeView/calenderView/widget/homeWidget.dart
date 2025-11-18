import 'package:flutter/material.dart';
import 'package:gt_tbb/commonWidget/custom_text_widget.dart';
import '../../../../commonWidget/custom_alert_dialog.dart';
import 'calenderEventWidget.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  DateTime currentDate = DateTime.now();
  late DateTime selectedDate;
  late int selectedDay;

  @override
  void initState() {
    super.initState();
    selectedDate = currentDate;
    selectedDay = currentDate.day;
  }

  // ✅ Generate demo events for all days
  List<CalendarEvent> getEventsForDay(int day) {
    final dayMod = day % 7;

    switch (dayMod) {
      case 0:
        return [
          CalendarEvent(title: 'Yoga Class', time: '7:00 AM', color: const Color(0xFFF3C3AA)),
          CalendarEvent(title: 'Team Meeting', time: '2:00 PM', color: const Color(0xFFE6E6E6)),
        ];
      case 1:
        return [
          CalendarEvent(title: 'Ballet Class', time: '10:30 AM', color: const Color(0xFFE6E6E6)),
        ];
      case 2:
        return [
          CalendarEvent(
              title: 'Dinner',
              time: '7:30 PM',
              color: const Color(0xFF8A38F5).withOpacity(0.2)),

          CalendarEvent(title: 'Swim Class', time: '6:00 PM', color: const Color(0xFFE6E6E6)),
          CalendarEvent(title: 'Art Workshop', time: '5:00 PM', color: const Color(0xFFF3C3AA)),
        ];
      case 3:
        return [
          CalendarEvent(title: 'Piano Lesson', time: '3:00 PM', color: const Color(0xFF8A38F5).withOpacity(0.2)),
        ];
      case 4:
        return [
          CalendarEvent(title: 'Doctor Appointment', time: '9:00 AM', color: const Color(0xFFE6E6E6)),
        ];
      case 5:
        return [
          CalendarEvent(title: 'Soccer Practice', time: '4:00 PM', color: const Color(0xFFF3C3AA)),
          CalendarEvent(title: 'Study Group', time: '6:00 PM', color: const Color(0xFFE6E6E6)),
        ];
      case 6:
        return [
          CalendarEvent(title: 'Family Time', time: '11:00 AM', color: const Color(0xFFFFCDD2)),
          CalendarEvent(title: 'Movie Night', time: '7:00 PM', color: const Color(0xFFE1BEE7)),
        ];
      default:
        return [];
    }
  }

  // ✅ Two-week calendar date logic
  List<DateTime> getTwoWeeksDates() {
    final startOfWeek = currentDate.subtract(Duration(days: currentDate.weekday - 1));
    return List.generate(14, (i) => startOfWeek.add(Duration(days: i)));
  }

  void previousWeeks() => setState(() {
    currentDate = currentDate.subtract(const Duration(days: 14));
    _resetSelectionIfOutOfRange();
  });

  void nextWeeks() => setState(() {
    currentDate = currentDate.add(const Duration(days: 14));
    _resetSelectionIfOutOfRange();
  });

  void _resetSelectionIfOutOfRange() {
    final dates = getTwoWeeksDates();
    if (selectedDate.isBefore(dates.first) || selectedDate.isAfter(dates.last)) {
      selectedDate = currentDate;
      selectedDay = currentDate.day;
    }
  }

  String getMonthYearText() {
    final dates = getTwoWeeksDates();
    final first = dates.first;
    final last = dates.last;
    return first.month == last.month
        ? '${_monthName(first.month)}, ${first.year}'
        : '${_monthName(first.month)}-${_monthName(last.month)}, ${first.year}';
  }

  String _monthName(int month) => const [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
  ][month - 1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: 20),
                _buildWeekDays(),
                const SizedBox(height: 12),
                _buildWeeksWithEvents(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ✅ Header section
  Widget _buildHeader() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Text(
            getMonthYearText(),
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.keyboard_arrow_down, size: 24),
        ],
      ),
      Row(
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: previousWeeks,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          const SizedBox(width: 16),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: nextWeeks,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    ],
  );

  // ✅ Days header (Mon–Sun)
  Widget _buildWeekDays() {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: days
          .map(
            (day) => Expanded(
          child: Text(
            day,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
            ),
          ),
        ),
      )
          .toList(),
    );
  }

  // ✅ Two-week layout
  Widget _buildWeeksWithEvents() {
    final dates = getTwoWeeksDates();
    return Column(
      children: [
        _buildWeekRow(dates.sublist(0, 7)),
        const SizedBox(height: 20),
        _buildWeekRow(dates.sublist(7, 14)),
      ],
    );
  }

  Widget _buildWeekRow(List<DateTime> weekDates) => Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: weekDates.map(_buildDateCell).toList(),
      ),
      const SizedBox(height: 12),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: weekDates.map((date) => Expanded(child: _buildDayEvents(date))).toList(),
      ),
    ],
  );

  // ✅ Date cell UI
  Widget _buildDateCell(DateTime date) {
    final isSelected = date.day == selectedDay &&
        date.month == selectedDate.month &&
        date.year == selectedDate.year;
    final isToday = date.day == DateTime.now().day &&
        date.month == DateTime.now().month &&
        date.year == DateTime.now().year;

    Color? bgColor;
    if (isSelected) {
      bgColor = const Color(0xFFFFCDD2);
    } else if (isToday) {
      bgColor = const Color(0xFFFFE0B2);
    }

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() {
          selectedDate = date;
          selectedDay = date.day;
        }),
        child: Center(
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: bgColor,
              shape: BoxShape.circle,
              border: isToday && !isSelected
                  ? Border.all(color: const Color(0xFFFF9800), width: 1)
                  : null,
            ),
            child: Center(
              child: Text(
                date.day.toString().padLeft(2, '0'),
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: isSelected || isToday ? FontWeight.w600 : FontWeight.normal,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ✅ Build event list for each day
  Widget _buildDayEvents(DateTime date) {
    final events = getEventsForDay(date.day);
    if (events.isEmpty) return const SizedBox(height: 120);

    return Column(
      children: events.map((event) {
        final isCompleted = event.color.value == const Color(0xFFE6E6E6).value;

        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0, left: 2, right: 2),
          child: GestureDetector(
            onTap: () => _onEventTap(event),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
              decoration: BoxDecoration(
                color: event.color,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 3,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isCompleted)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
                      decoration: BoxDecoration(
                        color: const Color(0XFFA6A6A6),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child:  CustomText(
                        text: "Done",
                        color: Colors.white,
                        fontSize: 6,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  const SizedBox(height: 4),
                  CustomText(
                    text: event.title,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  CustomText(
                    text: event.time,
                    fontSize: 8,
                    color: const Color(0XFF727272),
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  // ✅ Event tap handler
  void _onEventTap(CalendarEvent event) {
    CustomContainerDialog.showContainerDialog();
  }
}
