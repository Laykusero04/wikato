import 'package:flutter/material.dart';
import 'manager_drawer.dart';

class ManagerQuestion extends StatefulWidget {
  const ManagerQuestion({super.key});

  @override
  State<ManagerQuestion> createState() => _ManagerQuestionState();
}

class _ManagerQuestionState extends State<ManagerQuestion> {
  String? selectedLevel;
  final TextEditingController wordController = TextEditingController();
  final TextEditingController option1Controller = TextEditingController();
  final TextEditingController option2Controller = TextEditingController();
  final TextEditingController option3Controller = TextEditingController();
  final TextEditingController option4Controller = TextEditingController();
  final TextEditingController correctAnswerController = TextEditingController();

  bool isRecording = false;
  String recordingStatus = 'Tap to record';

  final List<String> levels = [
    'Beginner',
    'Intermediate',
    'Advanced',
    'Expert'
  ];

  @override
  void dispose() {
    wordController.dispose();
    option1Controller.dispose();
    option2Controller.dispose();
    option3Controller.dispose();
    option4Controller.dispose();
    correctAnswerController.dispose();
    super.dispose();
  }

  void _toggleRecording() {
    setState(() {
      isRecording = !isRecording;
      recordingStatus = isRecording ? 'Recording...' : 'Tap to record';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Question',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.redAccent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/managerlevel');
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Level and Category Dropdown
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      hint: const Text(
                        'Select Level',
                        style: TextStyle(color: Colors.redAccent),
                      ),
                      value: selectedLevel,
                      isExpanded: true,
                      items: levels.map((String level) {
                        return DropdownMenuItem<String>(
                          value: level,
                          child: Text(level),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedLevel = newValue;
                        });
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Word or Sentence TextField
              _buildTextField(
                controller: wordController,
                label: 'Word or Sentence',
                icon: Icons.text_fields,
              ),
              const SizedBox(height: 20),

              // Voice Recording Section
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: InkWell(
                  onTap: _toggleRecording,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Icon(
                          isRecording ? Icons.stop_circle : Icons.mic,
                          size: 40,
                          color: isRecording ? Colors.black : Colors.redAccent,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          recordingStatus,
                          style: TextStyle(
                            color:
                                isRecording ? Colors.black : Colors.redAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (isRecording)
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: LinearProgressIndicator(
                              backgroundColor: Colors.red[100],
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                  Colors.redAccent),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Options Section
              _buildOptionsSection(),

              const SizedBox(height: 20),

              // Correct Answer TextField
              _buildTextField(
                controller: correctAnswerController,
                label: 'Correct Answer',
                icon: Icons.check_circle_outline,
              ),
              const SizedBox(height: 30),

              // Save Button
              ElevatedButton(
                onPressed: () {
                  // TODO: Implement save functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                ),
                child: const Text(
                  'Save Question',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionsSection() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Answer Options',
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            _buildTextField(
              controller: option1Controller,
              label: 'Option 1',
              icon: Icons.radio_button_unchecked,
            ),
            const SizedBox(height: 12),
            _buildTextField(
              controller: option2Controller,
              label: 'Option 2',
              icon: Icons.radio_button_unchecked,
            ),
            const SizedBox(height: 12),
            _buildTextField(
              controller: option3Controller,
              label: 'Option 3',
              icon: Icons.radio_button_unchecked,
            ),
            const SizedBox(height: 12),
            _buildTextField(
              controller: option4Controller,
              label: 'Option 4',
              icon: Icons.radio_button_unchecked,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.redAccent),
          prefixIcon: Icon(icon, color: Colors.redAccent),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 18,
          ),
        ),
      ),
    );
  }
}
