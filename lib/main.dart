import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      title: 'Plantify',
      home: const LoginScreen(),
    );
  }
}

// --------- color / style ---------
Color primaryColor = Color(0xFF199D5B); // green
Color secondaryColor = Color(0xFFF6F8F7); // light gray
TextStyle kSmallGrey = TextStyle(
  fontSize: 12,
  color: Color(0xFF6B7280),
); // label & subtitle
TextStyle kTitle = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.w700,
  color: Color(0xFF1A7F56),
);

InputDecoration inputDecoration(String hint, IconData icon) {
  return InputDecoration(
    hintText: hint,
    filled: true,
    fillColor: Colors.white,
    prefixIcon: Icon(icon),
    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: primaryColor, width: 1.5),
    ),
  );
}

Widget buildLabel(String text) => Padding(
  padding: const EdgeInsets.only(bottom: 6),
  child: Text(text, style: kSmallGrey),
);

Widget backcircle(BuildContext context) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Container(
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black12),
      ),
      child: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new, size: 18),
        onPressed: () => Navigator.maybePop(context),
      ),
    ),
  );
}

Widget brandrow() {
  return Row(
    children: [
      Icon(Icons.spa_outlined, color: primaryColor),
      SizedBox(width: 8),
      Text(
        'PLANTIFY',
        style: TextStyle(fontWeight: FontWeight.w700, letterSpacing: 1.2),
      ),
    ],
  );
}

//---------- login ui---------
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              backcircle(context),
              const SizedBox(height: 8),
              brandrow(),
              const SizedBox(height: 16),
              // Headings
              Text('Login', style: kTitle),
              const SizedBox(height: 8),
              Text(
                'Masukkan NISN dan password untuk\nmemulai belajar sekarang',
                style: kSmallGrey,
              ),
              const SizedBox(height: 24),

              // Username / Email
              buildLabel('Username/ Email'),
            ],
          ),
        ),
      ),
    );
  }
}
