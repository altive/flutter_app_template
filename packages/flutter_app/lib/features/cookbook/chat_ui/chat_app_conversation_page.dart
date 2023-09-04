// Citation: https://gist.github.com/craiglabenz/c6fc52e3e61f66c51f7a858115bfce51
import 'package:convenient_widgets/convenient_widgets.dart';
import 'package:flutter/material.dart';

import 'chat_message_bubble.dart';

/// A full-screen widget which vaguely resembles a chat app's conversation view.
///
/// The main purpose of the [ChatAppConversationPage] class is to feed the value
/// from a [TextEditingController] into a [ChatMessageBubble] widget. The
/// [ChatMessageBubble] is the real star of the show.
class ChatAppConversationPage extends StatefulWidget {
  const ChatAppConversationPage({super.key});

  @override
  State<ChatAppConversationPage> createState() =>
      _ChatAppConversationPageState();
}

class _ChatAppConversationPageState extends State<ChatAppConversationPage> {
  final TextEditingController _controller = TextEditingController();
  final String sentAt = '3 seconds ago';

  final List<String> _messages = [
    '''Hello?! this is a message! If you read it for long enough, your brain will grow''',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return UnfocusOnTap(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Chat App Conversation'),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    final message = _messages[index];
                    return Align(
                      alignment: Alignment.centerRight,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return Container(
                            margin: const EdgeInsets.all(16),
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 16,
                            ),
                            constraints: BoxConstraints(
                              maxWidth: constraints.maxWidth * 0.75,
                            ),
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            child: ChatMessageBubble(
                              text: message,
                              sentAt: sentAt,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              TextField(
                controller: _controller,
                minLines: 1,
                maxLines: 10,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.zero,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  hintText: 'Type a message',
                  suffixIcon: IconButton(
                    onPressed: () {
                      if (_controller.text.isEmpty) {
                        return;
                      }
                      setState(() {
                        _messages.add(_controller.text);
                        _controller.clear();
                      });
                    },
                    icon: const Icon(Icons.send),
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
