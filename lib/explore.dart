import 'package:flutter/material.dart';
import 'package:eigi_travelmate/services/maps_service.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  String selectedCategory = 'All';
  final TextEditingController searchController = TextEditingController();

  final List<Map<String, String>> destinations = [
    {
      'image': 'assets/images/loktaklake.jpg',
      'title': 'Loktak Lake',
      'location': 'Bishnupur, Manipur',
      'category': 'Nature',
      'description':
          'The largest freshwater lake in northeast India. A scenic and mystical lake which resembles a miniature inland sea. This iconic lake is famed for its unique floating swamps, known as Phumdis, and the world’s only floating National park, the Keibul Lamjao. Treat yourself at the tourist home on one of the large Phumdis.',
    },
    {
      'image': 'assets/images/sanakonung.jpg',
      'title': 'Govindajee Temple',
      'location': 'Imphal, Manipur',
      'category': 'Heritage',
      'description': 'A historic royal palace in Imphal, Manipur.',
    },
    {
      'image': 'assets/images/kanglafort.jpg',
      'title': 'Kangla Fort',
      'location': 'Imphal, Manipur',
      'category': 'Heritage',
      'description':
          'A symbol of Manipur’s glory, a must-see for history buffs and art lovers. Kangla is the most important historical and archaeological site in Manipur. Kangla served as the royal palace since the period of Pakhangba. Numerous holy shrines are spread across the palace and the site is a sacred place for the Meiteis. Located at the heart of Imphal, this ancient capital of Manipur was reinvented by the British. The enticing beauty of the fort and the dramatic elegance of the surrounding makes it a major destination for tourists. A perfect place to quickly unwind yourself and relax for a moment.',
    },
    {
      'image': 'assets/images/keibullamjao.jpg',
      'title': 'Keibul Lamjao',
      'location': 'Bishnupur, Manipur',
      'category': 'Wildlife',
      'description':
          'A unique floating national park and home of the Sangai deer.',
    },
    {
      'image': 'assets/images/imakeithel.jpg',
      'title': 'Ima Market',
      'location': 'Imphal, Manipur',
      'category': 'Shopping',
      'description':
          'A historic all-women market offering traditional products and local goods.',
    },
    {
      'image': 'assets/images/shiruilily.jpg',
      'title': 'Shirui Hills',
      'location': 'Ukhrul, Manipur',
      'category': 'Adventure',
      'description':
          'A scenic hill-top panorama covered with stretches of vibrant wildflowers and the rare state flower, the Shirui lily, the Shirui hills are home to some rare birds and wildlife. An enchanting beauty not to be missed. The Shurui lilies bloom in plethora during the month of May and June, adorning the hilltop of the peak. This magnificent beauty promises to make your trek purely magical.',
    },
    {
      'image': 'assets/images/inawarmemorial.jpg',
      'title': 'INA Memorial',
      'location': 'Moirang, Manipur',
      'category': 'Heritage',
      'description':
          'A place of great significance in India’s struggle for freedom. This memorial honours the noble sacrifices made by Indian soldiers under the leadership of Netaji Subash Chandra Bose. The museum has a collection of priceless photographs, letters, badges of rank and other war memorabilia. A visit to this memorial will give deeper insights on India’s freedom struggle.',
    },
    {
      'image': 'assets/images/marjing.jpg',
      'title': 'Marging Polo Statue',
      'location': 'Imphal, Manipur',
      'category': 'Heritage',
      'description':
          'A cultural site dedicated to the Marjing deity, associated with traditional Manipuri polo.',
    },
    {
      'image': 'assets/images/ukhrul.jpg',
      'title': 'Ukhrul',
      'location': 'Ukhrul, Manipur',
      'category': 'Nature',
      'description':
          'A picturesque town surrounded by hills, known for its scenic beauty and the Shirui Lily Festival.',
    },
    {
      'image': 'assets/images/khongjomwar.jpg',
      'title': 'Khongjom War Memorial',
      'location': 'Thoubal, Manipur',
      'category': 'Heritage',
      'description':
          'This memorial commemorates Major General Paona Brajabashi putting his courage and skill on full display as he beat back the might of the British army in 1891. The foot of the hillock where he laid down his life is honoured by the memorial atop Kheba hill. People pay their respects to the martyrs on Khongjom day every 23rd of April.',
    },
    {
      'image': 'assets/images/khangkhuicave.jpg',
      'title': 'Khangkui Cave',
      'location': 'Imphal, Manipur',
      'category': 'Adventure',
      'description':
          'An unparalleled experience not to be missed. Take a walk back in time in this prehistoric sedimentary limestone cave. Enclosed by different patterns of stalagmites and stalactites, caving in here through the depth and in darkness is an enthralling experience for tourists, archaeologists, and researchers from all around the globe.',
    },
    {
      'image': 'assets/images/dzukou.jpg',
      'title': 'Dzukou Valley',
      'location': 'Manipur',
      'category': 'Nature',
      'description':
          'Untouched nature, an offbeat trek from Manipur to Nagaland. The Dzuko valley is a famous spot for adventure lovers and trekkers. Well known for its jaw-dropping landscapes and flora, the valley is also among the best treks in Manipur and attracts a constantly growing number of tourists. The valley is splendid from the end of June till September. Regardless, it always enchants its visitors!',
    },
    {
      'image': 'assets/images/imphalwarcemetery.jpg',
      'title': 'Imphal War Cemetery',
      'location': 'Porompat, Manipur',
      'category': 'Heritage',
      'description':
          'A poignant site dedicated to soldiers who sacrificed their lives in the battle against Japanese forces during World War II. Maintained by the Commonwealth War Graves Commissions it is the final resting place for 1600 Commonwealth service personnel. Each memorial bears the insignia of each of the fallen soldier in brass plaques. A trip to Imphal is not complete without paying tributes at this historic site',
    },
    {
      'image': 'assets/images/mmrc.jpg',
      'title': 'MMRC & Unity Park',
      'location': 'Thoubal, Manipur',
      'category': 'Heritage',
      'description':
          'A recreational park as well as a research centre, it is a versatile destination indeed. The park represents the culture of various ethnic groups in Manipur with special focus on Meetei traditional structures like Meetei Yumjao, Pakhangba Temple, etc. The children’s park offers many facilities for family outings.',
    },
    {
      'image': 'assets/images/santhei.jpg',
      'title': 'Santhei Natural Park',
      'location': 'Andro, Manipur',
      'category': 'Nature',
      'description':
          'A truly innovative project, the national park is entirely a product of the effort the villagers have put in an attempt to preserve nature. The park also protects culture by keeping a long sacred ritual fire burning. The construction of the dam functions as an artificial water source, making for a glorious sight.',
    },
    {
      'image': 'assets/images/awunching.jpg',
      'title': 'Awunching Park',
      'location': 'Lamshang, Manipur',
      'category': 'Nature',
      'description':
          'Spread over 367 hectares of land, The Great Escape park is indeed great. Established in 2003, the park offers opportunities for multiple activities, such as paintball and water zorbing, as well as calmer activities including painting and photography. A park fun for all ages.',
    },
  ];

  final List<String> categories = [
    'All',
    'Nature',
    'Heritage',
    'Wildlife',
    'Food',
    'Adventure',
    'Shopping',
  ];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  List<Map<String, String>> get filteredDestinations {
    final query = searchController.text.toLowerCase().trim();

    return destinations.where((destination) {
      final matchesCategory =
          selectedCategory == 'All' ||
          destination['category'] == selectedCategory;

      final matchesSearch =
          query.isEmpty ||
          destination['title']!.toLowerCase().contains(query) ||
          destination['location']!.toLowerCase().contains(query) ||
          destination['category']!.toLowerCase().contains(query);

      return matchesCategory && matchesSearch;
    }).toList();
  }

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
                          color: Colors.black.withValues(alpha: 0.05),
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
                        'Explore Manipur',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF17201D),
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Discover places worth exploring',
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xFF7A827E),
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  Container(
                    height: 44,
                    width: 44,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE5F0EC),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(
                      Icons.map_outlined,
                      color: Color(0xFF16423C),
                      size: 21,
                    ),
                  ),
                ],
              ),
            ),

            // ─────────────────────────────────────────────
            // CONTENT
            // ─────────────────────────────────────────────
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 22, 20, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ─────────────────────────────────────
                    // SEARCH
                    // ─────────────────────────────────────
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.black.withValues(alpha: 0.05),
                        ),
                      ),
                      child: TextField(
                        controller: searchController,
                        onChanged: (_) {
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          hintText: 'Search destinations...',
                          hintStyle: const TextStyle(
                            color: Color(0xFFA2A9A6),
                            fontSize: 13,
                          ),
                          prefixIcon: const Icon(
                            Icons.search_rounded,
                            color: Color(0xFF69716D),
                            size: 21,
                          ),
                          suffixIcon: searchController.text.isNotEmpty
                              ? IconButton(
                                  onPressed: () {
                                    searchController.clear();
                                    setState(() {});
                                  },
                                  icon: const Icon(
                                    Icons.close_rounded,
                                    size: 19,
                                  ),
                                )
                              : null,
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 15,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 23),

                    // ─────────────────────────────────────
                    // CATEGORIES
                    // ─────────────────────────────────────
                    const Text(
                      'Explore by category',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF17201D),
                      ),
                    ),

                    const SizedBox(height: 13),

                    SizedBox(
                      height: 40,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: categories.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 8),
                        itemBuilder: (context, index) {
                          final category = categories[index];

                          return _CategoryChip(
                            label: category,
                            selected: selectedCategory == category,
                            onTap: () {
                              setState(() {
                                selectedCategory = category;
                              });
                            },
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 28),

                    // ─────────────────────────────────────
                    // FEATURED DESTINATION
                    // ─────────────────────────────────────
                    const Text(
                      'Featured',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF17201D),
                      ),
                    ),

                    const SizedBox(height: 13),

                    _FeaturedDestination(
                      destination: destinations[0],
                      onTap: () {
                        _showDestinationDetails(destinations[0]);
                      },
                    ),

                    const SizedBox(height: 28),

                    // ─────────────────────────────────────
                    // ALL DESTINATIONS
                    // ─────────────────────────────────────
                    Row(
                      children: [
                        Text(
                          selectedCategory == 'All'
                              ? 'Popular places'
                              : selectedCategory,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF17201D),
                          ),
                        ),

                        const Spacer(),

                        Text(
                          '${filteredDestinations.length} places',
                          style: const TextStyle(
                            fontSize: 11,
                            color: Color(0xFF7A827E),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 14),

                    if (filteredDestinations.isEmpty)
                      _EmptyState()
                    else
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: filteredDestinations.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 14,
                              childAspectRatio: 0.76,
                            ),
                        itemBuilder: (context, index) {
                          final destination = filteredDestinations[index];

                          return _DestinationGridCard(
                            destination: destination,
                            onTap: () {
                              _showDestinationDetails(destination);
                            },
                          );
                        },
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
  // DESTINATION DETAILS
  // ═══════════════════════════════════════════════════════

  void _showDestinationDetails(Map<String, String> destination) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.72,
          decoration: const BoxDecoration(
            color: Color(0xFFF7F7F2),
            borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
          ),
          child: Column(
            children: [
              // IMAGE
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(28),
                    ),
                    child: Image.asset(
                      destination['image']!,
                      height: 245,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Positioned(
                    top: 15,
                    right: 15,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        height: 38,
                        width: 38,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.92),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.close_rounded, size: 20),
                      ),
                    ),
                  ),

                  Positioned(
                    left: 18,
                    bottom: 18,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF16423C),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        destination['category']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        destination['title']!,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF17201D),
                        ),
                      ),

                      const SizedBox(height: 7),

                      Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            size: 16,
                            color: Color(0xFF2E7D62),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            destination['location']!,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF69716D),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        'About this place',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF17201D),
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        destination['description']!,
                        style: const TextStyle(
                          fontSize: 13,
                          height: 1.5,
                          color: Color(0xFF69716D),
                        ),
                      ),

                      const SizedBox(height: 22),

                      Row(
                        children: [
                          Expanded(
                            child: _DetailAction(
                              icon: Icons.map_outlined,
                              label: 'View Map',
                              onTap: () {
                                // TODO: Maps
                                MapsService.openPlace(
                                  placeName: destination['title']!,
                                  location: destination['location']!,
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: _DetailAction(
                              icon: Icons.auto_awesome_rounded,
                              label: 'Ask AI',
                              onTap: () {
                                Navigator.pop(context);
                              },
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
        );
      },
    );
  }
}

// ═══════════════════════════════════════════════════════════
// CATEGORY CHIP
// ═══════════════════════════════════════════════════════════

class _CategoryChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _CategoryChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF16423C) : Colors.white,
          borderRadius: BorderRadius.circular(13),
          border: Border.all(
            color: selected
                ? const Color(0xFF16423C)
                : Colors.black.withValues(alpha: 0.05),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: selected ? FontWeight.w800 : FontWeight.w600,
            color: selected ? Colors.white : const Color(0xFF69716D),
          ),
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════
// FEATURED DESTINATION
// ═══════════════════════════════════════════════════════════

class _FeaturedDestination extends StatelessWidget {
  final Map<String, String> destination;
  final VoidCallback onTap;

  const _FeaturedDestination({required this.destination, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 220,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23),
          image: DecorationImage(
            image: AssetImage(destination['image']!),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(23),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black.withValues(alpha: 0.75)],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  destination['category']!,
                  style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF16423C),
                  ),
                ),
              ),

              const SizedBox(height: 8),

              Text(
                destination['title']!,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 4),

              Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    size: 13,
                    color: Colors.white70,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    destination['location']!,
                    style: const TextStyle(fontSize: 11, color: Colors.white70),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════
// DESTINATION GRID CARD
// ═══════════════════════════════════════════════════════════

class _DestinationGridCard extends StatelessWidget {
  final Map<String, String> destination;
  final VoidCallback onTap;

  const _DestinationGridCard({required this.destination, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.black.withValues(alpha: 0.05)),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  destination['image']!,
                  height: 125,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) {
                    return Container(
                      height: 125,
                      color: const Color(0xFFE5E9E6),
                      child: const Center(
                        child: Icon(
                          Icons.image_not_supported_outlined,
                          color: Colors.grey,
                        ),
                      ),
                    );
                  },
                ),

                Positioned(
                  top: 9,
                  right: 9,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 7,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.92),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      destination['category']!,
                      style: const TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF16423C),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(11, 10, 11, 11),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destination['title']!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF17201D),
                    ),
                  ),

                  const SizedBox(height: 5),

                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 11,
                        color: Color(0xFF7A827E),
                      ),
                      const SizedBox(width: 3),
                      Expanded(
                        child: Text(
                          destination['location']!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 9,
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
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════
// DETAIL ACTION
// ═══════════════════════════════════════════════════════════

class _DetailAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _DetailAction({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 13),
        decoration: BoxDecoration(
          color: const Color(0xFFE5F0EC),
          borderRadius: BorderRadius.circular(13),
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
// EMPTY STATE
// ═══════════════════════════════════════════════════════════

class _EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: const Column(
        children: [
          Icon(
            Icons.travel_explore_rounded,
            size: 50,
            color: Color(0xFFB4BCB8),
          ),
          SizedBox(height: 12),
          Text(
            'No places found',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Color(0xFF69716D),
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Try another search or category.',
            style: TextStyle(fontSize: 11, color: Color(0xFF9AA09D)),
          ),
        ],
      ),
    );
  }
}
