import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/app_theme.dart';
import 'package:flutter_application_1/screens/assessment_screen.dart';

class SymptomDetailScreen extends StatelessWidget {
  final String symptomName;

  const SymptomDetailScreen({super.key, required this.symptomName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HEALTHPATH'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Pilih Gejala',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppTheme.primaryColorDark),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.sick, size: 40, color: AppTheme.textDark),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                symptomName,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'Peradangan atau iritasi pada tenggorokan yang dapat menyebabkan nyeri saat menelan.',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Gejala Lain',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  _buildOtherSymptom(context, 'Demam', Icons.thermostat),
                  _buildOtherSymptom(context, 'Sakit Kepala', Icons.face),
                  _buildOtherSymptom(context, 'Batuk', Icons.coronavirus),
                  _buildOtherSymptom(context, 'Pilek', Icons.masks),
                  _buildOtherSymptom(context, 'Mual', Icons.sentiment_very_dissatisfied),
                  _buildOtherSymptom(context, 'Nyeri Dada', Icons.favorite),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppTheme.borderGrey),
                    ),
                    child: const Text(
                      'Informasi ini bukan pengganti diagnosis. Jika gejala berlanjut, segera konsultasi ke tenaga medis.',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'Penyebab',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      '1. Infeksi Virus (Penyebab Tersering)\n'
                      'Sebagian besar kasus sakit tenggorokan disebabkan oleh virus, misalnya:\n'
                      ' • Flu (Influenza)\n'
                      ' • Pilek biasa (Common Cold)\n'
                      ' • COVID-19\n\n'
                      '2. Infeksi Bakteri\n'
                      'Salah satu penyebab yang cukup umum adalah radang tenggorokan akibat bakteri (Strep Throat).\n\n'
                      '3. Alergi\n'
                      'Alergi terhadap debu, serbuk sari, bulu hewan dapat menyebabkan iritasi.',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'Cara Meredakan',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      '1. Perbanyak Minum Air Putih\n\n'
                      '2. Berkumur Air Garam Hangat\n\n'
                      '3. Istirahat yang Cukup\n\n'
                      '4. Konsumsi Minuman Hangat\n\n'
                      '5. Hindari Iritan\n\n'
                      '6. Gunakan Pelembap Udara (Humidifier)',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'Faktor Lingkungan',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      '1. Polusi Udara\n\n'
                      '2. Asap Rokok\n\n'
                      '3. Debu dan Partikulat\n\n'
                      '4. Udara Kering\n\n'
                      '5. Alergen Lingkungan',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOtherSymptom(BuildContext context, String title, IconData icon) {
    return GestureDetector(
      onTap: () {
        if (title.toLowerCase() == 'demam') {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AssessmentScreen(step: 1),
            ),
          );
        } else {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => SymptomDetailScreen(symptomName: title),
            ),
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppTheme.primaryColor.withOpacity(0.4),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.red[300], size: 20),
                const SizedBox(width: 12),
                Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
              ],
            ),
            const Icon(Icons.chevron_right, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
