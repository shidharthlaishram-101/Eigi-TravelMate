import 'package:flutter/material.dart';
import 'services/trip_planner_api.dart';
import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class PlannerScreen extends StatefulWidget {
  const PlannerScreen({super.key});

  @override
  State<PlannerScreen> createState() => _PlannerScreenState();
}

class _PlannerScreenState extends State<PlannerScreen> {
  int days = 3;
  int travelers = 1;
  String budget = '₹10,000';
  String selectedInterest = 'Nature';
  String startingPoint = 'Imphal';

  final List<String> interests = [
    'Nature',
    'Culture',
    'Adventure',
    'Wildlife',
    'Heritage',
    'Food',
    'Family',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F2),

      body: SafeArea(
        child: Column(
          children: [
            // ─────────────────────────────────────────────
            // HEADER
            // ─────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Colors.black.withOpacity(0.05),
                        ),
                      ),
                      child: const Icon(
                        Icons.arrow_back_rounded,
                        color: Color(0xFF17201D),
                        size: 21,
                      ),
                    ),
                  ),

                  const SizedBox(width: 14),

                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Plan My Trip',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF17201D),
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Let AI create your Manipur adventure',
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xFF7A827E),
                        ),
                      ),
                    ],
                  ),

                  // const Spacer(),

                  // Container(
                  //   height: 44,
                  //   width: 44,
                  //   decoration: BoxDecoration(
                  //     color: const Color(0xFFE5F0EC),
                  //     borderRadius: BorderRadius.circular(14),
                  //   ),
                  //   child: const Icon(
                  //     Icons.auto_awesome_rounded,
                  //     color: Color(0xFF16423C),
                  //     size: 21,
                  //   ),
                  // ),
                ],
              ),
            ),

            // ─────────────────────────────────────────────
            // CONTENT
            // ─────────────────────────────────────────────
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 25, 20, 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ─────────────────────────────────────
                    // INTRO CARD
                    // ─────────────────────────────────────
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(19),
                      decoration: BoxDecoration(
                        color: const Color(0xFF16423C),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 52,
                            width: 52,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Icon(
                              Icons.travel_explore_rounded,
                              color: Color(0xFFF1D58A),
                              size: 27,
                            ),
                          ),

                          const SizedBox(width: 14),

                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Tell us what you like',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'We’ll create a personalized itinerary for you.',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 11,
                                    height: 1.35,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 28),

                    // ─────────────────────────────────────
                    // NUMBER OF DAYS
                    // ─────────────────────────────────────
                    const Text(
                      'How many days?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF17201D),
                      ),
                    ),

                    const SizedBox(height: 12),

                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(17),
                        border: Border.all(
                          color: Colors.black.withOpacity(0.05),
                        ),
                      ),
                      child: Row(
                        children: [
                          _CounterButton(
                            icon: Icons.remove_rounded,
                            onTap: () {
                              if (days > 1) {
                                setState(() {
                                  days--;
                                });
                              }
                            },
                          ),

                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  '$days',
                                  style: const TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xFF16423C),
                                  ),
                                ),
                                const Text(
                                  'days',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Color(0xFF7A827E),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          _CounterButton(
                            icon: Icons.add_rounded,
                            onTap: () {
                              if (days < 14) {
                                setState(() {
                                  days++;
                                });
                              }
                            },
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    // ─────────────────────────────────────
                    // NUMBER OF TRAVELERS
                    // ─────────────────────────────────────
                    const Text(
                      "How many travellers?",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF17201D),
                      ),
                    ),

                    const SizedBox(height: 12),

                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(17),
                        border: Border.all(
                          color: Colors.black.withOpacity(0.05),
                        ),
                      ),
                      child: Row(
                        children: [
                          _CounterButton(
                            icon: Icons.remove_rounded,
                            onTap: () {
                              if (travelers > 1) {
                                setState(() {
                                  travelers--;
                                });
                              }
                            },
                          ),

                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  '$travelers',
                                  style: const TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xFF16423C),
                                  ),
                                ),
                                const Text(
                                  'travellers',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Color(0xFF7A827E),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          _CounterButton(
                            icon: Icons.add_rounded,
                            onTap: () {
                              if (travelers < 15) {
                                setState(() {
                                  travelers++;
                                });
                              }
                            },
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    // ─────────────────────────────────────
                    // BUDGET
                    // ─────────────────────────────────────
                    const Text(
                      'Your budget',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF17201D),
                      ),
                    ),

                    const SizedBox(height: 12),

                    GestureDetector(
                      onTap: _showBudgetPicker,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.black.withOpacity(0.05),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF5EEDC),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.account_balance_wallet_outlined,
                                color: Color(0xFF9A741C),
                                size: 20,
                              ),
                            ),

                            const SizedBox(width: 12),

                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Total trip budget',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Color(0xFF7A827E),
                                  ),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  'Select budget',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF17201D),
                                  ),
                                ),
                              ],
                            ),

                            const Spacer(),

                            Text(
                              budget,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF16423C),
                              ),
                            ),

                            const SizedBox(width: 5),

                            const Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: Color(0xFF69716D),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    // ─────────────────────────────────────
                    // INTERESTS
                    // ─────────────────────────────────────
                    const Text(
                      'What do you enjoy?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF17201D),
                      ),
                    ),

                    const SizedBox(height: 6),

                    const Text(
                      'Choose what you want to experience.',
                      style: TextStyle(fontSize: 11, color: Color(0xFF7A827E)),
                    ),

                    const SizedBox(height: 13),

                    Wrap(
                      spacing: 9,
                      runSpacing: 9,
                      children: interests.map((interest) {
                        return _InterestChip(
                          label: interest,
                          selected: selectedInterest == interest,
                          onTap: () {
                            setState(() {
                              selectedInterest = interest;
                            });
                          },
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 25),

                    // ─────────────────────────────────────
                    // STARTING LOCATION
                    // ─────────────────────────────────────
                    const Text(
                      'Starting location',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF17201D),
                      ),
                    ),

                    const SizedBox(height: 12),

                    GestureDetector(
                      onTap: _showLocationPicker,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 15,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.black.withOpacity(0.05),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: const Color(0xFFE5F0EC),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.location_on_outlined,
                                color: Color(0xFF16423C),
                                size: 20,
                              ),
                            ),

                            const SizedBox(width: 12),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Starting from',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Color(0xFF7A827E),
                                  ),
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  startingPoint,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF17201D),
                                  ),
                                ),
                              ],
                            ),

                            const Spacer(),

                            const Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: Color(0xFF69716D),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // ─────────────────────────────────────
                    // GENERATE BUTTON
                    // ─────────────────────────────────────
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: _generateTrip,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF16423C),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.auto_awesome_rounded, size: 20),
                            SizedBox(width: 9),
                            Text(
                              'Generate My Trip',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    const Center(
                      child: Text(
                        'Powered by AI • Personalized for you',
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xFF9AA09D),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ═══════════════════════════════════════════════════════
  // BUDGET PICKER
  // ═══════════════════════════════════════════════════════

  void _showBudgetPicker() {
    final budgets = ['₹5,000', '₹10,000', '₹15,000', '₹20,000', '₹30,000+'];

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return _SelectionSheet(
          title: 'Select your budget',
          options: budgets,
          selected: budget,
          onSelected: (value) {
            setState(() {
              budget = value;
            });
            Navigator.pop(context);
          },
        );
      },
    );
  }

  // ═══════════════════════════════════════════════════════
  // LOCATION PICKER
  // ═══════════════════════════════════════════════════════

  void _showLocationPicker() {
    final locations = [
      'Imphal',
      'Bishnupur',
      'Moirang',
      'Ukhrul',
      'Churachandpur',
    ];

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return _SelectionSheet(
          title: 'Starting location',
          options: locations,
          selected: startingPoint,
          onSelected: (value) {
            setState(() {
              startingPoint = value;
            });
            Navigator.pop(context);
          },
        );
      },
    );
  }

  // ═══════════════════════════════════════════════════════
  // GENERATE TRIP
  // ═══════════════════════════════════════════════════════

  Future<void> _generateTrip() async {
    try {
      // Convert "₹10,000" → 10000
      final numericBudget = double.parse(
        budget.replaceAll('₹', '').replaceAll(',', '').replaceAll('+', ''),
      );

      // Convert "Nature" → "nature"
      final interest = selectedInterest.toLowerCase();

      // Show loading indicator
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        },
      );

      // Call FastAPI
      final result = await TripPlannerApi.planTrip(
        budget: numericBudget,
        days: days,
        travelers: travelers,
        interests: [interest],
      );

      // Close loading dialog
      if (mounted) {
        Navigator.pop(context);
      }

      // Open itinerary screen with API result
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItineraryScreen(
              days: days,
              travelers: travelers,
              budget: budget,
              interest: selectedInterest,
              startingPoint: startingPoint,
              itinerary: result['itinerary'],
              budgetSummary: result['budget_summary'],
            ),
          ),
        );
      }
    } catch (e) {
      // Close loading dialog if it is open
      if (mounted) {
        Navigator.pop(context);
      }

      // Show error
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to generate trip: $e')));
      }
    }
  }
}

// ═══════════════════════════════════════════════════════════
// COUNTER BUTTON
// ═══════════════════════════════════════════════════════════

class _CounterButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CounterButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44,
        width: 44,
        decoration: BoxDecoration(
          color: const Color(0xFFE5F0EC),
          borderRadius: BorderRadius.circular(13),
        ),
        child: Icon(icon, color: const Color(0xFF16423C), size: 20),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════
// INTEREST CHIP
// ═══════════════════════════════════════════════════════════

class _InterestChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _InterestChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  IconData get icon {
    switch (label) {
      case 'Nature':
        return Icons.forest_outlined;

      case 'Culture':
        return Icons.account_balance_outlined;

      case 'Food':
        return Icons.restaurant_outlined;

      case 'Adventure':
        return Icons.hiking_rounded;

      case 'Wildlife':
        return Icons.pets_outlined;

      case 'Heritage':
        return Icons.museum_outlined;

      default:
        return Icons.star_outline_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 11),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF16423C) : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: selected
                ? const Color(0xFF16423C)
                : Colors.black.withOpacity(0.05),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 17,
              color: selected ? Colors.white : const Color(0xFF2E7D62),
            ),
            const SizedBox(width: 7),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: selected ? Colors.white : const Color(0xFF4F5753),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════
// SELECTION SHEET
// ═══════════════════════════════════════════════════════════

class _SelectionSheet extends StatelessWidget {
  final String title;
  final List<String> options;
  final String selected;
  final ValueChanged<String> onSelected;

  const _SelectionSheet({
    required this.title,
    required this.options,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 30),
      decoration: const BoxDecoration(
        color: Color(0xFFF7F7F2),
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 4,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          const SizedBox(height: 20),

          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Color(0xFF17201D),
            ),
          ),

          const SizedBox(height: 15),

          ...options.map((option) {
            final isSelected = option == selected;

            return GestureDetector(
              onTap: () => onSelected(option),
              child: Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFFE5F0EC) : Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    Text(
                      option,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: isSelected
                            ? FontWeight.w800
                            : FontWeight.w500,
                        color: const Color(0xFF17201D),
                      ),
                    ),
                    const Spacer(),
                    if (isSelected)
                      const Icon(
                        Icons.check_circle_rounded,
                        color: Color(0xFF16423C),
                        size: 20,
                      ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════
// ITINERARY SCREEN
// ═══════════════════════════════════════════════════════════

class ItineraryScreen extends StatelessWidget {
  final int days;
  final int travelers;
  final String budget;
  final String interest;
  final String startingPoint;

  final List<dynamic> itinerary;
  final Map<String, dynamic> budgetSummary;

  final ScreenshotController screenshotController = ScreenshotController();

  Future<void> _shareTrip(BuildContext context) async {
    try {
      final screenshotController = ScreenshotController();

      final Uint8List image = await screenshotController.captureFromLongWidget(
        _TripShareCard(
          days: days,
          travelers: travelers,
          budget: budget,
          interest: interest,
          startingPoint: startingPoint,
          itinerary: itinerary,
          budgetSummary: budgetSummary,
        ),
        pixelRatio: 3.0,
        delay: const Duration(milliseconds: 100),
        context: context,
        constraints: const BoxConstraints(maxWidth: 720),
      );

      final directory = await getTemporaryDirectory();

      final file = File('${directory.path}/eigi_travelmate_itinerary.png');

      await file.writeAsBytes(image);

      await SharePlus.instance.share(
        ShareParams(
          title: 'Eigi TravelMate Itinerary',
          text: 'My Manipur trip planned with Eigi TravelMate 🌿',
          files: [XFile(file.path)],
        ),
      );
    } catch (e) {
      debugPrint('Share trip error: $e');

      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Unable to share trip: $e')));
      }
    }
  }

  ItineraryScreen({
    super.key,
    required this.days,
    required this.travelers,
    required this.budget,
    required this.interest,
    required this.startingPoint,
    required this.itinerary,
    required this.budgetSummary,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F2),

      body: SafeArea(
        child: Screenshot(
          controller: screenshotController,
          child: Column(
            children: [
              // HEADER
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        height: 44,
                        width: 44,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Icon(
                          Icons.arrow_back_rounded,
                          color: Color(0xFF17201D),
                        ),
                      ),
                    ),

                    const SizedBox(width: 14),

                    const Text(
                      'Your Trip',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF17201D),
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(20, 24, 20, 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SUMMARY
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: const Color(0xFF16423C),
                          borderRadius: BorderRadius.circular(21),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Icon(
                                  Icons.auto_awesome_rounded,
                                  color: Color(0xFFF1D58A),
                                  size: 19,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'AI Generated Itinerary',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 14),

                            Text(
                              'Days • $days',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.w800,
                              ),
                            ),

                            const SizedBox(height: 5),

                            Text(
                              'Budget • $budget',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.w800,
                              ),
                            ),

                            const SizedBox(height: 5),

                            Text(
                              'Travelers • $travelers',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.w800,
                              ),
                            ),

                            const SizedBox(height: 5),

                            Text(
                              '$interest • Starting from $startingPoint',
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 28),

                      // DAYS
                      // ...List.generate(days > 3 ? 3 : days, (index) {
                      //   return _DayPlan(day: index + 1, interest: interest); HARD CODED SECTION WHICH IS REPLACED BY API GENERATED ITINERARY
                      // }),
                      ...itinerary.map((dayPlan) {
                        return _ApiDayPlan(dayPlan: dayPlan);
                      }),

                      // if (days > 3)
                      //   Container(
                      //     margin: const EdgeInsets.only(top: 5),
                      //     padding: const EdgeInsets.all(15),
                      //     decoration: BoxDecoration(
                      //       color: Colors.white,
                      //       borderRadius: BorderRadius.circular(15),
                      //     ),
                      //     child: Row(
                      //       children: [
                      //         const Icon(
                      //           Icons.more_horiz_rounded,
                      //           color: Color(0xFF16423C),
                      //         ),
                      //         const SizedBox(width: 10),
                      //         Text(
                      //           'AI will create ${days - 3} more days...',
                      //           style: const TextStyle(
                      //             fontSize: 12,
                      //             color: Color(0xFF69716D),
                      //             fontWeight: FontWeight.w600,
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      const SizedBox(height: 20),

                      // BUDGET SUMMARY
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.black.withOpacity(0.05),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Icon(
                                  Icons.account_balance_wallet_outlined,
                                  color: Color(0xFF16423C),
                                  size: 21,
                                ),
                                SizedBox(width: 9),
                                Text(
                                  'Budget Summary',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xFF17201D),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 18),

                            _BudgetRow(
                              label: 'Your Budget',
                              value: '${budgetSummary['budget'] ?? budget}',
                            ),

                            const SizedBox(height: 10),

                            _BudgetRow(
                              label: 'Transport',
                              value: '₹${budgetSummary['transport_cost'] ?? 0}',
                            ),

                            const SizedBox(height: 10),

                            _BudgetRow(
                              label: 'Entry Fees',
                              value: '₹${budgetSummary['entry_fee'] ?? 0}',
                            ),

                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 13),
                              child: Divider(height: 1),
                            ),

                            _BudgetRow(
                              label: 'Estimated Total',
                              value: '₹${budgetSummary['total_cost'] ?? 0}',
                              bold: true,
                            ),

                            const SizedBox(height: 10),

                            _BudgetRow(
                              label: 'Remaining Budget',
                              value:
                                  '₹${budgetSummary['remaining_budget'] ?? 0}',
                              bold: true,
                            ),

                            const SizedBox(height: 15),

                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 13,
                                vertical: 11,
                              ),
                              decoration: BoxDecoration(
                                color: (budgetSummary['within_budget'] == true)
                                    ? const Color(0xFFE5F0EC)
                                    : const Color(0xFFFFE8E6),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    budgetSummary['within_budget'] == true
                                        ? Icons.check_circle_outline_rounded
                                        : Icons.warning_amber_rounded,
                                    size: 19,
                                    color:
                                        budgetSummary['within_budget'] == true
                                        ? const Color(0xFF16423C)
                                        : Colors.redAccent,
                                  ),

                                  const SizedBox(width: 9),

                                  Expanded(
                                    child: Text(
                                      budgetSummary['within_budget'] == true
                                          ? 'This trip is within your budget'
                                          : 'This trip exceeds your budget',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color:
                                            budgetSummary['within_budget'] ==
                                                true
                                            ? const Color(0xFF16423C)
                                            : Colors.redAccent,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      // ACTIONS
                      Row(
                        children: [
                          Expanded(
                            child: _ItineraryAction(
                              icon: Icons.map_outlined,
                              label: 'View Route',
                              onTap: () {},
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: _ItineraryAction(
                              icon: Icons.share_outlined,
                              label: 'Share Trip',
                              onTap: () => _shareTrip(context),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════
// TRIP SHARE CARD
// ═══════════════════════════════════════════════════════════
class _TripShareCard extends StatelessWidget {
  final int days;
  final int travelers;
  final String budget;
  final String interest;
  final String startingPoint;
  final List<dynamic> itinerary;
  final Map<String, dynamic> budgetSummary;

  const _TripShareCard({
    required this.days,
    required this.travelers,
    required this.budget,
    required this.interest,
    required this.startingPoint,
    required this.itinerary,
    required this.budgetSummary,
  });

  static const Color green = Color(0xFF176B5A);
  static const Color lightGreen = Color(0xFFEAF5F1);
  static const Color textDark = Color(0xFF263238);
  static const Color textGrey = Color(0xFF6B7471);

  String _rupees(dynamic value) {
    final number = double.tryParse(value?.toString() ?? '') ?? 0;

    if (number == number.roundToDouble()) {
      return '₹${number.toInt()}';
    }

    return '₹${number.toStringAsFixed(0)}';
  }

  @override
  Widget build(BuildContext context) {
    final withinBudget = budgetSummary['within_budget'] == true;

    return Material(
      color: const Color(0xFFF7FAF9),
      child: Container(
        width: 680,
        padding: const EdgeInsets.all(32),
        color: const Color(0xFFF7FAF9),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ─────────────────────────────
            // HEADER
            // ─────────────────────────────
            Center(
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 42,
                        height: 42,
                        // decoration: BoxDecoration(
                        //   color: green,
                        //   borderRadius: BorderRadius.circular(13),
                        // ),
                        child: const Image(
                          image: AssetImage('assets/images/logo.png'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'EIGI TRAVELMATE',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.4,
                          color: green,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'MANIPUR ITINERARY',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 3,
                      color: textGrey,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // ─────────────────────────────
            // TRIP INFO
            // ─────────────────────────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: green,
                borderRadius: BorderRadius.circular(22),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: _TripInfo(
                      icon: Icons.calendar_month_outlined,
                      label: 'DURATION',
                      value: '$days DAYS',
                      light: true,
                    ),
                  ),
                  Expanded(
                    child: _TripInfo(
                      icon: Icons.person_outline,
                      label: 'TRAVELERS',
                      value: '$travelers',
                      light: true,
                    ),
                  ),
                  Expanded(
                    child: _TripInfo(
                      icon: Icons.wallet_outlined,
                      label: 'BUDGET',
                      value: budget,
                      light: true,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 14),

            Row(
              children: [
                _SmallTag(icon: Icons.auto_awesome_outlined, text: interest),
                const SizedBox(width: 8),
                _SmallTag(
                  icon: Icons.location_on_outlined,
                  text: startingPoint,
                ),
              ],
            ),

            const SizedBox(height: 30),

            // ─────────────────────────────
            // JOURNEY TITLE
            // ─────────────────────────────
            const Text(
              'YOUR JOURNEY',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.2,
                color: textDark,
              ),
            ),

            const SizedBox(height: 18),

            // ─────────────────────────────
            // DAYS
            // ─────────────────────────────
            ...itinerary.asMap().entries.map((entry) {
              final dayPlan = entry.value;

              final int day =
                  int.tryParse(dayPlan['day'].toString()) ?? entry.key + 1;

              final List<dynamic> destinations = dayPlan['destinations'] ?? [];

              return _ShareDay(
                day: day,
                destinations: destinations,
                isLast: entry.key == itinerary.length - 1,
              );
            }),

            const SizedBox(height: 18),

            // ─────────────────────────────
            // BUDGET
            // ─────────────────────────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: const Color(0xFFDCE7E3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: lightGreen,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.account_balance_wallet_outlined,
                          color: green,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'BUDGET PLAN',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: textDark,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  _BudgetShareRow(
                    label: 'Budget',
                    value: _rupees(budgetSummary['budget']),
                  ),

                  _BudgetShareRow(
                    label: 'Transport',
                    value: _rupees(budgetSummary['transport_cost']),
                  ),

                  _BudgetShareRow(
                    label: 'Entry Fees',
                    value: _rupees(budgetSummary['entry_fee']),
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Divider(),
                  ),

                  _BudgetShareRow(
                    label: 'Estimated Total',
                    value: _rupees(budgetSummary['total_cost']),
                    bold: true,
                  ),

                  _BudgetShareRow(
                    label: 'Remaining Budget',
                    value: _rupees(budgetSummary['remaining_budget']),
                    bold: true,
                  ),

                  const SizedBox(height: 16),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 13,
                    ),
                    decoration: BoxDecoration(
                      color: withinBudget
                          ? const Color(0xFFE5F3EE)
                          : const Color(0xFFFFE7E7),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          withinBudget
                              ? Icons.check_circle
                              : Icons.warning_rounded,
                          size: 21,
                          color: withinBudget ? green : Colors.red,
                        ),
                        const SizedBox(width: 9),
                        Expanded(
                          child: Text(
                            withinBudget
                                ? 'Within your planned budget'
                                : 'Exceeds your planned budget',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: withinBudget ? green : Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // ─────────────────────────────
            // FOOTER
            // ─────────────────────────────
            Center(
              child: Column(
                children: [
                  Text(
                    '🌿  Eigi TravelMate',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                      color: green,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Explore Manipur • Plan Smarter',
                    style: TextStyle(fontSize: 12, color: textGrey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════
// SHARE BUDGET ROW
// ═══════════════════════════════════════════════════════════
class _BudgetShareRow extends StatelessWidget {
  final String label;
  final String value;
  final bool bold;

  const _BudgetShareRow({
    required this.label,
    required this.value,
    this.bold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 15,
                fontWeight: bold ? FontWeight.w700 : FontWeight.w500,
                color: const Color(0xFF5F6966),
              ),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: bold ? FontWeight.w800 : FontWeight.w600,
              color: const Color(0xFF263238),
            ),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════
// TRIP INFO SHARE
// ═══════════════════════════════════════════════════════════
class _TripInfo extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool light;

  const _TripInfo({
    required this.icon,
    required this.label,
    required this.value,
    this.light = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: Colors.white.withOpacity(0.85)),
        const SizedBox(height: 7),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            letterSpacing: 1,
            color: Colors.white.withOpacity(0.7),
          ),
        ),
        const SizedBox(height: 3),
        Text(
          value,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════
// SMALL TAG
// ═══════════════════════════════════════════════════════════
class _SmallTag extends StatelessWidget {
  final IconData icon;
  final String text;

  const _SmallTag({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF5F1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.circle, size: 7, color: Color(0xFF176B5A)),
          const SizedBox(width: 7),
          Text(
            text,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFF176B5A),
            ),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════
// SHARE DAY
// ═══════════════════════════════════════════════════════════
class _ShareDay extends StatelessWidget {
  final int day;
  final List<dynamic> destinations;
  final bool isLast;

  const _ShareDay({
    required this.day,
    required this.destinations,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF176B5A);
    const dark = Color(0xFF263238);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // TIMELINE
        SizedBox(
          width: 48,
          child: Column(
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(color: green, shape: BoxShape.circle),
                alignment: Alignment.center,
                child: Text(
                  '$day',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),

              if (!isLast)
                Container(
                  width: 2,
                  height: destinations.length * 58.0 + 28,
                  margin: const EdgeInsets.only(top: 5),
                  color: const Color(0xFFB8D8CF),
                ),
            ],
          ),
        ),

        const SizedBox(width: 14),

        // DAY CONTENT
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'DAY $day',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.2,
                    color: green,
                  ),
                ),

                const SizedBox(height: 12),

                ...destinations.map((destination) {
                  final String name =
                      destination['name']?.toString() ?? destination.toString();

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 13,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: const Color(0xFFE1E9E6)),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            size: 20,
                            color: green,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: dark,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════
// API DAY PLAN
// ═══════════════════════════════════════════════════════════
class _ApiDayPlan extends StatelessWidget {
  final dynamic dayPlan;

  const _ApiDayPlan({required this.dayPlan});

  @override
  Widget build(BuildContext context) {
    final int day = dayPlan['day'];
    final List<dynamic> destinations = dayPlan['destinations'] ?? [];

    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 34,
                width: 34,
                decoration: BoxDecoration(
                  color: const Color(0xFF16423C),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Center(
                  child: Text(
                    '$day',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 10),

              Text(
                'DAY $day',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF17201D),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          ...destinations.map((destination) {
            return Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black.withOpacity(0.04)),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.place_outlined,
                    color: Color(0xFF2E7D62),
                    size: 19,
                  ),

                  const SizedBox(width: 11),

                  Expanded(
                    child: Text(
                      destination['name'] ?? 'Unknown destination',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF3F4743),
                      ),
                    ),
                  ),

                  // const Icon(
                  //   Icons.arrow_forward_ios_rounded,
                  //   size: 11,
                  //   color: Color(0xFF9AA09D),
                  // ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

// // ═══════════════════════════════════════════════════════════
// // DAY PLAN
// // ═══════════════════════════════════════════════════════════

// class _DayPlan extends StatelessWidget {
//   final int day;
//   final String interest;

//   const _DayPlan({required this.day, required this.interest});

//   @override
//   Widget build(BuildContext context) {
//     final plans = [
//       ['Kangla', 'Ima Keithel', 'Local Food Experience'],
//       ['Loktak Lake', 'Keibul Lamjao', 'Sunset Experience'],
//       ['Moirang', 'INA Memorial', 'Local Cultural Experience'],
//     ];

//     final currentPlan = plans[(day - 1) % plans.length];

//     return Container(
//       margin: const EdgeInsets.only(bottom: 18),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Container(
//                 height: 34,
//                 width: 34,
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF16423C),
//                   borderRadius: BorderRadius.circular(11),
//                 ),
//                 child: Center(
//                   child: Text(
//                     '$day',
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 13,
//                       fontWeight: FontWeight.w800,
//                     ),
//                   ),
//                 ),
//               ),

//               const SizedBox(width: 10),

//               Text(
//                 'DAY $day',
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w800,
//                   color: Color(0xFF17201D),
//                 ),
//               ),
//             ],
//           ),

//           const SizedBox(height: 10),

//           ...currentPlan.map(
//             (place) => Container(
//               margin: const EdgeInsets.only(bottom: 8),
//               padding: const EdgeInsets.all(14),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(15),
//                 border: Border.all(color: Colors.black.withOpacity(0.04)),
//               ),
//               child: Row(
//                 children: [
//                   const Icon(
//                     Icons.place_outlined,
//                     color: Color(0xFF2E7D62),
//                     size: 19,
//                   ),

//                   const SizedBox(width: 11),

//                   Expanded(
//                     child: Text(
//                       place,
//                       style: const TextStyle(
//                         fontSize: 13,
//                         fontWeight: FontWeight.w700,
//                         color: Color(0xFF3F4743),
//                       ),
//                     ),
//                   ),

//                   const Icon(
//                     Icons.arrow_forward_ios_rounded,
//                     size: 11,
//                     color: Color(0xFF9AA09D),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// ═══════════════════════════════════════════════════════════
// ITINERARY ACTION
// ═══════════════════════════════════════════════════════════

class _ItineraryAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ItineraryAction({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.black.withOpacity(0.05)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 17, color: const Color(0xFF16423C)),
            const SizedBox(width: 7),
            Text(
              label,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w800,
                color: Color(0xFF16423C),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════
// BUDGET ROW
// ═══════════════════════════════════════════════════════════
class _BudgetRow extends StatelessWidget {
  final String label;
  final String value;
  final bool bold;

  const _BudgetRow({
    required this.label,
    required this.value,
    this.bold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: const Color(0xFF69716D),
              fontWeight: bold ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 13,
            color: const Color(0xFF17201D),
            fontWeight: bold ? FontWeight.w800 : FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
