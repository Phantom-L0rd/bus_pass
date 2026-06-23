import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timelines_plus/timelines_plus.dart';
import '../models/bus_schedule.dart';
import '../main.dart'; // Required for themeNotifier

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  late DateTime _selectedDate;
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _nextBusKey = GlobalKey();

  // Filter States
  String? _selectedResidence;
  ScheduleDirection? _selectedDirection;
  ScheduleType? _selectedType;

  final List<String> _residences = [
    'Madeira',
    'Drie Lillies',
    'Arebeng 1',
    'Arebeng 2',
    'Arebeng 3',
    'Town'
  ];

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _selectedDate = DateTime(now.year, now.month, now.day);
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToNextBus());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToNextBus() {
    if (_nextBusKey.currentContext != null) {
      Scrollable.ensureVisible(
        _nextBusKey.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        alignment: 0.1,
      );
    }
  }

  List<DateTime> _getNext7Days() {
    final now = DateTime.now();
    return List.generate(
        7, (index) => DateTime(now.year, now.month, now.day + index));
  }

  void _showFilterPanel() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      isScrollControlled: true,
      // Wrap in ValueListenableBuilder so background updates instantly when toggling dark mode
      builder: (ctx) => ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (context, _, __) {
          final colorScheme = Theme.of(context).colorScheme;

          return Container(
            color: colorScheme.surface, // Dynamic background
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Filters',
                    style: GoogleFonts.bebasNeue(
                        fontSize: 32, color: colorScheme.onSurface)),
                const SizedBox(height: 16),
                Text('Type',
                    style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onSurfaceVariant)),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: ScheduleType.values.map((type) {
                    final isSelected = _selectedType == type;
                    return FilterChip(
                      label: Text(type.name.capitalize()),
                      selected: isSelected,
                      onSelected: (val) {
                        setState(() => _selectedType = val ? type : null);
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                Text('Direction',
                    style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onSurfaceVariant)),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: ScheduleDirection.values.map((dir) {
                    final label = dir == ScheduleDirection.toCampus
                        ? 'To Campus'
                        : 'From Campus';
                    final isSelected = _selectedDirection == dir;
                    return FilterChip(
                      label: Text(label),
                      selected: isSelected,
                      onSelected: (val) {
                        setState(() => _selectedDirection = val ? dir : null);
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                Text('Residence / Route',
                    style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onSurfaceVariant)),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: _residences.map((res) {
                    final isSelected = _selectedResidence == res;
                    return FilterChip(
                      label: Text(res),
                      selected: isSelected,
                      onSelected: (val) {
                        setState(() => _selectedResidence = val ? res : null);
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        _selectedType = null;
                        _selectedDirection = null;
                        _selectedResidence = null;
                      });
                    },
                    child: Text('Clear All Filters',
                        style: TextStyle(color: colorScheme.primary)),
                  ),
                )
              ],
            ),
          );
        },
      ),
    ).then((_) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToNextBus());
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme; // Grab scheme once

    // 1. Fetch Data
    List<BusScheduleItem> allItems =
        BusScheduleData.getScheduleForDate(_selectedDate);
    final now = DateTime.now();

    // 2. Apply Filters
    if (_selectedType != null) {
      allItems = allItems.where((e) => e.type == _selectedType).toList();
    }
    if (_selectedDirection != null) {
      allItems =
          allItems.where((e) => e.direction == _selectedDirection).toList();
    }
    if (_selectedResidence != null) {
      allItems = allItems
          .where((e) => e.stops.any((s) => s.contains(_selectedResidence!)))
          .toList();
    }

    // 3. Sort chronologically
    allItems.sort((a, b) => a.time.compareTo(b.time));

    // 4. Determine past vs upcoming
    bool isAnyFilterActive = _selectedType != null ||
        _selectedDirection != null ||
        _selectedResidence != null;
    int? nextBusIndex;
    if (!isAnyFilterActive) {
      nextBusIndex = allItems
          .indexWhere((item) => item.getParsedTime(_selectedDate).isAfter(now));
      if (nextBusIndex == -1) nextBusIndex = null;
    }

    return Column(
      children: [
        // Top Bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: colorScheme.surface, // Dynamic
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<DateTime>(
                      value: _selectedDate,
                      isExpanded: true,
                      items: _getNext7Days().map((date) {
                        const days = [
                          'Monday',
                          'Tuesday',
                          'Wednesday',
                          'Thursday',
                          'Friday',
                          'Saturday',
                          'Sunday'
                        ];
                        return DropdownMenuItem(
                          value: date,
                          child: Text(
                            days[date.weekday - 1],
                            style: GoogleFonts.dmSans(
                              fontWeight: FontWeight.w600,
                              color: colorScheme.onSurface, // Dynamic
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() => _selectedDate = value);
                          WidgetsBinding.instance
                              .addPostFrameCallback((_) => _scrollToNextBus());
                        }
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                decoration: BoxDecoration(
                  color: isAnyFilterActive
                      ? colorScheme.primary
                      : colorScheme.surface, // Dynamic
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.tune,
                    color: isAnyFilterActive
                        ? colorScheme.onPrimary
                        : colorScheme.onSurface, // Dynamic
                  ),
                  onPressed: _showFilterPanel,
                ),
              )
            ],
          ),
        ),

        // Timeline List
        Expanded(
          child: allItems.isEmpty
              ? Center(
                  child: Text(
                    'No buses found for this filter',
                    style:
                        GoogleFonts.dmSans(color: colorScheme.onSurfaceVariant),
                  ),
                )
              : Timeline.tileBuilder(
                  controller: _scrollController,
                  theme: TimelineThemeData(
                    nodePosition: 0.2,
                    connectorTheme: ConnectorThemeData(
                      thickness: 2.0,
                      color: colorScheme
                          .outlineVariant, // Dynamic line color fallback
                    ),
                  ),
                  builder: TimelineTileBuilder.connected(
                    itemCount: allItems.length,

                    // LEFT SIDE: The Time
                    oppositeContentsBuilder: (context, index) {
                      final item = allItems[index];
                      final isNext = index == nextBusIndex;

                      return Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Text(
                          key: isNext ? _nextBusKey : null,
                          item.time,
                          textAlign: TextAlign.right,
                          style: GoogleFonts.dmSans(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            // Uses Primary color for next bus, standard text otherwise
                            color: isNext
                                ? colorScheme.primary
                                : colorScheme.onSurfaceVariant,
                          ),
                        ),
                      );
                    },

                    // RIGHT SIDE: The Bus Card
                    contentsBuilder: (context, index) {
                      final item = allItems[index];
                      final isNext = index == nextBusIndex;

                      return Container(
                        margin: const EdgeInsets.only(left: 16, bottom: 16),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          // Inverts perfectly! Black/White in light, White/Black in dark
                          color: isNext
                              ? colorScheme.onSurface
                              : colorScheme.surface,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: colorScheme.shadow
                                  .withOpacity(isNext ? 0.2 : 0.05),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.routeName,
                                    style: GoogleFonts.dmSans(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: isNext
                                          ? colorScheme.surface.withOpacity(0.8)
                                          : colorScheme.onSurface,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    item.stops.join(' → '),
                                    style: GoogleFonts.dmSans(
                                      fontSize: 11,
                                      color: isNext
                                          ? colorScheme.surface.withOpacity(0.6)
                                          : colorScheme.onSurfaceVariant,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            if (item.busCount > 1)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: isNext
                                      ? colorScheme.surface.withOpacity(0.2)
                                      : colorScheme.onSurface.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  'x${item.busCount}',
                                  style: GoogleFonts.dmSans(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    color: isNext
                                        ? colorScheme.surface
                                        : colorScheme.onSurface,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      );
                    },

                    indicatorBuilder: (context, index) {
                      final item = allItems[index];
                      final itemTime = item.getParsedTime(_selectedDate);
                      final isPast = itemTime.isBefore(now);

                      if (isPast) {
                        return DotIndicator(
                          color: colorScheme.onSurface,
                          size: 16,
                        );
                      } else {
                        return OutlinedDotIndicator(
                          borderWidth: 2,
                          color: colorScheme.onSurface,
                          size: 16,
                        );
                      }
                    },

                    connectorBuilder: (context, index, type) {
                      final item = allItems[index];
                      final itemTime = item.getParsedTime(_selectedDate);
                      final isPast = itemTime.isBefore(now);

                      if (isPast) {
                        return SolidLineConnector(color: colorScheme.onSurface);
                      } else {
                        return DashedLineConnector(
                          color: colorScheme
                              .outlineVariant, // Subtle grey for both modes
                          dash: 4,
                          gap: 4,
                        );
                      }
                    },
                  ),
                ),
        ),
      ],
    );
  }
}

// Extension to capitalize enum strings nicely
extension StringExtension on String {
  String capitalize() {
    if (isEmpty) return this;
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
