import 'package:flutter/material.dart';
import '../models/job.dart';
import '../theme/app_theme.dart';

class ChatScreen extends StatefulWidget {
  final MicroJob? job;

  const ChatScreen({super.key, this.job});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _msgController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [
    {
      'isMe': false,
      'text': 'Halo Edwin! Kami sudah melihat portofolio kamu di SkillBridge. Konsep visualmu sangat pas dengan vibe cafe kami.',
      'time': '10:15',
    },
    {
      'isMe': true,
      'text': 'Halo Pak Hendra, terima kasih banyak! Saya siap membantu pengerjaan 9 template feed dan buku menu baru.',
      'time': '10:18',
    },
    {
      'isMe': false,
      'text': 'Sudah saya lampirkan brief di Google Drive. Escrow dana Rp 2.500.000 juga sudah disetor aman ke SkillBridge.',
      'time': '10:20',
    },
    {
      'isMe': true,
      'text': 'Siap Pak, draft pertama akan saya kirimkan lusa untuk direview. Terima kasih! ☕🎨',
      'time': '10:22',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final companyName = widget.job?.company ?? 'Kopi Sentosa (Pak Hendra)';

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.textPrimary,
        elevation: 0.5,
        title: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage('assets/images/coffee_shop.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  companyName,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const Text(
                  '● Online • Terverifikasi SafePay',
                  style: TextStyle(fontSize: 10.5, color: AppColors.success),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Escrow Status Banner
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: const BoxDecoration(
              color: Color(0xFFFEF3C7),
              border: Border(bottom: BorderSide(color: Color(0xFFFDE68A))),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  '🔒 SafePay Escrow: Rp 2.500.000',
                  style: TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF92400E),
                  ),
                ),
                Text(
                  'Dana Diamankan SkillBridge',
                  style: TextStyle(
                    fontSize: 10.5,
                    color: Color(0xFF92400E),
                  ),
                ),
              ],
            ),
          ),

          // Message Stream
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                final isMe = msg['isMe'] as bool;
                return Align(
                  alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.75,
                    ),
                    decoration: BoxDecoration(
                      color: isMe ? AppColors.tealDeep : Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(16),
                        topRight: const Radius.circular(16),
                        bottomLeft: isMe ? const Radius.circular(16) : Radius.zero,
                        bottomRight: isMe ? Radius.zero : const Radius.circular(16),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment:
                          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                      children: [
                        Text(
                          msg['text'] as String,
                          style: TextStyle(
                            color: isMe ? Colors.white : AppColors.textPrimary,
                            fontSize: 13,
                            height: 1.4,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          msg['time'] as String,
                          style: TextStyle(
                            color: isMe ? AppColors.mintSoft : AppColors.textMuted,
                            fontSize: 9.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Bottom Chat Input Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: AppColors.border)),
            ),
            child: SafeArea(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: TextField(
                        controller: _msgController,
                        decoration: const InputDecoration(
                          hintText: 'Tulis pesan ke UMKM..',
                          hintStyle: TextStyle(fontSize: 13, color: AppColors.textMuted),
                          border: InputBorder.none,
                          isDense: true,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    decoration: const BoxDecoration(
                      color: AppColors.yellowCitrus,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.send_rounded, color: Color(0xFF09474E), size: 18),
                      onPressed: () {
                        if (_msgController.text.trim().isNotEmpty) {
                          setState(() {
                            _messages.add({
                              'isMe': true,
                              'text': _msgController.text.trim(),
                              'time': 'Sekarang',
                            });
                            _msgController.clear();
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
