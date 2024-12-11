import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AllReportsScreen(),
    );
  }
}

class AllReportsScreen extends StatelessWidget {
  const AllReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Reports'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ReportTile(
              icon: Icons.phone_android,
              title: 'Recharge',
              onTap: () {
                // Navigate to Recharge report
              },
            ),
            const SizedBox(height: 12),
            ReportTile(
              icon: Icons.refresh,
              title: 'Mudra Reports',
              onTap: () {
                // Navigate to Mudra Reports
              },
            ),
            const SizedBox(height: 12),
            ReportTile(
              icon: Icons.receipt,
              title: 'BBPS',
              onTap: () {
                // Navigate to BBPS report
              },
            ),
            const SizedBox(height: 12),
            ReportTile(
              icon: Icons.fingerprint,
              title: 'AEPS',
              onTap: () {
                // Navigate to AEPS report
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ReportTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ReportTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 5.0,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.blueAccent,
              size: 28,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
