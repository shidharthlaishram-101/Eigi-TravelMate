import 'package:ollama_dart/ollama_dart.dart';
import 'rag_service.dart';

class AiService {
  static const String model = 'qwen3:8b';

  // IMPORTANT:
  // This will be changed to your PC's local network IP
  // when we connect the Android phone.
  static const String ollamaUrl = 'http://172.20.10.9:11434';

  static final OllamaClient _client = OllamaClient(
    config: OllamaConfig(baseUrl: ollamaUrl, timeout: Duration(minutes: 5)),
  );

  static Future<String> ask(String question) async {
    try {
      // 1. Retrieve relevant tourism information.
      final context = await RagService.retrieveContext(question);

      // 2. Build the grounded prompt.
      final prompt = _buildPrompt(question: question, context: context);

      // 3. Send the question + retrieved context to Qwen.
      final response = await _client.chat.create(
        request: ChatRequest(
          model: model,
          messages: [
            ChatMessage.system('''
You are Eigi AI, a helpful tourism assistant for Manipur, India.

Your job is to help tourists with:
- Places to visit
- Local culture
- Food
- Nature and wildlife
- Travel planning
- General tourism questions

Use the provided tourism information when it is relevant.

LANGUAGE RULES:
-Respond in the same language as the user's question whenever possible.
- Keep answers concise, clear, and useful for a tourist.
- Do not act as the application's translation service.

TRANSLATION RULES:
- If the user asks you to translate something between languages, do not perform the translation yourself.
- Instead, tell the user to use the "Translator" section of the app for translation.
- Keep this response brief and helpful.
- Example: "For translation, please use the Translator section of Eigi AI. It supports the languages available in the app."

IMPORTANT:
- Do not invent specific tourism facts when the provided information does not support them.
- If the provided information is insufficient, clearly say that you don't have that information.
- Keep answers concise and useful for a tourist.
- Do not mention RAG, context, prompts, models, or Ollama to the user.
- Respond in the same language as the user's question whenever possible.
'''),
            ChatMessage.user(prompt),
          ],
        ),
      );

      return response.message?.content?.trim() ??
          'Sorry, I could not generate a response.';
    } catch (e) {
      return 'Sorry, I could not connect to Eigi AI right now. \n$e';
    }
  }

  static String _buildPrompt({
    required String question,
    required String context,
  }) {
    if (context.isEmpty) {
      return '''
User question:
$question

No specific information was found in the Manipur tourism knowledge base.

Answer carefully and do not invent specific local facts.
''';
    }

    return '''
User question:
$question

Relevant Manipur tourism information:
$context

Answer the user's question using the relevant information above.
If the information above does not answer the question, say that the available tourism information is insufficient.
''';
  }

  static void dispose() {
    _client.close();
  }
}
