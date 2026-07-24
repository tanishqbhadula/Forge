import 'dart:convert';

import 'package:forge/screens/chatbot_heph/chat_message.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatHistoryStorage {
  static const String _storageKey = 'forge_chat_history';

  Future<List<ChatMessage>> load() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_storageKey);
    if (raw == null || raw.isEmpty) {
      return [];
    }

    final decoded = jsonDecode(raw) as List<dynamic>;
    return decoded
        .map((item) => ChatMessage.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  Future<void> save(List<ChatMessage> messages) async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = jsonEncode(
      messages.map((message) => message.toJson()).toList(),
    );
    await prefs.setString(_storageKey, encoded);
  }

  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_storageKey);
  }
}
