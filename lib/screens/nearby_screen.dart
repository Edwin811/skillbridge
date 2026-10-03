import 'package:flutter/material.dart';
import '../models/job.dart';
import '../theme/app_theme.dart';
import 'job_detail_screen.dart';

class NearbyScreen extends StatefulWidget {
  const NearbyScreen({super.key});

  @override
  State<NearbyScreen> createState() => _NearbyScreenState();
}

class _NearbyScreenState extends State<NearbyScreen> {
  int selectedJobIndex = 0;
  String currentRadius = '3 KM';

  @override
  Widget build(BuildContext context) {
    final selectedJob = mockJobs[selectedJobIndex];

    return Scaffold(
      body: Stack(
        children: [
          // City Map Canvas Painter
          Positioned.fill(
            child: CustomPaint(
              painter: MapGridPainter(selectedPinIndex: selectedJobIndex),
            ),
          ),

          // Top Floating Navigation Bar
          Positioned(
            top: 48,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.location_on, color: AppColors.tealDeep, size: 18),
                      SizedBox(width: 6),
                      Text(
                        'Nearby Micro-Jobs',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (currentRadius == '3 KM') {
                        currentRadius = '5 KM';
                      } else if (currentRadius == '5 KM') {
                        currentRadius = '10 KM';
                      } else {
                        currentRadius = '3 KM';
                      }
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Radius: $currentRadius',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.tealDeep,
                          ),
                        ),
                        const Icon(Icons.arrow_drop_down, color: AppColors.tealDeep, size: 18),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Distance Pill (from PDF page 2: "10.3KM" or "1.8KM")
          Positioned(
            top: selectedJobIndex == 0 ? 210 : (selectedJobIndex == 1 ? 310 : 420),
            left: selectedJobIndex == 0 ? 140 : (selectedJobIndex == 1 ? 160 : 100),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.tealMedium, width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Text('⚡ '),
                  Text(
                    '${selectedJob.distance} • 12 Mnt',
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      color: AppColors.tealDeep,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // User GPS Marker (Student Edwin)
          Positioned(
            bottom: 220,
            left: 50,
            child: Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: AppColors.tealDeep,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 3),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.tealDeep.withOpacity(0.4),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/avatar_ryan.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // UMKM Pin 1: Kopi Sentosa
          Positioned(
            top: 140,
            right: 80,
            child: GestureDetector(
              onTap: () => setState(() => selectedJobIndex = 0),
              child: _buildMapPin(
                title: 'Kopi Sentosa',
                isSelected: selectedJobIndex == 0,
                icon: Icons.coffee,
              ),
            ),
          ),

          // UMKM Pin 2: Batik Kinanti
          Positioned(
            top: 280,
            right: 40,
            child: GestureDetector(
              onTap: () => setState(() => selectedJobIndex = 1),
              child: _buildMapPin(
                title: 'Batik Kinanti',
                isSelected: selectedJobIndex == 1,
                icon: Icons.palette,
              ),
            ),
          ),

          // UMKM Pin 3: Toko Grosir
          Positioned(
            bottom: 290,
            right: 140,
            child: GestureDetector(
              onTap: () => setState(() => selectedJobIndex = 2),
              child: _buildMapPin(
                title: 'Grosir Barokah',
                isSelected: selectedJobIndex == 2,
                icon: Icons.receipt_long,
              ),
            ),
          ),

          // Floating Bottom Sheet Card (from PDF page 2, 8, 29)
          Positioned(
            bottom: 20,
            left: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.border),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.tealDeep.withOpacity(0.18),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.asset(
                      selectedJob.imageAsset,
                      width: 64,
                      height: 64,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          selectedJob.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        Text(
                          '${selectedJob.company} • ${selectedJob.distance}',
                          style: const TextStyle(
                            fontSize: 11,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          selectedJob.salary,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: AppColors.tealDeep,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => JobDetailScreen(job: selectedJob),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.tealDeep,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Details',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
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

  Widget _buildMapPin({
    required String title,
    required bool isSelected,
    required IconData icon,
  }) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.tealDeep : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? AppColors.yellowCitrus : AppColors.tealDeep,
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 14,
                color: isSelected ? AppColors.yellowCitrus : AppColors.tealDeep,
              ),
              const SizedBox(width: 4),
              Text(
                title,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
        Icon(
          Icons.arrow_drop_down,
          color: isSelected ? AppColors.yellowCitrus : AppColors.tealDeep,
          size: 20,
        ),
      ],
    );
  }
}

class MapGridPainter extends CustomPainter {
  final int selectedPinIndex;

  MapGridPainter({required this.selectedPinIndex});

  @override
  void paint(Canvas canvas, Size size) {
    final bgPaint = Paint()..color = const Color(0xFFE8EFF2);
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bgPaint);

    final blockPaint = Paint()
      ..color = const Color(0xFFD5E2E8)
      ..style = PaintingStyle.fill;

    // Draw architectural block parcels matching PDF pages
    canvas.drawRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(20, 80, 80, 60), const Radius.circular(8)), blockPaint);
    canvas.drawRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(120, 70, 110, 70), const Radius.circular(8)), blockPaint);
    canvas.drawRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(250, 80, 120, 60), const Radius.circular(8)), blockPaint);

    canvas.drawRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(30, 160, 90, 70), const Radius.circular(8)), blockPaint);
    canvas.drawRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(140, 160, 110, 80), const Radius.circular(8)), blockPaint);
    canvas.drawRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(270, 160, 100, 80), const Radius.circular(8)), blockPaint);

    canvas.drawRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(20, 250, 90, 80), const Radius.circular(8)), blockPaint);
    canvas.drawRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(130, 260, 130, 100), const Radius.circular(8)), blockPaint);
    canvas.drawRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(280, 260, 90, 80), const Radius.circular(8)), blockPaint);

    canvas.drawRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(30, 350, 80, 90), const Radius.circular(8)), blockPaint);
    canvas.drawRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(150, 380, 110, 110), const Radius.circular(8)), blockPaint);
    canvas.drawRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(280, 360, 90, 90), const Radius.circular(8)), blockPaint);

    canvas.drawRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(20, 460, 100, 80), const Radius.circular(8)), blockPaint);
    canvas.drawRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(140, 510, 120, 100), const Radius.circular(8)), blockPaint);
    canvas.drawRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(280, 480, 90, 80), const Radius.circular(8)), blockPaint);

    // Draw Roads (White stroke)
    final roadPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 14
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(Offset(0, size.height * 0.22), Offset(size.width, size.height * 0.22), roadPaint);
    canvas.drawLine(Offset(0, size.height * 0.36), Offset(size.width, size.height * 0.36), roadPaint);
    canvas.drawLine(Offset(0, size.height * 0.58), Offset(size.width, size.height * 0.58), roadPaint);
    canvas.drawLine(Offset(size.width * 0.32, 0), Offset(size.width * 0.32, size.height), roadPaint);
    canvas.drawLine(Offset(size.width * 0.68, 0), Offset(size.width * 0.68, size.height), roadPaint);

    // Draw Polyline Route connecting user GPS marker to active pin
    final routePaint = Paint()
      ..color = AppColors.tealMedium
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final path = Path();
    final startX = 68.0;
    final startY = size.height - 239.0;
    path.moveTo(startX, startY);

    if (selectedPinIndex == 0) {
      path.lineTo(startX, size.height * 0.58);
      path.lineTo(size.width * 0.32, size.height * 0.58);
      path.lineTo(size.width * 0.32, size.height * 0.22);
      path.lineTo(size.width * 0.68, size.height * 0.22);
      path.lineTo(size.width - 110, 180);
    } else if (selectedPinIndex == 1) {
      path.lineTo(startX, size.height * 0.58);
      path.lineTo(size.width * 0.68, size.height * 0.58);
      path.lineTo(size.width * 0.68, 320);
      path.lineTo(size.width - 70, 320);
    } else {
      path.lineTo(startX, size.height * 0.58);
      path.lineTo(size.width * 0.32, size.height * 0.58);
      path.lineTo(size.width * 0.32, size.height - 310);
      path.lineTo(size.width - 170, size.height - 310);
    }

    canvas.drawPath(path, routePaint);
  }

  @override
  bool shouldRepaint(covariant MapGridPainter oldDelegate) {
    return oldDelegate.selectedPinIndex != selectedPinIndex;
  }
}
