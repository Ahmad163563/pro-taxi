import 'dart:async';
import 'package:flutter/material.dart';


class ChatDemo extends StatelessWidget {
  const ChatDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.system,
      home: const ChatScreen(),
    );
  }
}

enum MessageType { text, image }

class MessageModel {
  final String? text;
  final String? imageUrl;
  final DateTime time;
  final bool isMe;
  final bool delivered;
  final bool read;
  final MessageType type;

  MessageModel({
    this.text,
    this.imageUrl,
    required this.time,
    required this.isMe,
    this.delivered = true,
    this.read = false,
    this.type = MessageType.text,
  });
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();

  bool _isComposing = false;
  bool _otherTyping = false;
  Timer? _typingTimer;

  final List<MessageModel> _messages = [
    MessageModel(
      text: "Hey! Are you available to rent out the Mustang today?",
      time: DateTime.now().subtract(const Duration(minutes: 42)),
      isMe: false,
    ),
    MessageModel(
      text: "Yup! What time do you need it?",
      time: DateTime.now().subtract(const Duration(minutes: 40)),
      isMe: true,
      read: true,
    ),
    MessageModel(
      text: "After 3 PM would be perfect. Also can I apply a promo?",
      time: DateTime.now().subtract(const Duration(minutes: 38)),
      isMe: false,
    ),
    MessageModel(
      imageUrl:
      "https://images.unsplash.com/photo-1494976388531-d1058494cdd8?w=1200",
      type: MessageType.image,
      time: DateTime.now().subtract(const Duration(minutes: 37)),
      isMe: true,
      read: true,
    ),
    MessageModel(
      text: "Here's the car btw 😎",
      time: DateTime.now().subtract(const Duration(minutes: 36)),
      isMe: true,
      read: true,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final composing = _controller.text.trim().isNotEmpty;
      if (composing != _isComposing) {
        setState(() => _isComposing = composing);
      }
    });

    // Simulate other person typing every 20s for 4s
    _typingTimer = Timer.periodic(const Duration(seconds: 20), (t) async {
      setState(() => _otherTyping = true);
      await Future.delayed(const Duration(seconds: 4));
      if (mounted) setState(() => _otherTyping = false);
    });

    // Jump to bottom after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    _focusNode.dispose();
    _typingTimer?.cancel();
    super.dispose();
  }

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _messages.add(MessageModel(
        text: text,
        time: DateTime.now(),
        isMe: true,
        delivered: true,
        read: false,
      ));
      _controller.clear();
      _isComposing = false;
    });
    _scrollToBottom();
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (!_scrollController.hasClients) return;
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent + 80,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    });
  }

  String _formatTime(DateTime dt) {
    final h = dt.hour % 12 == 0 ? 12 : dt.hour % 12;
    final m = dt.minute.toString().padLeft(2, '0');
    final ampm = dt.hour >= 12 ? 'PM' : 'AM';
    return "$h:$m $ampm";
  }

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
        title: Row(
          children: [
            const SizedBox(width: 8),
            const CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(
                'assets/rental.jpeg',
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Mushtang Rentals', style: TextStyle(fontWeight: FontWeight.w600)),
                SizedBox(height: 2),
                Text('online', style: TextStyle(fontSize: 12)),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.videocam_outlined)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.call_outlined)),
          PopupMenuButton<String>(
            itemBuilder: (context) => const [
              PopupMenuItem(value: 'view', child: Text('View contact')),
              PopupMenuItem(value: 'mute', child: Text('Mute notifications')),
              PopupMenuItem(value: 'clear', child: Text('Clear chat')),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                itemCount: _messages.length + (_otherTyping ? 2 : 1),
                itemBuilder: (context, index) {
                  // Date separators + messages + typing bubble at end
                  if (index == _messages.length) {
                    return _otherTyping
                        ? const SizedBox.shrink()
                        : const SizedBox(height: 6);
                  }

                  if (_otherTyping && index == _messages.length + 1) {
                    return _TypingBubble(isMe: false);
                  }

                  final msg = _messages[index];

                  // Insert date separator if needed
                  Widget? dateSeparator;
                  if (index == 0 || !_isSameDay(_messages[index - 1].time, msg.time)) {
                    final now = DateTime.now();
                    String label;
                    if (_isSameDay(now, msg.time)) {
                      label = 'Today';
                    } else if (_isSameDay(now.subtract(const Duration(days: 1)), msg.time)) {
                      label = 'Yesterday';
                    } else {
                      label = "${msg.time.day}/${msg.time.month}/${msg.time.year}";
                    }
                    dateSeparator = _DateSeparator(label: label);
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (dateSeparator != null) dateSeparator,
                      Align(
                        alignment: msg.isMe ? Alignment.centerRight : Alignment.centerLeft,
                        child: GestureDetector(
                          onLongPress: () => _onMessageLongPress(msg),
                          child: _MessageBubble(
                            message: msg,
                            timeText: _formatTime(msg.time),
                            isDark: isDark,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                    ],
                  );
                },
              ),
            ),
            _InputBar(
              controller: _controller,
              focusNode: _focusNode,
              isComposing: _isComposing,
              onSend: _sendMessage,
              onAttach: _onAttach,
              onCamera: _onCamera,
              onEmoji: _onEmoji,
              onMic: _onMic,
            ),
          ],
        ),
      ),
    );
  }

  void _onMessageLongPress(MessageModel msg) async {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.reply_outlined),
                title: const Text('Reply'),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: const Icon(Icons.copy_outlined),
                title: const Text('Copy'),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: const Icon(Icons.forward_outlined),
                title: const Text('Forward'),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: const Icon(Icons.delete_outline),
                title: const Text('Delete'),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      },
    );
  }

  void _onAttach() {}
  void _onCamera() {}
  void _onEmoji() {}
  void _onMic() {}
}

class _MessageBubble extends StatelessWidget {
  final MessageModel message;
  final String timeText;
  final bool isDark;

  const _MessageBubble({
    required this.message,
    required this.timeText,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final isMe = message.isMe;
    final bg = isMe
        ? (isDark ? const Color(0xFF144D4A) : const Color(0xFFDCF8C6))
        : (isDark ? const Color(0xFF1F2C34) : Colors.white);
    final fg = isDark
        ? Colors.white
        : Colors.black87;

    final radius = BorderRadius.only(
      topLeft: const Radius.circular(16),
      topRight: const Radius.circular(16),
      bottomLeft: Radius.circular(isMe ? 16 : 4),
      bottomRight: Radius.circular(isMe ? 4 : 16),
    );

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 2),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: radius,
          boxShadow: [
            if (!isDark)
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (message.type == MessageType.text && message.text != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: SelectableText(
                  message.text!,
                  style: TextStyle(color: fg, fontSize: 15, height: 1.25),
                ),
              ),
            if (message.type == MessageType.image && message.imageUrl != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  message.imageUrl!,
                  width: 220,
                  fit: BoxFit.cover,
                ),
              ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  timeText,
                  style: TextStyle(
                    color: (isDark ? Colors.grey[300] : Colors.black54),
                    fontSize: 11,
                  ),
                ),
                const SizedBox(width: 4),
                if (message.isMe)
                  Icon(
                    message.read
                        ? Icons.done_all
                        : (message.delivered ? Icons.done_all : Icons.check),
                    size: 16,
                    color: message.read ? Colors.blueAccent : (isDark ? Colors.grey[300] : Colors.black45),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _DateSeparator extends StatelessWidget {
  final String label;
  const _DateSeparator({required this.label});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          const Expanded(child: Divider(thickness: 0.6)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: isDark ? Colors.white10 : Colors.black12,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isDark ? Colors.white70 : Colors.black87,
              ),
            ),
          ),
          const Expanded(child: Divider(thickness: 0.6)),
        ],
      ),
    );
  }
}

class _TypingBubble extends StatefulWidget {
  final bool isMe;
  const _TypingBubble({required this.isMe});

  @override
  State<_TypingBubble> createState() => _TypingBubbleState();
}

class _TypingBubbleState extends State<_TypingBubble>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bg = widget.isMe
        ? (isDark ? const Color(0xFF144D4A) : const Color(0xFFDCF8C6))
        : (isDark ? const Color(0xFF1F2C34) : Colors.white);

    return Align(
      alignment: widget.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: Radius.circular(widget.isMe ? 16 : 4),
            bottomRight: Radius.circular(widget.isMe ? 4 : 16),
          ),
        ),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final t = _controller.value;
            double d(double i) => (1 + (t * 6 + i) % 6) / 2.5; // 0.4..1
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _dot(d(0)),
                const SizedBox(width: 4),
                _dot(d(2)),
                const SizedBox(width: 4),
                _dot(d(4)),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _dot(double scale) {
    return Transform.scale(
      scale: scale,
      child: Container(
        width: 6,
        height: 6,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }
}

class _InputBar extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool isComposing;
  final VoidCallback onSend;
  final VoidCallback onAttach;
  final VoidCallback onCamera;
  final VoidCallback onEmoji;
  final VoidCallback onMic;

  const _InputBar({
    required this.controller,
    required this.focusNode,
    required this.isComposing,
    required this.onSend,
    required this.onAttach,
    required this.onCamera,
    required this.onEmoji,
    required this.onMic,
  });

  @override
  Widget build(BuildContext context) {
    final viewInsets = MediaQuery.of(context).viewInsets.bottom;
    return Container(
      padding: EdgeInsets.only(
        left: 8,
        right: 8,
        top: 6,
        bottom: viewInsets > 0 ? 6 : 12,
      ),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.emoji_emotions_outlined),
            onPressed: onEmoji,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white10
                    : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      focusNode: focusNode,
                      minLines: 1,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        hintText: 'Message',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  if (!isComposing) ...[
                    IconButton(
                      icon: const Icon(Icons.attach_file),
                      onPressed: onAttach,
                    ),
                    IconButton(
                      icon: const Icon(Icons.photo_camera_outlined),
                      onPressed: onCamera,
                    ),
                  ],
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            radius: 24,
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: IconButton(
              icon: Icon(isComposing ? Icons.send_rounded : Icons.mic),
              color: Colors.white,
              onPressed: isComposing ? onSend : onMic,
            ),
          ),
        ],
      ),
    );
  }
}
