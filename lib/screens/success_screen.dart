import 'package:flutter/material.dart';
import '../models/job.dart';
import '../theme/app_theme.dart';
import 'chat_screen.dart';

class SuccessScreen extends StatelessWidget {
  final MicroJob job;

  const SuccessScreen({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close_rounded, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              // Vector Collaboration Illustration (from PDF page 14-16)
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset(
                  'assets/images/success_applied.jpg',
                  width: 220,
                  height: 220,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 24),

              // Title from PDF
              const Text(
                "Success. You've Applied.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary,
                  letterSpacing: -0.4,
                ),
              ),
              const SizedBox(height: 8),

              // Subtitle from PDF
              const Text(
                'Kami akan memberikan informasi terbaru melalui kanal Message & Notifikasi.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 28),

              // Application Status Steps Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: AppColors.border),
                ),
                child: Column(
                  children: [
                    _buildStep(
                      icon: Icons.check,
                      isDone: true,
                      title: 'Lamaran & Portofolio Terkirim',
                      subtitle: 'Baru saja • Edwin Iqbal Santoso',
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: Divider(color: AppColors.border),
                    ),
                    _buildStep(
                      icon: Icons.schedule,
                      isDone: false,
                      isPending: true,
                      title: 'Review oleh ${job.company}',
                      subtitle: 'Estimasi respon dalam 24 jam',
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: Divider(color: AppColors.border),
                    ),
                    _buildStep(
                      icon: Icons.lock_outline,
                      isDone: false,
                      title: 'Pengerjaan & Escrow SafePay Aktif',
                      subtitle: 'Dana ${job.salary} terkunci aman',
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Discover More Button (from PDF page 24-25)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ChatScreen(job: job),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.tealDeep,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text('Buka Chat dengan UMKM 💬'),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Discover More Projects',
                    style: TextStyle(
                      color: AppColors.tealDeep,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStep({
    required IconData icon,
    required bool isDone,
    bool isPending = false,
    required String title,
    required String subtitle,
  }) {
    Color iconBg = const Color(0xFFE2E8F0);
    Color iconColor = const Color(0xFF94A3B8);

    if (isDone) {
      iconBg = AppColors.success;
      iconColor = Colors.white;
    } else if (isPending) {
      iconBg = AppColors.yellowCitrus;
      iconColor = const Color(0xFF09474E);
    }

    return Row(
      children: [
        Container(
          width: 26,
          height: 26,
          decoration: BoxDecoration(
            color: iconBg,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 14, color: iconColor),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold),
              ),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 11, color: AppColors.textMuted),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
