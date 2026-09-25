import 'package:flutter/material.dart';
import 'asssitant.dart';
import 'translator.dart';
import 'explore.dart';
import 'planner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F2),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ─────────────────────────────────────────────
              // TOP BAR
              // ─────────────────────────────────────────────
              Row(
                children: [
                  SizedBox(
                    height: 44,
                    width: 44,
                    // decoration: BoxDecoration(
                    //   color: const Color(0xFF16423C),
                    //   borderRadius: BorderRadius.circular(14),
                    // ),
                    child: const Image(
                      image: AssetImage('assets/images/logo.png'),
                    ),
                  ),

                  const SizedBox(width: 12),

                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Eigi TravelMate',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.5,
                          color: Color(0xFF17201D),
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Your AI travel companion',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),

                  const Spacer(),

                  // Container(
                  //   height: 44,
                  //   width: 44,
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     borderRadius: BorderRadius.circular(14),
                  //     border: Border.all(color: Colors.black.withOpacity(0.06)),
                  //   ),
                  //   child: const Icon(
                  //     Icons.notifications_none_rounded,
                  //     color: Color(0xFF17201D),
                  //   ),
                  // ),
                ],
              ),

              const SizedBox(height: 28),

              // ─────────────────────────────────────────────
              // GREETING
              // ─────────────────────────────────────────────
              const Text(
                'Explore Manipur',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF17201D),
                  height: 1.1,
                ),
              ),

              const SizedBox(height: 7),

              const Text(
                'Discover places, culture and experiences\nwith your AI travel companion.',
                style: TextStyle(
                  fontSize: 15,
                  height: 1.45,
                  color: Color(0xFF69716D),
                ),
              ),

              const SizedBox(height: 22),

              // ─────────────────────────────────────────────
              // HERO CARD
              // ─────────────────────────────────────────────
              Container(
                height: 255,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/thejewelofindia.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(26),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.05),
                        Colors.black.withOpacity(0.72),
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Container(
                      //   padding: const EdgeInsets.symmetric(
                      //     horizontal: 10,
                      //     vertical: 6,
                      //   ),
                      //   decoration: BoxDecoration(
                      //     color: Colors.white.withOpacity(0.18),
                      //     borderRadius: BorderRadius.circular(30),
                      //   ),
                      //   child: const Text(
                      //     '🏔️  Discover the beauty',
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 12,
                      //       fontWeight: FontWeight.w600,
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(height: 10),

                      const Text(
                        'Jewel of India: Explore the Enchanting Beauty of Manipur',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          height: 1.15,
                        ),
                      ),

                      const SizedBox(height: 12),

                      SizedBox(
                        height: 42,
                        child: ElevatedButton(
                          onPressed: () {
                            // TODO: Navigate to Explore screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ExploreScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: const Color(0xFF16423C),
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Explore Now',
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                              SizedBox(width: 6),
                              Icon(Icons.arrow_forward_rounded, size: 18),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 28),

              // ─────────────────────────────────────────────
              // AI QUICK ACTIONS
              // ─────────────────────────────────────────────
              const Text(
                'How can I help?',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF17201D),
                ),
              ),

              const SizedBox(height: 13),

              Row(
                children: [
                  Expanded(
                    child: _ActionCard(
                      icon: Icons.mic_rounded,
                      title: 'Eigi Travel AI',
                      subtitle: 'Ask about Manipur',
                      iconBackground: const Color(0xFFE5F0EC),
                      onTap: () {
                        // TODO: Navigate to AI Assistant
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AssistantScreen(),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: _ActionCard(
                      icon: Icons.translate_rounded,
                      title: 'Translate',
                      subtitle: 'English • Meitei',
                      iconBackground: const Color(0xFFF5EEDC),
                      onTap: () {
                        // TODO: Navigate to Translator
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TranslatorScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // ─────────────────────────────────────────────
              // POPULAR PLACES
              // ─────────────────────────────────────────────
              Row(
                children: [
                  const Text(
                    'Popular places',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF17201D),
                    ),
                  ),

                  const Spacer(),

                  GestureDetector(
                    onTap: () {
                      // TODO: Navigate to Explore
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ExploreScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'See all',
                      style: TextStyle(
                        color: Color(0xFF2E7D62),
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              SizedBox(
                height: 190,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  children: const [
                    _DestinationCard(
                      image: 'assets/images/loktaklake.jpg',
                      title: 'Loktak Lake',
                      location: 'Bishnupur, Manipur',
                      category: 'Nature',
                    ),

                    SizedBox(width: 14),

                    _DestinationCard(
                      image: 'assets/images/kanglafort.jpg',
                      title: 'Kangla Fort',
                      location: 'Imphal, Manipur',
                      category: 'Heritage',
                    ),

                    SizedBox(width: 14),

                    _DestinationCard(
                      image: 'assets/images/keibullamjao.jpg',
                      title: 'Keibul Lamjao',
                      location: 'Bishnupur, Manipur',
                      category: 'Wildlife',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // ─────────────────────────────────────────────
              // AI SUGGESTION CARD
              // ─────────────────────────────────────────────
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: const Color(0xFF16423C),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PlannerScreen(),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Icon(
                          Icons.auto_awesome_rounded,
                          color: Color(0xFFF1D58A),
                        ),
                      ),

                      const SizedBox(width: 14),

                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Not sure where to go?',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Let AI create a trip based on your interests.',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                                height: 1.3,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // ─────────────────────────────────────────────────────
      // BOTTOM NAVIGATION
      // ─────────────────────────────────────────────────────
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _NavItem(
                  icon: Icons.home_rounded,
                  label: 'Home',
                  selected: true,
                  onTap: () {},
                ),
                _NavItem(
                  icon: Icons.mic_none_rounded,
                  label: 'AI',
                  selected: false,
                  onTap: () {
                    // TODO: AI Assistant
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AssistantScreen(),
                      ),
                    );
                  },
                ),
                _NavItem(
                  icon: Icons.explore_outlined,
                  label: 'Explore',
                  selected: false,
                  onTap: () {
                    // TODO: Explore
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ExploreScreen(),
                      ),
                    );
                  },
                ),
                _NavItem(
                  icon: Icons.luggage_outlined,
                  label: 'Plan',
                  selected: false,
                  onTap: () {
                    // TODO: Trip Planner
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PlannerScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════
// ACTION CARD
// ═══════════════════════════════════════════════════════════

class _ActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color iconBackground;
  final VoidCallback onTap;

  const _ActionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.iconBackground,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.black.withOpacity(0.05)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 43,
              width: 43,
              decoration: BoxDecoration(
                color: iconBackground,
                borderRadius: BorderRadius.circular(13),
              ),
              child: Icon(icon, color: const Color(0xFF16423C), size: 22),
            ),

            const SizedBox(height: 12),

            Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                color: Color(0xFF17201D),
              ),
            ),

            const SizedBox(height: 3),

            Text(
              subtitle,
              style: const TextStyle(fontSize: 10.5, color: Color(0xFF7A827E)),
            ),
          ],
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════
// DESTINATION CARD
// ═══════════════════════════════════════════════════════════

class _DestinationCard extends StatelessWidget {
  final String image;
  final String title;
  final String location;
  final String category;

  const _DestinationCard({
    required this.image,
    required this.title,
    required this.location,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.black.withOpacity(0.05)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                image,
                height: 105,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) {
                  return Container(
                    height: 105,
                    color: const Color(0xFFE5E9E6),
                    child: const Icon(
                      Icons.image_not_supported_outlined,
                      color: Colors.grey,
                    ),
                  );
                },
              ),

              Positioned(
                top: 9,
                right: 9,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    category,
                    style: const TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF16423C),
                    ),
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(12, 9, 12, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF17201D),
                  ),
                ),

                const SizedBox(height: 4),

                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 12,
                      color: Color(0xFF7A827E),
                    ),

                    const SizedBox(width: 3),

                    Expanded(
                      child: Text(
                        location,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Color(0xFF7A827E),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════
// BOTTOM NAV ITEM
// ═══════════════════════════════════════════════════════════

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 22,
              color: selected
                  ? const Color(0xFF16423C)
                  : const Color(0xFF8A918E),
            ),

            const SizedBox(height: 3),

            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: selected ? FontWeight.w800 : FontWeight.w500,
                color: selected
                    ? const Color(0xFF16423C)
                    : const Color(0xFF8A918E),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
