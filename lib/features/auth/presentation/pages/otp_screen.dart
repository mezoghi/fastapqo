import 'package:flutter/material.dart';
import 'dart:async'; // Added for Timer

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  int seconds = 60;
  late final TextEditingController _otpController;
  late final FocusNode _focusNode;
  late final Timer _timer;

  @override
  void initState() {
    super.initState();
    _otpController = TextEditingController();
    _focusNode = FocusNode();
    _startTimer();
  }

  void _startTimer() {
    seconds = 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds == 0) {
        timer.cancel();
      } else {
        setState(() {
          seconds--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _otpController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FFF0),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              Text(
                'التحقق من رقم الهاتف',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFB2A900),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                'أدخل رمز التحقق المكون من 6 أرقام الذي تم إرساله إلى رقم هاتفك.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              const SizedBox(height: 32),
              TextField(
                controller: _otpController,
                focusNode: _focusNode,
                keyboardType: TextInputType.number,
                maxLength: 6,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 28, letterSpacing: 16),
                decoration: InputDecoration(
                  counterText: '',
                  filled: true,
                  fillColor: Color(0xFFFFFDE7), // أصفر فاتح جدًا
                  border: OutlineInputBorder(),
                  hintText: '● ● ● ● ● ●',
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // TODO: تحقق من الكود
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB2FF59),
                  foregroundColor: Colors.black87,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('تأكيد الكود', style: TextStyle(fontSize: 18)),
              ),
              const SizedBox(height: 24),
              if (seconds > 0)
                Text(
                  'يمكنك إعادة إرسال الكود خلال $seconds ثانية',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 15, color: Color(0xFFB2A900)),
                )
              else
                TextButton(
                  onPressed: () {
                    _otpController.clear();
                    _focusNode.requestFocus();
                    _startTimer();
                  },
                  child: const Text(
                    'إعادة إرسال الكود',
                    style: TextStyle(fontSize: 16, color: Color(0xFF7CB342)),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
} 