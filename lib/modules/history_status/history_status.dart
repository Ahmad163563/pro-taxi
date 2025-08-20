import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utills/controller/theme_controller/theme.dart';

enum BookingStatus { upcoming, completed, cancelled }

class Booking {
  final String name;
  final String subtitle; // e.g. "Morning Session, B1"
  final DateTime time;
  final BookingStatus status;

  Booking({
    required this.name,
    required this.subtitle,
    required this.time,
    required this.status,
  });
}

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  BookingStatus _segment = BookingStatus.upcoming;

  // TODO: Replace with your API data
  final List<Booking> _all = <Booking>[
    Booking(
      name: 'William',
      subtitle: 'Morning Session, B1',
      time: DateTime.now().add(const Duration(hours: 2)),
      status: BookingStatus.upcoming,
    ),
    Booking(
      name: 'Henry',
      subtitle: 'Morning Session, B2',
      time: DateTime.now().add(const Duration(days: 1)),
      status: BookingStatus.upcoming,
    ),
    Booking(
      name: 'Henry',
      subtitle: 'Morning Session, B2',
      time: DateTime.now().add(const Duration(days: 1)),
      status: BookingStatus.upcoming,
    ),
    Booking(
      name: 'Henry',
      subtitle: 'Morning Session, B2',
      time: DateTime.now().add(const Duration(days: 1)),
      status: BookingStatus.upcoming,
    ),
    Booking(
      name: 'Henry',
      subtitle: 'Morning Session, B2',
      time: DateTime.now().add(const Duration(days: 1)),
      status: BookingStatus.upcoming,
    ),
    Booking(
      name: 'Henry',
      subtitle: 'Morning Session, B2',
      time: DateTime.now().add(const Duration(days: 1)),
      status: BookingStatus.upcoming,
    ),
    Booking(
      name: 'Noah',
      subtitle: 'Morning Session, C1',
      time: DateTime.now().subtract(const Duration(hours: 3)),
      status: BookingStatus.completed,
    ),
    Booking(
      name: 'Noah',
      subtitle: 'Morning Session, C1',
      time: DateTime.now().subtract(const Duration(hours: 3)),
      status: BookingStatus.completed,
    ),
    Booking(
      name: 'Noah',
      subtitle: 'Morning Session, C1',
      time: DateTime.now().subtract(const Duration(hours: 3)),
      status: BookingStatus.completed,
    ),
    Booking(
      name: 'Noah',
      subtitle: 'Morning Session, C1',
      time: DateTime.now().subtract(const Duration(hours: 3)),
      status: BookingStatus.completed,
    ),
    Booking(
      name: 'Mia',
      subtitle: 'Evening Session, D4',
      time: DateTime.now().subtract(const Duration(days: 2)),
      status: BookingStatus.cancelled,
    ),
    Booking(
      name: 'Mia',
      subtitle: 'Evening Session, D4',
      time: DateTime.now().subtract(const Duration(days: 2)),
      status: BookingStatus.cancelled,
    ),
    Booking(
      name: 'Mia',
      subtitle: 'Evening Session, D4',
      time: DateTime.now().subtract(const Duration(days: 2)),
      status: BookingStatus.cancelled,
    ),
    Booking(
      name: 'Mia',
      subtitle: 'Evening Session, D4',
      time: DateTime.now().subtract(const Duration(days: 2)),
      status: BookingStatus.cancelled,
    ),
    Booking(
      name: 'Mia',
      subtitle: 'Evening Session, D4',
      time: DateTime.now().subtract(const Duration(days: 2)),
      status: BookingStatus.cancelled,
    ),
  ];

  List<Booking> get _filtered =>
      _all.where((b) => b.status == _segment).toList();

  @override
  Widget build(BuildContext context) {
    // iOS feel but safe on Android too
    final theme = Theme.of(context);
    final ThemeController themeController = Get.find();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // AppBar row
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
              child: Row(
                children: [
                  CupertinoButton(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    minSize: 0,
                    onPressed: () => Navigator.maybePop(context),
                    child: const Row(
                      children: [
                        SizedBox(width: 4),
                        Text("Back"),
                      ],
                    ),
                  ),
                  const Spacer(),
                   Text(
                    "History",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600,color: Theme.of(context).colorScheme.onSurface,),
                  ),
                  const Spacer(),
                  Obx(() => IconButton(
                      onPressed: () {
                        themeController.toggleTheme();
                      },
                      icon: Icon(
                        themeController.isDark.value == true
                            ? Icons.light_mode_outlined
                            : Icons.dark_mode_outlined,
                      ))),
                ],
              ),
            ),

            // Segmented control
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: CupertinoSlidingSegmentedControl<BookingStatus>(
                groupValue: _segment,
                thumbColor: theme.colorScheme.primary,
                backgroundColor: theme.colorScheme.surfaceContainerHighest
                    .withOpacity(0.6),
                children: {
                  BookingStatus.upcoming: _segLabel(context,"Upcoming",
                      selected: _segment == BookingStatus.upcoming),
                  BookingStatus.completed: _segLabel(context,"Completed",
                      selected: _segment == BookingStatus.completed),
                  BookingStatus.cancelled: _segLabel(context,"Cancelled",
                      selected: _segment == BookingStatus.cancelled),
                },
                onValueChanged: (v) {
                  if (v != null) setState(() => _segment = v);
                },
              ),
            ),

            // List
            Expanded(
              child: _filtered.isEmpty
                  ? _emptyState(_segment)
                  : ListView.separated(
                padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
                itemCount: _filtered.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (_, i) => _BookingTile(
                  booking: _filtered[i],
                  onCancel: _segment == BookingStatus.upcoming
                      ? () => _cancel(_filtered[i])
                      : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Helpers ---

  Widget _segLabel(BuildContext context, String text, {required bool selected}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 13.5,
          fontWeight: FontWeight.w600,
          color: selected
              ? Colors.white
              : Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }

  Widget _emptyState(BookingStatus s) {
    final msg = switch (s) {
      BookingStatus.upcoming => "No upcoming bookings",
      BookingStatus.completed => "No completed bookings",
      BookingStatus.cancelled => "No cancelled bookings",
    };
    return Center(
      child: Text(
        msg,
        style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
        ),
      ),
    );
  }

  void _cancel(Booking b) {
    setState(() {
      final idx = _all.indexOf(b);
      if (idx != -1) {
        _all[idx] = Booking(
          name: b.name,
          subtitle: b.subtitle,
          time: b.time,
          status: BookingStatus.cancelled,
        );
        _segment = BookingStatus.cancelled; // jump to cancelled tab
      }
    });
  }
}

class _BookingTile extends StatelessWidget {
  const _BookingTile({
    required this.booking,
    this.onCancel,
  });

  final Booking booking;
  final VoidCallback? onCancel;

  String _timeLabel() {
    final now = DateTime.now();
    final diff = booking.time.difference(now);

    if (booking.status == BookingStatus.upcoming) {
      if (diff.inDays == 0) {
        return "Today at ${_hhmm(booking.time)}";
      } else if (diff.inDays == 1) {
        return "Tomorrow at ${_hhmm(booking.time)}";
      }
      return "${_date(booking.time)} at ${_hhmm(booking.time)}";
    } else if (booking.status == BookingStatus.completed) {
      if (diff.inDays.abs() == 0) {
        return "Today at ${_hhmm(booking.time)}";
      }
      return "${_date(booking.time)} at ${_hhmm(booking.time)}";
    } else {
      // cancelled
      return "${_date(booking.time)} at ${_hhmm(booking.time)}";
    }
  }

  static String _hhmm(DateTime t) {
    final h = t.hour % 12 == 0 ? 12 : t.hour % 12;
    final m = t.minute.toString().padLeft(2, '0');
    final ampm = t.hour >= 12 ? "pm" : "am";
    return "$h:$m $ampm";
    // For 24h format, replace with: "${t.hour.toString().padLeft(2,'0')}:${t.minute.toString().padLeft(2,'0')}"
  }

  static String _date(DateTime t) =>
      "${t.day.toString().padLeft(2, '0')}/${t.month.toString().padLeft(2, '0')}/${t.year}";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final statusColor = switch (booking.status) {
      BookingStatus.upcoming => Colors.green,
      BookingStatus.completed => theme.colorScheme.secondary,
      BookingStatus.cancelled => Colors.pink,
    };

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withOpacity(0.5),
        borderRadius: BorderRadius.circular(18),
      ),
      padding: const EdgeInsets.all(14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Leading circle
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              booking.name.characters.first.toUpperCase(),
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(width: 12),
          // Texts
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  booking.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  booking.subtitle,
                  style: TextStyle(fontSize: 13,  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),),
                ),
                const SizedBox(height: 8),
                Text(
                  _timeLabel(),
                  style: const TextStyle(fontSize: 12.5, color: Colors.black54),
                ),
              ],
            ),
          ),
          // Trailing action / label
          onCancel == null
              ? Text(
            booking.status == BookingStatus.cancelled
                ? "Cancel"
                : booking.status == BookingStatus.completed
                ? "Done"
                : "",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: statusColor,
            ),
          )
              : CupertinoButton(
            padding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            minSize: 0,
            onPressed: onCancel,
            child: const Text(
              "Cancel",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.pink,
              ),
            ),
          ),
        ],
      ),
    );
  }
}