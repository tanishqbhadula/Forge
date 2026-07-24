import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:forge/screens/chatbot_heph/chat_history_storage.dart';
import 'package:forge/screens/chatbot_heph/chat_message.dart';
import 'package:forge/screens/chatbot_heph/gemini_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen>
    with WidgetsBindingObserver {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _apiKeyController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final ChatHistoryStorage _storage = ChatHistoryStorage();
  late final GeminiService _geminiService;

  List<ChatMessage> _messages = [];
  String _apiKey = '';
  bool _isLoading = false;
  bool _showScrollButton = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    //_loadApiKey();
    _loadMessages();
    _geminiService = GeminiService();
    _scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller.dispose();
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.detached) {
      _storage.clear();
    }
    // setState(() {
    //   _messages.clear();
    // });
    // FIX : CHAT DOESN'T RESET WHEN USER CLOSES APP
  }

  // Future<void> _loadApiKey() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final savedKey = prefs.getString('fitness_gemini_api_key') ?? '';
  //   if (!mounted) return;

  //   setState(() {
  //     _apiKey = savedKey;
  //     _apiKeyController.text = savedKey;
  //     _geminiService = GeminiService(apiKey: savedKey);
  //   });
  // }
  //late final GeminiService _geminiService;

  Future<void> _saveApiKey() async {
    final prefs = await SharedPreferences.getInstance();
    final trimmed = _apiKeyController.text.trim();
    await prefs.setString('fitness_gemini_api_key', trimmed);
    if (!mounted) return;

    setState(() {
      _apiKey = trimmed;
      _geminiService = GeminiService(apiKey: trimmed);
    });
  }

  Future<void> _loadMessages() async {
    final savedMessages = await _storage.load();
    if (!mounted) return;

    setState(() {
      _messages = savedMessages;
      if (_messages.isEmpty) {
        _messages = [
          ChatMessage(
            role: 'assistant',
            text:
                'Hello, I am HEPH, your fitness coach. Ask me about workouts, nutrition, recovery, or staying consistent.',
          ),
        ];
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  void _handleScroll() {
    if (!_scrollController.hasClients) return;

    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    final shouldShow = maxScroll > 0 && (maxScroll - currentScroll) > 240;

    if (_showScrollButton != shouldShow) {
      setState(() {
        _showScrollButton = shouldShow;
      });
    }
  }

  void _showApiKeyDialog() {
    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Gemini API key'),
          content: TextField(
            controller: _apiKeyController,
            decoration: const InputDecoration(
              hintText: 'Paste your Gemini API key',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () async {
                await _saveApiKey();
                if (!mounted) return;
                Navigator.pop(dialogContext);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _sendMessage() async {
    final text = _controller.text.trim();
    if (text.isEmpty || _isLoading) return;

    final userMessage = ChatMessage(role: 'user', text: text);
    final updatedMessages = [..._messages, userMessage];

    setState(() {
      _messages = updatedMessages;
      _isLoading = true;
      _controller.clear();
    });

    await _storage.save(_messages);
    _scrollToBottom();

    try {
      final reply = await _geminiService.getReply(_messages);
      if (!mounted) return;

      setState(() {
        _messages.add(ChatMessage(role: 'assistant', text: reply));
      });
      await _storage.save(_messages);
      _scrollToBottom();
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _messages.add(
          ChatMessage(
            role: 'assistant',
            text: 'Something went wrong. Please try again in a moment.',
          ),
        );
      });
      await _storage.save(_messages);
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _scrollToBottom() {
    if (!_scrollController.hasClients) return;
    Future.delayed(const Duration(milliseconds: 120), () {
      if (!_scrollController.hasClients) return;
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black26,
        elevation: 10,
        centerTitle: true,
        title: const Text(
          'Heph',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
        // actions: [
        //   IconButton(
        //     onPressed: _showApiKeyDialog,
        //     icon: Icon(
        //       Icons.key_rounded,
        //       color: _apiKey.isEmpty ? Colors.black54 : Colors.blue,
        //     ),
        //   ),
        // ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                // if (_apiKey.isEmpty)
                //   Positioned(
                //     top: 8,
                //     left: 16,
                //     right: 16,
                //     child: Container(
                //       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                //       decoration: BoxDecoration(
                //         color: Colors.blue.shade50,
                //         borderRadius: BorderRadius.circular(12),
                //         border: Border.all(color: Colors.blue.shade100),
                //       ),
                //       child: const Text(
                //         'Add a Gemini API key to enable live answers.',
                //         style: TextStyle(color: Colors.blue, fontSize: 12),
                //       ),
                //     ),
                //   ),
                ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 90),
                  itemCount: _messages.length + (_isLoading ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (_isLoading && index == _messages.length) {
                      return _buildTypingBubble();
                    }

                    final message = _messages[index];
                    final isUser = message.role == 'user';

                    return Align(
                      alignment: isUser
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 12,
                        ),
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.78,
                        ),
                        decoration: BoxDecoration(
                          color: isUser ? Colors.blue : Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(18),
                          border: isUser
                              ? null
                              : Border.all(color: Colors.grey.shade200),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.04),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        // MESSAGE RESPONSE
                        // child: Text(
                        //   message.text,
                        //   style: TextStyle(
                        //     color: isUser ? Colors.white : Colors.black87,
                        //     fontSize: 14,
                        //     height: 1.4,
                        //   ),
                        // ),
                        child: MarkdownBody(
                          data: message.text,
                          selectable: true,
                          styleSheet: MarkdownStyleSheet(
                            p: TextStyle(
                              color: isUser ? Colors.white : Colors.black87,
                              fontSize: 14,
                              height: 1.5,
                            ),

                            h1: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: isUser ? Colors.white : Colors.black,
                            ),

                            h2: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              color: isUser ? Colors.white : Colors.black,
                            ),

                            h3: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: isUser ? Colors.white : Colors.black,
                            ),

                            h4: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: isUser ? Colors.white : Colors.black,
                            ),

                            strong: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),

                            em: const TextStyle(fontStyle: FontStyle.italic),

                            listBullet: TextStyle(
                              color: isUser ? Colors.white : Colors.black,
                              fontSize: 15,
                            ),

                            blockquote: TextStyle(
                              color: isUser
                                  ? Colors.white70
                                  : Colors.grey.shade700,
                              fontStyle: FontStyle.italic,
                            ),

                            code: TextStyle(
                              fontFamily: 'monospace',
                              fontSize: 13,
                              color: isUser ? Colors.white : Colors.deepPurple,
                              backgroundColor: isUser
                                  ? Colors.white24
                                  : Colors.grey.shade200,
                            ),

                            codeblockDecoration: BoxDecoration(
                              color: isUser
                                  ? Colors.white12
                                  : Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(12),
                            ),

                            codeblockPadding: const EdgeInsets.all(12),

                            blockSpacing: 10,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                if (_showScrollButton)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8, right: 8),
                    child: FloatingActionButton.small(
                      backgroundColor: Colors.deepPurple,
                      onPressed: _scrollToBottom,
                      child: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Colors.grey.shade200)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    textInputAction: TextInputAction.send,
                    onSubmitted: (_) => _sendMessage(),
                    decoration: InputDecoration(
                      hintText: 'Ask Heph...',
                      hintStyle: TextStyle(color: Colors.grey.shade500),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.blue,
                  child: IconButton(
                    onPressed: _sendMessage,
                    icon: _isLoading
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.white,
                              ),
                            ),
                          )
                        : const Icon(Icons.send_rounded, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypingBubble() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue.shade600),
              ),
            ),
            const SizedBox(width: 8),
            const Text('Thinking...', style: TextStyle(color: Colors.black87)),
          ],
        ),
      ),
    );
  }
}
