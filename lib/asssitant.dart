import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'services/ai_service.dart';

class AssistantScreen extends StatefulWidget {
  const AssistantScreen({super.key});

  @override
  State<AssistantScreen> createState() => _AssistantScreenState();
}

class _AssistantScreenState extends State<AssistantScreen> {
  String selectedLanguage = 'English';

  final stt.SpeechToText _speech = stt.SpeechToText();

  bool _isListening = false;
  bool _isLoading = false;
  String _aiResponse = '';
  final TextEditingController _textController = TextEditingController();

  Future<void> _toggleListening() async {
    if (_isListening) {
      await _speech.stop();
      setState(() {
        _isListening = false;
      });
    } else {
      bool available = await _speech.initialize(
        onStatus: (status) {
          if (status == 'done') {
            setState(() {
              _isListening = false;
            });
          }
        },
        onError: (error) {
          setState(() {
            _isListening = false;
          });
        },
      );

      if (available) {
        setState(() {
          _isListening = true;
        });
        await _speech.listen(
          onResult: (result) {
            setState(() {
              _textController.text = result.recognizedWords;
              _textController.selection = TextSelection.fromPosition(
                TextPosition(offset: _textController.text.length),
              );
            });
          },
          listenOptions: stt.SpeechListenOptions(
            localeId: selectedLanguage == 'English'
                ? 'en_US'
                : selectedLanguage == 'Hindi'
                ? 'hi_IN'
                : 'mni_IN',
            partialResults: true,
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _speech.stop();
    _textController.dispose();
    super.dispose();
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
                  // Back button
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
                        'Eigi Travel AI',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF17201D),
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Your Manipur travel companion',
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
            // MAIN CONTENT
            // ─────────────────────────────────────────────
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 28, 20, 30),
                child: Column(
                  children: [
                    // AI ICON
                    Container(
                      height: 78,
                      width: 78,
                      decoration: BoxDecoration(
                        color: const Color(0xFF16423C),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF16423C).withOpacity(0.18),
                            blurRadius: 25,
                            spreadRadius: 3,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.auto_awesome_rounded,
                        color: Color(0xFFF1D58A),
                        size: 34,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // TITLE
                    const Text(
                      'How can I help you?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF17201D),
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'Ask me anything about Manipur',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Color(0xFF69716D)),
                    ),

                    const SizedBox(height: 25),

                    // ─────────────────────────────────────
                    // SUGGESTION CARD
                    // ─────────────────────────────────────
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
                          Row(
                            children: [
                              Container(
                                height: 34,
                                width: 34,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF5EEDC),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Icon(
                                  Icons.lightbulb_outline_rounded,
                                  size: 18,
                                  color: Color(0xFF9A741C),
                                ),
                              ),

                              const SizedBox(width: 10),

                              const Text(
                                'Try asking',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF17201D),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 14),

                          _SuggestionItem(
                            text: 'What should I visit in Manipur for 2 days?',
                            onTap: () {},
                          ),

                          const SizedBox(height: 9),

                          _SuggestionItem(
                            text: 'Tell me about Loktak Lake.',
                            onTap: () {},
                          ),

                          const SizedBox(height: 9),

                          _SuggestionItem(
                            text: 'What local food should I try?',
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // ─────────────────────────────────────
                    // MICROPHONE
                    // ─────────────────────────────────────
                    GestureDetector(
                      onTap: () {
                        // TODO:
                        // Start speech recognition
                        _toggleListening();
                      },
                      child: Container(
                        height: 105,
                        width: 105,
                        decoration: BoxDecoration(
                          color: const Color(0xFF16423C),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF16423C).withOpacity(0.25),
                              blurRadius: 30,
                              spreadRadius: 6,
                            ),
                          ],
                        ),
                        child: Icon(
                          _isListening ? Icons.mic : Icons.mic_none,
                          color: _isListening
                              ? const Color(0xFFD9A441)
                              : const Color.fromARGB(255, 255, 255, 255),
                          size: 43,
                        ),
                      ),
                    ),

                    if (_textController.text.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Colors.black.withOpacity(0.05),
                              ),
                            ),
                            child: TextField(
                              controller: _textController,
                              maxLines: 4,
                              minLines: 1,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              decoration: const InputDecoration(
                                hintText: 'Speak or type your question...',
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  color: Color(0xFF9AA09D),
                                  fontSize: 15,
                                ),
                              ),
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color(0xFF17201D),
                              ),
                            ),
                          ),
                        ),
                      ),
                    const SizedBox(height: 14),

                    const Text(
                      'Tap to speak',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF69716D),
                      ),
                    ),

                    const SizedBox(height: 12),

                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton.icon(
                        onPressed: _isLoading
                            ? null
                            : () async {
                                setState(() {
                                  _isLoading = true;
                                  _aiResponse = '';
                                });

                                final question = _textController.text.trim();
                                if (question.isNotEmpty) {
                                  final response = await AiService.ask(
                                    question,
                                  );
                                  setState(() {
                                    _aiResponse = response;
                                  });
                                }

                                setState(() {
                                  _isLoading = false;
                                });
                              },
                        icon: const Icon(Icons.arrow_upward_rounded),
                        label: const Text(
                          'Ask Eigi AI',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF16423C),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),

                    // ─────────────────────────────────────
                    // AI RESPONSE
                    // ─────────────────────────────────────
                    if (_isLoading)
                      const Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            CircularProgressIndicator(color: Color(0xFF16423C)),
                            SizedBox(height: 10),
                            Text(
                              'Eigi AI is thinking...',
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFF69716D),
                              ),
                            ),
                          ],
                        ),
                      ),

                    if (_aiResponse.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                              color: const Color(0xFF16423C).withOpacity(0.08),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                children: [
                                  Icon(
                                    Icons.auto_awesome_rounded,
                                    color: Color(0xFF16423C),
                                    size: 20,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Eigi AI',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xFF17201D),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text(
                                _aiResponse,
                                style: const TextStyle(
                                  fontSize: 14,
                                  height: 1.5,
                                  color: Color(0xFF3F4743),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    const SizedBox(height: 28),

                    // ─────────────────────────────────────
                    // LANGUAGE SELECTOR
                    // ─────────────────────────────────────
                    // Container(
                    //   padding: const EdgeInsets.all(5),
                    //   decoration: BoxDecoration(
                    //     color: Colors.white,
                    //     borderRadius: BorderRadius.circular(15),
                    //     border: Border.all(
                    //       color: Colors.black.withOpacity(0.05),
                    //     ),
                    //   ),
                    // child: Row(
                    //   children: [
                    //     _LanguageButton(
                    //       label: 'English',
                    //       selected: selectedLanguage == 'English',
                    //       onTap: () {
                    //         setState(() {
                    //           selectedLanguage = 'English';
                    //         });
                    //       },
                    //     ),

                    //     // _LanguageButton(
                    //     //   label: 'Hindi',
                    //     //   selected: selectedLanguage == 'Hindi',
                    //     //   onTap: () {
                    //     //     setState(() {
                    //     //       selectedLanguage = 'Hindi';
                    //     //     });
                    //     //   },
                    //     // ),
                    //     _LanguageButton(
                    //       label: 'Meitei',
                    //       selected: selectedLanguage == 'Meitei',
                    //       onTap: () {
                    //         setState(() {
                    //           selectedLanguage = 'Meitei';
                    //         });
                    //       },
                    //     ),
                    //   ],
                    // ),
                    // ),
                    const SizedBox(height: 30),

                    // ─────────────────────────────────────
                    // RECENT QUESTIONS
                    // ─────────────────────────────────────
                    // Align(
                    //   alignment: Alignment.centerLeft,
                    //   child: Row(
                    //     children: [
                    //       const Text(
                    //         'Recent questions',
                    //         style: TextStyle(
                    //           fontSize: 18,
                    //           fontWeight: FontWeight.w800,
                    //           color: Color(0xFF17201D),
                    //         ),
                    //       ),

                    //       const Spacer(),

                    //       TextButton(
                    //         onPressed: () {},
                    //         child: const Text(
                    //           'Clear',
                    //           style: TextStyle(
                    //             color: Color(0xFF2E7D62),
                    //             fontSize: 12,
                    //             fontWeight: FontWeight.w700,
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),

                    // const SizedBox(height: 5),

                    // _RecentQuestion(
                    //   icon: Icons.location_on_outlined,
                    //   text: 'Tell me about Loktak Lake',
                    // ),

                    // _RecentQuestion(
                    //   icon: Icons.restaurant_outlined,
                    //   text: 'Best food to try in Manipur',
                    // ),

                    // _RecentQuestion(
                    //   icon: Icons.calendar_month_outlined,
                    //   text: 'Best time to visit Manipur',
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
}

// ═══════════════════════════════════════════════════════════
// SUGGESTION ITEM
// ═══════════════════════════════════════════════════════════

class _SuggestionItem extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const _SuggestionItem({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFFF7F7F2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.chat_bubble_outline_rounded,
              size: 16,
              color: Color(0xFF2E7D62),
            ),

            const SizedBox(width: 9),

            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF4F5753),
                  height: 1.3,
                ),
              ),
            ),

            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 12,
              color: Color(0xFF9AA09D),
            ),
          ],
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════
// LANGUAGE BUTTON
// ═══════════════════════════════════════════════════════════

// class _LanguageButton extends StatelessWidget {
//   final String label;
//   final bool selected;
//   final VoidCallback onTap;

//   const _LanguageButton({
//     required this.label,
//     required this.selected,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: GestureDetector(
//         onTap: onTap,
//         child: AnimatedContainer(
//           duration: const Duration(milliseconds: 200),
//           padding: const EdgeInsets.symmetric(vertical: 11),
//           decoration: BoxDecoration(
//             color: selected ? const Color(0xFF16423C) : Colors.transparent,
//             borderRadius: BorderRadius.circular(11),
//           ),
//           child: Text(
//             label,
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 12,
//               fontWeight: selected ? FontWeight.w800 : FontWeight.w600,
//               color: selected ? Colors.white : const Color(0xFF69716D),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// ═══════════════════════════════════════════════════════════
// RECENT QUESTION
// ═══════════════════════════════════════════════════════════

// class _RecentQuestion extends StatelessWidget {
//   final IconData icon;
//   final String text;

//   const _RecentQuestion({required this.icon, required this.text});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 9),
//       padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(14),
//         border: Border.all(color: Colors.black.withOpacity(0.05)),
//       ),
//       child: Row(
//         children: [
//           Icon(icon, size: 19, color: const Color(0xFF2E7D62)),

//           const SizedBox(width: 12),

//           Expanded(
//             child: Text(
//               text,
//               style: const TextStyle(
//                 fontSize: 12.5,
//                 color: Color(0xFF3F4743),
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ),

//           const Icon(
//             Icons.arrow_forward_ios_rounded,
//             size: 12,
//             color: Color(0xFF9AA09D),
//           ),
//         ],
//       ),
//     );
//   }
// }
