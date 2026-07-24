import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:forge/screens/chatbot_heph/chat_message.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GeminiService {
  GeminiService({String? apiKey})
    : _apiKey = (apiKey?.trim().isNotEmpty ?? false)
          ? apiKey!.trim()
          : (dotenv.env['GEMINI_API_KEY'] ?? '') {}

  final String _apiKey;
  final String _model = 'gemini-3.6-flash';
  Future<String> getReply(List<ChatMessage> history) async {
    if (_apiKey.isEmpty) {
      return 'API Error: KEY NOT FOUND';
    }

    final uri = Uri.parse(
      'https://generativelanguage.googleapis.com/v1beta/models/$_model:generateContent?key=$_apiKey',
    );

    final contents = history.map((message) {
      return {
        'role': message.role == 'user' ? 'user' : 'model',
        'parts': [
          {'text': message.text},
        ],
      };
    }).toList();

    final body = jsonEncode({
      'contents': contents,
      'systemInstruction': {
        'parts': [
          {
            'text': '''
              You are Heph, the AI assistant inside Forge, a fitness assistant app for fitness, training, diet and recovery.

              Your primary expertise is:
              - Strength training
              - Hypertrophy
              - Running
              - Nutrition
              - Fat loss
              - Muscle gain
              - Recovery
              - Sleep
              - Exercise technique
              - Meal Planning
              - Diet

              Behavior:
              - Be friendly, concise, and motivating.
              - Explain concepts clearly and in a consise manner.
              - Use bullet points when helpful.
              - Use markdown for readability.
              - Ask follow-up questions when needed instead of making assumptions.
              - If the topic is unrelated to fitness, diet, recovery or training, do not answer it and tell them you are only a fitness assistant.
              - Never fabricate facts or sources.
              - For medical concerns, encourage consulting a qualified healthcare professional when appropriate.
              - Do not claim to be a doctor. Recommend professional medical advice when appropriate.
              - Do not entertain any inappropriate questions or statements not related to your role.
            
              Formatting:
              - Format all responses using Markdown.
              - Use ## headings when useful.
              - Use bullet points for lists.
              - Bold important words.
              - Use numbered lists for steps.
              - Use code blocks only when showing code.
              - Avoid tables unless explicitly requested.
              - Keep answers concise unless the user asks for more detail.
            ''',
            //'You are a concise, supportive fitness coach. Keep replies short, motivational, and helpful. Focus on workout advice, nutrition, recovery, and habit building. Use a calm and encouraging tone.',
          },
        ],
      },
    });

    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: body,
    );

    print("Status Code: ${response.statusCode}");
    print("Response: ${response.body}");

    if (response.statusCode != 200) {
      return 'Error ${response.statusCode}: ${response.body}';
    }
    // if (response.statusCode != 200) {
    //   return 'The assistant could not reply right now. Please check your internet connection or try again later.';
    // }

    try {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final text = data['candidates']?[0]?['content']?['parts']?[0]?['text'];
      if (text is String && text.isNotEmpty) {
        return text.trim();
      }
    } catch (_) {}

    return 'Invalid response format';
  }
}
