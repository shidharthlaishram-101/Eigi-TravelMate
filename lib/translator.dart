import 'package:flutter/material.dart';

class TranslatorScreen extends StatefulWidget {
  const TranslatorScreen({super.key});

  @override
  State<TranslatorScreen> createState() => _TranslatorScreenState();
}

class _TranslatorScreenState extends State<TranslatorScreen> {
  String sourceLanguage = 'English';
  String targetLanguage = 'Meitei';

  final TextEditingController textController = TextEditingController();

  String translatedText = 'ꯃꯗꯨ ꯀꯔꯤꯅꯣ ꯐꯥꯜ ꯂꯩꯕꯅꯣ?';

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void swapLanguages() {
    setState(() {
      final temp = sourceLanguage;
      sourceLanguage = targetLanguage;
      targetLanguage = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F2),

      body: SafeArea(
        child: Column(
          children: [
            // ─────────────────────────────────────────────
            // TOP BAR
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
                        'Live Translator',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF17201D),
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Communicate without language barriers',
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
                      Icons.translate_rounded,
                      color: Color(0xFF16423C),
                      size: 21,
                    ),
                  ),
                ],
              ),
            ),

            // ─────────────────────────────────────────────
            // MAIN CONTENT
            // ─────────────────────────────────────────────
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 25, 20, 30),
                child: Column(
                  children: [
                    // ─────────────────────────────────────
                    // LANGUAGE SWITCHER
                    // ─────────────────────────────────────
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.black.withValues(alpha: 0.05),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: _LanguageSelector(
                              language: sourceLanguage,
                              onTap: () {
                                _showLanguagePicker(isSource: true);
                              },
                            ),
                          ),

                          GestureDetector(
                            onTap: swapLanguages,
                            child: Container(
                              height: 42,
                              width: 42,
                              decoration: BoxDecoration(
                                color: const Color(0xFF16423C),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.swap_horiz_rounded,
                                color: Colors.white,
                                size: 23,
                              ),
                            ),
                          ),

                          Expanded(
                            child: _LanguageSelector(
                              language: targetLanguage,
                              onTap: () {
                                _showLanguagePicker(isSource: false);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 22),

                    // ─────────────────────────────────────
                    // SOURCE TEXT CARD
                    // ─────────────────────────────────────
                    _TranslationCard(
                      language: sourceLanguage,
                      flag: sourceLanguage == 'English'
                          ? '🇬🇧'
                          : sourceLanguage == 'Hindi'
                          ? '🇮🇳'
                          : 'ꯃꯤ',
                      controller: textController,
                      hintText: 'Type or speak something...',
                      showInput: true,
                      onSpeakerTap: () {
                        // TODO: Text to speech
                      },
                    ),

                    // ─────────────────────────────────────
                    // SWAP INDICATOR
                    // ─────────────────────────────────────
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      height: 38,
                      width: 38,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5EEDC),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_downward_rounded,
                        color: Color(0xFF9A741C),
                        size: 19,
                      ),
                    ),

                    // ─────────────────────────────────────
                    // TRANSLATED TEXT CARD
                    // ─────────────────────────────────────
                    _TranslationCard(
                      language: targetLanguage,
                      flag: targetLanguage == 'English'
                          ? '🇬🇧'
                          : targetLanguage == 'Hindi'
                          ? '🇮🇳'
                          : 'ꯃꯤ',
                      translatedText: translatedText,
                      showInput: false,
                      onSpeakerTap: () {
                        // TODO: Text to speech
                      },
                    ),

                    const SizedBox(height: 20),

                    // ─────────────────────────────────────
                    // MICROPHONE BUTTON
                    // ─────────────────────────────────────
                    GestureDetector(
                      onTap: () {
                        // TODO:
                        // Start speech recognition
                      },
                      child: Container(
                        height: 68,
                        width: 68,
                        decoration: BoxDecoration(
                          color: const Color(0xFF16423C),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF16423C).withValues(alpha: 0.22),
                              blurRadius: 22,
                              spreadRadius: 4,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.mic_rounded,
                          color: Colors.white,
                          size: 29,
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'Tap to speak',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF69716D),
                      ),
                    ),

                    const SizedBox(height: 28),

                    // ─────────────────────────────────────
                    // USEFUL PHRASES
                    // ─────────────────────────────────────
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.lightbulb_outline_rounded,
                            size: 19,
                            color: Color(0xFF9A741C),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Useful phrases',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF17201D),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 14),

                    Wrap(
                      spacing: 9,
                      runSpacing: 9,
                      children: [
                        _PhraseChip(
                          icon: Icons.waving_hand_outlined,
                          text: 'Greetings',
                          onTap: () {},
                        ),
                        _PhraseChip(
                          icon: Icons.directions_outlined,
                          text: 'Getting Around',
                          onTap: () {},
                        ),
                        _PhraseChip(
                          icon: Icons.restaurant_outlined,
                          text: 'Food',
                          onTap: () {},
                        ),
                        _PhraseChip(
                          icon: Icons.emergency_outlined,
                          text: 'Emergency',
                          onTap: () {},
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // ─────────────────────────────────────
                    // CONVERSATION MODE
                    // ─────────────────────────────────────
                    // GestureDetector(
                    //   onTap: () {
                    //     // TODO:
                    //     // Open conversation mode
                    //   },
                    //   child: Container(
                    //     width: double.infinity,
                    //     padding: const EdgeInsets.all(17),
                    //     decoration: BoxDecoration(
                    //       color: const Color(0xFF16423C),
                    //       borderRadius: BorderRadius.circular(20),
                    //     ),
                    //     child: Row(
                    //       children: [
                    //         Container(
                    //           height: 45,
                    //           width: 45,
                    //           decoration: BoxDecoration(
                    //             color: Colors.white.withOpacity(0.12),
                    //             borderRadius: BorderRadius.circular(14),
                    //           ),
                    //           child: const Icon(
                    //             Icons.people_alt_outlined,
                    //             color: Color(0xFFF1D58A),
                    //             size: 22,
                    //           ),
                    //         ),

                    //         const SizedBox(width: 13),

                    //         const Expanded(
                    //           child: Column(
                    //             crossAxisAlignment: CrossAxisAlignment.start,
                    //             children: [
                    //               Text(
                    //                 'Conversation Mode',
                    //                 style: TextStyle(
                    //                   color: Colors.white,
                    //                   fontSize: 14,
                    //                   fontWeight: FontWeight.w800,
                    //                 ),
                    //               ),
                    //               SizedBox(height: 4),
                    //               Text(
                    //                 'Talk with locals in real time',
                    //                 style: TextStyle(
                    //                   color: Colors.white70,
                    //                   fontSize: 11,
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ),

                    //         const Icon(
                    //           Icons.arrow_forward_rounded,
                    //           color: Colors.white,
                    //           size: 20,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
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
  // LANGUAGE PICKER
  // ═══════════════════════════════════════════════════════

  void _showLanguagePicker({required bool isSource}) {
    final languages = ['English', 'Hindi', 'Meitei'];

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
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

              const Text(
                'Select Language',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF17201D),
                ),
              ),

              const SizedBox(height: 15),

              ...languages.map((language) {
                final selected = isSource
                    ? sourceLanguage == language
                    : targetLanguage == language;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSource) {
                        sourceLanguage = language;
                      } else {
                        targetLanguage = language;
                      }
                    });

                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: selected ? const Color(0xFFE5F0EC) : Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      children: [
                        Text(
                          language == 'English'
                              ? '🇬🇧'
                              : language == 'Hindi'
                              ? '🇮🇳'
                              : 'ꯃꯤ',
                          style: const TextStyle(fontSize: 20),
                        ),

                        const SizedBox(width: 12),

                        Text(
                          language,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: selected
                                ? FontWeight.w800
                                : FontWeight.w500,
                            color: const Color(0xFF17201D),
                          ),
                        ),

                        const Spacer(),

                        if (selected)
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
      },
    );
  }
}

// ═══════════════════════════════════════════════════════════
// LANGUAGE SELECTOR
// ═══════════════════════════════════════════════════════════

class _LanguageSelector extends StatelessWidget {
  final String language;
  final VoidCallback onTap;

  const _LanguageSelector({required this.language, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 9),
        child: Column(
          children: [
            Text(
              language == 'English'
                  ? '🇬🇧'
                  : language == 'Hindi'
                  ? '🇮🇳'
                  : 'ꯃꯤ',
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 4),

            Text(
              language,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: Color(0xFF17201D),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════
// TRANSLATION CARD
// ═══════════════════════════════════════════════════════════

class _TranslationCard extends StatelessWidget {
  final String language;
  final String flag;
  final TextEditingController? controller;
  final String? translatedText;
  final String hintText;
  final bool showInput;
  final VoidCallback onSpeakerTap;

  const _TranslationCard({
    required this.language,
    required this.flag,
    this.controller,
    this.translatedText,
    this.hintText = '',
    required this.showInput,
    required this.onSpeakerTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 175),
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black.withValues(alpha: 0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // LANGUAGE
          Row(
            children: [
              Text(flag, style: const TextStyle(fontSize: 17)),

              const SizedBox(width: 8),

              Text(
                language,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF16423C),
                ),
              ),

              const Spacer(),

              GestureDetector(
                onTap: onSpeakerTap,
                child: Container(
                  height: 34,
                  width: 34,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE5F0EC),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.volume_up_outlined,
                    size: 18,
                    color: Color(0xFF16423C),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          if (showInput)
            TextField(
              controller: controller,
              maxLines: 4,
              style: const TextStyle(
                fontSize: 15,
                color: Color(0xFF17201D),
                height: 1.4,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: Color(0xFFA2A9A6),
                  fontSize: 14,
                ),
                border: InputBorder.none,
              ),
            )
          else
            Text(
              translatedText ?? '',
              style: const TextStyle(
                fontSize: 17,
                color: Color(0xFF17201D),
                height: 1.5,
              ),
            ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════
// PHRASE CHIP
// ═══════════════════════════════════════════════════════════

class _PhraseChip extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const _PhraseChip({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 11),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.black.withValues(alpha: 0.05)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: const Color(0xFF2E7D62)),

            const SizedBox(width: 7),

            Text(
              text,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Color(0xFF4F5753),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
