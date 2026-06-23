import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/student.dart';

class PassScreen extends StatelessWidget {
  final Student student;
  const PassScreen({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    // Grab the color scheme once so we don't have to keep calling Theme.of(context)
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Container(
          width: double.infinity,
          constraints: const BoxConstraints(maxWidth: 400, maxHeight: 600),
          decoration: BoxDecoration(
            color:
                colorScheme.surfaceContainer, // Adapts to Light/Dark background
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                // shadowColor automatically adjusts darkness based on theme
                color: colorScheme.shadow.withOpacity(0.1),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Top Chips (ID and Date)
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _chip(student.studentNumber, colorScheme),
                      _chip(student.date, colorScheme),
                    ],
                  ),
                ),

                // Student Photo
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          width: 160,
                          height: 160,
                          decoration: BoxDecoration(
                            // Inverts automatically! (Black in light, White in dark)
                            color: colorScheme.onSurface,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: student.imagePath != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.asset(
                                    student.imagePath!,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.person_outline_rounded,
                                      // Inverted text color
                                      color: colorScheme.surface,
                                      size: 48,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Student\nPhoto',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: colorScheme.surface,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Student Details
                      Center(
                          child: _chipWide(
                              '${student.surname}, ${student.initials}',
                              colorScheme)),
                      const SizedBox(height: 8),
                      Center(
                          child: _chipSmall(
                              '${student.course} - ${student.year}',
                              colorScheme)),
                      const SizedBox(height: 8),
                      Center(child: _chipSmall(student.residence, colorScheme)),
                    ],
                  ),
                ),

                // U Logo Box
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        // Inverts automatically! (Black in light, White in dark)
                        color: colorScheme.onSurface,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'U',
                          style: GoogleFonts.bebasNeue(
                            // Inverted text color
                            color: colorScheme.surface,
                            fontSize: 36,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- Helper Widgets ---
  // Pass the colorScheme into the helpers so they adapt perfectly

  Widget _chip(String text, ColorScheme colorScheme) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: colorScheme.primary, // Replaced hardcoded BlueGrey
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          text,
          style: GoogleFonts.dmSans(
            color: colorScheme.onPrimary, // Replaced hardcoded White
            fontWeight: FontWeight.w700,
            fontSize: 13,
          ),
        ),
      );

  Widget _chipSmall(String text, ColorScheme colorScheme) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: colorScheme.primary,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          text,
          style: GoogleFonts.dmSans(
            color: colorScheme.onPrimary,
            fontWeight: FontWeight.w700,
            fontSize: 11,
          ),
        ),
      );

  Widget _chipWide(String text, ColorScheme colorScheme) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: colorScheme.primary,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          text,
          style: GoogleFonts.dmSans(
            color: colorScheme.onPrimary,
            fontWeight: FontWeight.w700,
            fontSize: 15,
          ),
        ),
      );
}
