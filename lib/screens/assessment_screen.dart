import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/app_theme.dart';
import 'package:flutter_application_1/screens/facilities_screen.dart';
import 'package:flutter_application_1/screens/assessment_result_screen.dart';

class AssessmentScreen extends StatefulWidget {
  final int step;
  final List<String> previousAnswers;

  const AssessmentScreen({super.key, required this.step, this.previousAnswers = const []});

  @override
  State<AssessmentScreen> createState() => _AssessmentScreenState();
}

class _AssessmentScreenState extends State<AssessmentScreen> {
  String? selectedAnswer;

  void _nextStep() {
    if (selectedAnswer == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Silakan pilih jawaban terlebih dahulu')),
      );
      return;
    }

    final newAnswers = List<String>.from(widget.previousAnswers)..add(selectedAnswer!);

    if (widget.step < 3) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => AssessmentScreen(step: widget.step + 1, previousAnswers: newAnswers),
        ),
      );
    } else {
      bool allYes = newAnswers.every((ans) => ans == 'Ya');
      if (allYes) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const FacilitiesScreen()),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const AssessmentResultScreen()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    String question = '';
    String subQuestion = '';
    IconData icon = Icons.help;
    Color iconColor = Colors.grey;

    if (widget.step == 1) {
      question = 'Apakah demam tinggi?';
      subQuestion = 'Suhu di atas 38.5 C\natau terasa menggigil.';
      icon = Icons.thermostat;
      iconColor = Colors.red;
    } else if (widget.step == 2) {
      question = 'Apakah sulit bernapas?';
      subQuestion = 'Sesak napas, napas\ncepat, atau terasa berat\nsaat bernapas';
      icon = Icons.coronavirus; // Lung icon approximation
      iconColor = Colors.pink;
    } else if (widget.step == 3) {
      question = 'Apakah nyeri saat\nmenelan?';
      subQuestion = 'Nyeri atau terasa perih\nketika menelan makanan/\nminuman';
      icon = Icons.sick;
      iconColor = Colors.orange;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('HEALTHPATH'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Text(
              'Asesmen Gejala',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    value: widget.step / 3,
                    backgroundColor: AppTheme.borderGrey,
                    color: AppTheme.primaryColorDark,
                  ),
                ),
                const SizedBox(width: 12),
                Text('${widget.step}/3', style: const TextStyle(color: AppTheme.textLight)),
              ],
            ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                border: Border.all(color: AppTheme.primaryColor),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppTheme.greyBackground,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppTheme.borderGrey),
                        ),
                        child: Icon(icon, color: iconColor, size: 32),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              question,
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              subQuestion,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  _buildAnswerButton('Ya'),
                  const SizedBox(height: 16),
                  _buildAnswerButton('Tidak'),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _nextStep,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor,
                  foregroundColor: AppTheme.textDark,
                ),
                child: const Text('Selanjutnya'),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildAnswerButton(String text) {
    bool isSelected = selectedAnswer == text;
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedAnswer = text;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? AppTheme.primaryColorDark : AppTheme.primaryColor.withOpacity(0.4),
          foregroundColor: AppTheme.textDark,
          elevation: 0,
        ),
        child: Text(text),
      ),
    );
  }
}
