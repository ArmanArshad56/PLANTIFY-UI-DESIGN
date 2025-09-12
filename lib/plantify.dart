// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // debugShowCheckedModeBanner: false,
//       title: 'Plantify',
//       home: const LoginScreen(),
//     );
//   }
// }

// // --------- color / style ---------
// Color primaryColor = Color(0xFF199D5B); // green
// Color secondaryColor = Color(0xFFF6F8F7); // light gray
// TextStyle kSmallGrey = TextStyle(
//   fontSize: 12,
//   color: Color(0xFF6B7280),
// ); // label & subtitle
// TextStyle kTitle = TextStyle(
//   fontSize: 28,
//   fontWeight: FontWeight.w700,
//   color: Color(0xFF1A7F56),
// );

// InputDecoration inputDecoration(String hint, IconData icon) {
//   return InputDecoration(
//     hintText: hint,
//     filled: true,
//     fillColor: Colors.white,
//     prefixIcon: Icon(icon),
//     contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
//     border: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(12),
//       borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
//     ),
//     enabledBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(12),
//       borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
//     ),
//     focusedBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(12),
//       borderSide: BorderSide(color: primaryColor, width: 1.5),
//     ),
//   );
// }

// Widget buildLabel(String text) => Padding(
//   padding: const EdgeInsets.only(bottom: 6),
//   child: Text(text, style: kSmallGrey),
// );

// Widget backcircle(BuildContext context) {
//   return Align(
//     alignment: Alignment.centerLeft,
//     child: Container(
//       margin: const EdgeInsets.only(top: 8),
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         border: Border.all(color: Colors.black12),
//       ),
//       child: IconButton(
//         icon: const Icon(Icons.arrow_back_ios_new, size: 18),
//         onPressed: () => Navigator.maybePop(context),
//       ),
//     ),
//   );
// }

// Widget brandrow() {
//   return Row(
//     children: [
//       Icon(Icons.spa_outlined, color: primaryColor),
//       SizedBox(width: 8),
//       Text(
//         'PLANTIFY',
//         style: TextStyle(fontWeight: FontWeight.w700, letterSpacing: 1.2),
//       ),
//     ],
//   );
// }

// //---------- login ui---------
// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: secondaryColor,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               backcircle(context),
//               const SizedBox(height: 8),
//               brandrow(),
//               const SizedBox(height: 16),
//               // Headings
//               Text('Login', style: kTitle),
//               const SizedBox(height: 8),
//               Text(
//                 'Masukkan NISN dan password untuk\nmemulai belajar sekarang',
//                 style: kSmallGrey,
//               ),
//               const SizedBox(height: 24),

//               // Username / Email
//               buildLabel('Username/ Email'),
//               TextField(
//                 decoration: inputDecoration(
//                   'Masukkan Username atau Email',
//                   Icons.email_outlined,
//                 ),
//               ),
//               const SizedBox(height: 14),

//               // Password
//               buildLabel('Password'),
//               _PasswordField(),
//               const SizedBox(height: 6),

//               // Forgot password
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: TextButton(
//                   onPressed: () {},
//                   child: Text(
//                     'Forgot password',
//                     style: TextStyle(color: primaryColor),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 8),

//               // CTA Button
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: primaryColor,
//                     foregroundColor: Colors.white,
//                     minimumSize: const Size.fromHeight(52),
//                     shape: const StadiumBorder(),
//                   ),
//                   onPressed: () {},
//                   child: const Text(
//                     'LOG IN',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 14),

//               // Go to signup
//               Center(
//                 child: TextButton(
//                   onPressed: () {
//                     Navigator.of(context).push(
//                       MaterialPageRoute(builder: (_) => const SignUpScreen()),
//                     );
//                   },
//                   child: RichText(
//                     text: TextSpan(
//                       text: "Don't have an account? ",
//                       style: kSmallGrey,
//                       children: [
//                         TextSpan(
//                           text: 'Sign Up',
//                           style: TextStyle(
//                             color: primaryColor,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SignUpScreen extends StatelessWidget {
//   const SignUpScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: secondaryColor,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               backcircle(context),
//               const SizedBox(height: 8),
//               brandrow(),
//               const SizedBox(height: 16),
//               // Headings
//               Text('Sign Up', style: kTitle),
//               const SizedBox(height: 8),
//               Text(
//                 'Masukkan NISN dan password untuk\nmemulai belajar sekarang',
//                 style: kSmallGrey,
//               ),
//               const SizedBox(height: 24),

//               // Username / Email
//               buildLabel('Username/ Email'),
//               TextField(
//                 decoration: inputDecoration(
//                   'Masukkan Username atau Email',
//                   Icons.email_outlined,
//                 ),
//               ),
//               const SizedBox(height: 14),

//               // Password
//               buildLabel('Password'),
//               _PasswordField(),
//               const SizedBox(height: 6),

//               // Forgot password
//               // Align(
//               //   alignment: Alignment.centerRight,
//               //   child: TextButton(
//               //     onPressed: () {},
//               //     child: Text(
//               //       'Forgot password',
//               //       style: TextStyle(color: primaryColor),
//               //     ),
//               //   ),
//               // ),
//               const SizedBox(height: 8),

//               // CTA Button
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: primaryColor,
//                     foregroundColor: Colors.white,
//                     minimumSize: const Size.fromHeight(52),
//                     shape: const StadiumBorder(),
//                   ),
//                   onPressed: () {},
//                   child: const Text(
//                     'SIGN UP',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 14),

//               // Go to signup
//               Center(
//                 child: TextButton(
//                   onPressed: () {
//                     Navigator.of(
//                       context,
//                     ).push(MaterialPageRoute(builder: (_) => const SignUpUI()));
//                   },
//                   child: RichText(
//                     text: TextSpan(
//                       text: "Already have an account? ",
//                       style: kSmallGrey,
//                       children: [
//                         TextSpan(
//                           text: 'Log In',
//                           style: TextStyle(
//                             color: primaryColor,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _PasswordField extends StatefulWidget {
//   const _PasswordField();

//   @override
//   State<_PasswordField> createState() => _PasswordFieldState();
// }

// class _PasswordFieldState extends State<_PasswordField> {
//   bool _obscure = true;
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       obscureText: _obscure,
//       decoration: inputDecoration('Masukkan Password', Icons.lock_outline)
//           .copyWith(
//             suffixIcon: IconButton(
//               icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
//               onPressed: () => setState(() => _obscure = !_obscure),
//             ),
//           ),
//     );
//   }
// }

// //---------- signup ui---------

// class SignUpUI extends StatelessWidget {
//   const SignUpUI({super.key});

//   @override\
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }
