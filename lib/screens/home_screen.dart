import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/app_theme.dart';
import 'package:flutter_application_1/screens/symptom_detail_screen.dart';
import 'package:flutter_application_1/screens/assessment_screen.dart';
import 'package:flutter_application_1/screens/facilities_screen.dart';
import 'package:flutter_application_1/screens/education_screen.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:flutter_application_1/services/auth_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HEALTHPATH'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await AuthService().logout();
              if (!context.mounted) return;
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.menu_book),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const EducationScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.local_hospital),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const FacilitiesScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: AppTheme.primaryColor,
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
              child: const Text(
                'Home',
                style: TextStyle(
                  fontSize: 24,
                  color: AppTheme.textDark,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hai ${AuthService().currentUser ?? ''} 👋\nApa yang kamu\nrasakan hari ini?',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Cari gejala...',
                      suffixIcon: const Icon(Icons.search, color: AppTheme.textLight),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(color: AppTheme.borderGrey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(color: AppTheme.borderGrey),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Gejala Umum',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    children: [
                      _buildSymptomCard(context, 'Sakit\nTenggorokan', Icons.sick, Colors.red[100]!),
                      _buildSymptomCard(context, 'Demam', Icons.thermostat, Colors.orange[100]!),
                      _buildSymptomCard(context, 'Sakit Kepala', Icons.face_retouching_natural, Colors.pink[100]!),
                      _buildSymptomCard(context, 'Batuk', Icons.coronavirus, Colors.blue[100]!),
                      _buildSymptomCard(context, 'Pilek', Icons.masks, Colors.orange[50]!),
                      _buildSymptomCard(context, 'Mual', Icons.sentiment_very_dissatisfied, Colors.green[100]!),
                    ],
                  ),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const AssessmentScreen(step: 1)),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppTheme.primaryColor),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Belum yakin?',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Coba cek gejala dengan bantuan asesmen singkat kami.',
                                  style: TextStyle(fontSize: 12, color: AppTheme.textDark.withOpacity(0.8)),
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.assignment, size: 40, color: AppTheme.primaryColorDark),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSymptomCard(BuildContext context, String title, IconData icon, Color bgColor) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SymptomDetailScreen(symptomName: title.replaceAll('\n', ' ')),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.primaryColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppTheme.primaryColor),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: bgColor,
              ),
              child: Icon(icon, color: AppTheme.textDark, size: 24),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
