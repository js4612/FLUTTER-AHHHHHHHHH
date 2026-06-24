import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/app_theme.dart';

class AssessmentResultScreen extends StatelessWidget {
  const AssessmentResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HEALTHPATH'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Cara Meredakan',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400), // Matched styling from image
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.primaryColor.withOpacity(0.4),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppTheme.primaryColorDark),
              ),
              child: const Text(
                '1. Perbanyak Minum Air Putih\n'
                'Menjaga tenggorokan tetap lembap dapat mengurangi iritasi dan membantu proses penyembuhan.',
                style: TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.primaryColor.withOpacity(0.4),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppTheme.primaryColorDark),
              ),
              child: const Text(
                '2. Berkumur Air Garam Hangat\n'
                'Campurkan sekitar ½ sendok teh garam ke dalam segelas air hangat, lalu berkumur selama 30 detik beberapa kali sehari.\n'
                'Manfaat:\n'
                ' • Mengurangi peradangan\n'
                ' • Membantu membersihkan lendir\n'
                ' • Meredakan nyeri',
                style: TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.primaryColor.withOpacity(0.4),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppTheme.primaryColorDark),
              ),
              child: const Text(
                '3. Istirahat yang Cukup\n'
                'Tubuh membutuhkan energi untuk melawan infeksi dan memperbaiki jaringan yang meradang.',
                style: TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.primaryColor.withOpacity(0.4),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppTheme.primaryColorDark),
              ),
              child: const Text(
                '4. Konsumsi Minuman Hangat\n'
                'Contoh:\n'
                ' • Air hangat\n'
                ' • Teh hangat\n'
                ' • Sup hangat',
                style: TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.primaryColor.withOpacity(0.4),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppTheme.primaryColorDark),
              ),
              child: const Text(
                '5. Hindari Iritan\n'
                'Usahakan mengurangi paparan:\n'
                ' • Asap rokok\n'
                ' • Debu\n'
                ' • Polusi udara\n'
                ' • Bahan kimia yang menyengat',
                style: TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.primaryColor.withOpacity(0.4),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppTheme.primaryColorDark),
              ),
              child: const Text(
                '6. Gunakan Pelembap Udara (Humidifier)\n'
                'Jika udara ruangan kering, humidifier dapat membantu menjaga kelembapan dan mengurangi rasa kering pada tenggorokan.',
                style: TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Faktor Lingkungan',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppTheme.primaryColorDark),
              ),
              child: const Text(
                '1. Polusi Udara\n'
                'Paparan polusi dari kendaraan bermotor, industri, atau pembakaran sampah dapat mengiritasi saluran pernapasan dan menyebabkan:\n'
                ' • Tenggorokan kering\n'
                ' • Rasa terbakar atau perih\n'
                ' • Batuk\n'
                ' • Suara serak\n\n'
                '2. Asap Rokok\n'
                'Baik perokok aktif maupun pasif berisiko mengalami iritasi tenggorokan karena zat kimia dalam asap rokok dapat merusak lapisan pelindung saluran napas.\n\n'
                '3. Debu dan Partikulat\n'
                'Paparan debu rumah, debu konstruksi, atau partikel halus di lingkungan kerja dapat memicu:\n'
                ' • Iritasi tenggorokan\n'
                ' • Batuk\n'
                ' • Reaksi alergi\n\n'
                '4. Udara Kering\n'
                'Penggunaan AC dalam waktu lama, cuaca kering, atau kelembapan ruangan yang rendah dapat menyebabkan:\n'
                ' • Tenggorokan terasa kering dan gatal\n'
                ' • Nyeri saat menelan\n'
                ' • Suara menjadi serak\n\n'
                '5. Alergen Lingkungan\n'
                'Beberapa alergen yang umum:\n'
                ' • Serbuk sari tanaman\n'
                ' • Bulu hewan peliharaan\n'
                ' • Tungau debu\n'
                ' • Jamur\n'
                'Alergen dapat memicu peradangan dan produksi lendir berlebih yang mengalir ke tenggorokan (postnasal drip).\n\n'
                '6. Paparan Bahan Kimia\n'
                'Lingkungan kerja tertentu dapat meningkatkan risiko iritasi tenggorokan, misalnya:\n'
                ' • Disinfektan dan pembersih kimia\n'
                ' • Cat dan pelarut\n'
                ' • Asap pengelasan\n'
                ' • Pestisida\n\n'
                '7. Ventilasi Ruangan yang Buruk\n'
                'Ruangan yang tertutup dan minim sirkulasi udara dapat meningkatkan konsentrasi polutan, debu, atau mikroorganisme yang menyebabkan gangguan pernapasan.',
                style: TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
