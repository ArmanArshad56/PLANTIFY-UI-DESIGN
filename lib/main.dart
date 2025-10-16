// main.dart
// ignore_for_file: deprecated_member_use, sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

// ------------------------------------------------------------
// THEME: Cool Blues + Grass Green + Soft Purple (Material 3)
// ------------------------------------------------------------
const _brandBlue = Color(0xFF2563EB); // primary blue
const _grassGreen = Color(0xFF10B981); // grass green
const _softPurple = Color(0xFF7C3AED); // accent purple
const _inkGrey = Color(0xFF6B7280); // labels / helper
const _bgLight = Color(0xFFF6F8FB); // app scaffold

ColorScheme _colorScheme = const ColorScheme(
  brightness: Brightness.light,
  primary: _brandBlue,
  onPrimary: Colors.white,
  secondary: _grassGreen,
  onSecondary: Colors.white,
  tertiary: _softPurple,
  onTertiary: Colors.white,
  surface: Colors.white,
  onSurface: Color(0xFF111827),
  error: Color(0xFFEF4444),
  onError: Colors.white,
);

final _inputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(12),
  borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
);

ThemeData _buildTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: _colorScheme,
    scaffoldBackgroundColor: _bgLight,
    fontFamily: 'Roboto',
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
      titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      bodyMedium: TextStyle(fontSize: 14),
      bodySmall: TextStyle(fontSize: 12, color: _inkGrey),
    ),
    iconTheme: const IconThemeData(color: _brandBlue),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      hintStyle: const TextStyle(color: Color(0xFF9CA3AF)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      border: _inputBorder,
      enabledBorder: _inputBorder,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: _brandBlue, width: 1.6),
      ),
      errorBorder: _inputBorder.copyWith(
        borderSide: const BorderSide(color: Color(0xFFEF4444)),
      ),
      prefixIconColor: _brandBlue,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(const Size.fromHeight(52)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
        ),
        elevation: WidgetStateProperty.resolveWith<double>((states) {
          if (states.contains(WidgetState.pressed)) return 10;
          if (states.contains(WidgetState.hovered)) return 6;
          return 3;
        }),
        shadowColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.pressed)) {
            return _softPurple.withOpacity(0.35);
          }
          return _brandBlue.withOpacity(0.25);
        }),
        backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.pressed)) return _softPurple;
          if (states.contains(WidgetState.hovered)) return _grassGreen;
          return _brandBlue;
        }),
        foregroundColor: WidgetStateProperty.all(Colors.white),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.pressed)) return _softPurple;
          return _brandBlue;
        }),
      ),
    ),
  );
}

/// ------------------------------------------------------------
/// APP
/// ------------------------------------------------------------
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Content',
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(),
      home: const LoginScreen(),
    );
  }
}

/// ------------------------------------------------------------
/// Common widgets / helpers
/// ------------------------------------------------------------
class BrandRow extends StatelessWidget {
  const BrandRow({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Leaf + sparkle combo
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [_grassGreen, _brandBlue.withOpacity(0.85)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: _brandBlue.withOpacity(0.25),
                blurRadius: 14,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: const Icon(
            CupertinoIcons.leaf_arrow_circlepath,
            color: Colors.white,
            size: 22,
          ),
        ),
        const SizedBox(width: 10),
        const Text(
          'PLANTIFY',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            letterSpacing: 1.2,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}

Widget kLabel(String text) => Padding(
  padding: const EdgeInsets.only(bottom: 6),
  child: Text(text, style: const TextStyle(fontSize: 12, color: _inkGrey)),
);

InputDecoration kInput(String hint, IconData icon) {
  return InputDecoration(
    hintText: hint,
    prefixIcon: Icon(icon),
    suffixIconColor: _brandBlue,
  );
}

class BackCircle extends StatelessWidget {
  const BackCircle({super.key});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black12),
          color: Colors.white,
        ),
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 18,
            color: _brandBlue,
          ),
          onPressed: () => Navigator.maybePop(context),
        ),
      ),
    );
  }
}

/// Fancy gradient background wrapper used on both screens
class GradientScaffold extends StatelessWidget {
  final Widget child;
  const GradientScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // Subtle decorative gradient + soft blobs
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              _bgLight,
              const Color(0xFFEFF6FF), // very light blue
              const Color(0xFFF5F3FF), // very light purple
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            // soft green blob (top-right)
            Positioned(
              right: -60,
              top: -60,
              child: _Blob(color: _grassGreen.withOpacity(0.12), size: 180),
            ),
            // soft purple blob (bottom-left)
            Positioned(
              left: -70,
              bottom: -70,
              child: _Blob(color: _softPurple.withOpacity(0.10), size: 220),
            ),
            SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Blob extends StatelessWidget {
  final double size;
  final Color color;
  const _Blob({required this.size, required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        boxShadow: [BoxShadow(color: color, blurRadius: 40, spreadRadius: 20)],
      ),
    );
  }
}

/// ------------------------------------------------------------
/// Login Screen
/// ------------------------------------------------------------
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscure = true;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;

    return GradientScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BackCircle(),
          const SizedBox(height: 8),
          const BrandRow(),
          const SizedBox(height: 18),

          // Headings
          Text('Login', style: t.titleLarge?.copyWith(color: _brandBlue)),
          const SizedBox(height: 8),
          const Text(
            'Apna email aur password daalain —\nabhi se seekhna start karein.',
            style: TextStyle(fontSize: 12, color: _inkGrey),
          ),

          const SizedBox(height: 24),

          // FORM
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kLabel('Username / Email'),
                TextFormField(
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: kInput('Enter your email', Icons.email_outlined),
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) return 'Email required';
                    if (!v.contains('@')) return 'Enter a valid email';
                    return null;
                  },
                ),
                const SizedBox(height: 14),

                kLabel('Password'),
                TextFormField(
                  controller: _password,
                  obscureText: _obscure,
                  decoration: kInput('Enter password', Icons.lock_outline)
                      .copyWith(
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscure ? Icons.visibility_off : Icons.visibility,
                          ),
                          onPressed: () => setState(() => _obscure = !_obscure),
                        ),
                      ),
                  validator: (v) {
                    if (v == null || v.isEmpty) return 'Password required';
                    if (v.length < 6) return 'Minimum 6 characters';
                    return null;
                  },
                ),
                const SizedBox(height: 6),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // TODO: Forgot flow
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Forgot password tapped')),
                      );
                    },
                    child: const Text('Forgot password?'),
                  ),
                ),
                const SizedBox(height: 8),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        // TODO: Do login
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   const SnackBar(content: Text('Logging in...')),
                        // );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyHomeScreen(),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      'LOG IN',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 14),

                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const SignUpScreen()),
                      );
                    },
                    child: const _InlineLink(
                      text: "Don't have an account? ",
                      action: 'Sign Up',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// ------------------------------------------------------------
/// Sign Up Screen
/// ------------------------------------------------------------
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _name = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscure = true;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;

    return GradientScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BackCircle(),
          const SizedBox(height: 8),
          const BrandRow(),
          const SizedBox(height: 18),

          Text('Sign Up', style: t.titleLarge?.copyWith(color: _softPurple)),
          const SizedBox(height: 8),
          const Text(
            'Naya account banayein — learning journey start karein!',
            style: TextStyle(fontSize: 12, color: _inkGrey),
          ),
          const SizedBox(height: 24),

          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kLabel('Full Name'),
                TextFormField(
                  controller: _name,
                  textCapitalization: TextCapitalization.words,
                  decoration: kInput('Enter your name', Icons.person_outline),
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) return 'Name required';
                    return null;
                  },
                ),
                const SizedBox(height: 14),

                kLabel('Email'),
                TextFormField(
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: kInput('Enter your email', Icons.alternate_email),
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) return 'Email required';
                    if (!v.contains('@')) return 'Enter a valid email';
                    return null;
                  },
                ),
                const SizedBox(height: 14),

                kLabel('Password'),
                TextFormField(
                  controller: _password,
                  obscureText: _obscure,
                  decoration: kInput('Create a password', Icons.lock).copyWith(
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscure ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () => setState(() => _obscure = !_obscure),
                    ),
                  ),
                  validator: (v) {
                    if (v == null || v.isEmpty) return 'Password required';
                    if (v.length < 6) return 'Minimum 6 characters';
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        // TODO: Do signup
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   const SnackBar(content: Text('Creating account...')),
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyHomeScreen(),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      'SIGN UP',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const _InlineLink(
                      text: 'Already have an account? ',
                      action: 'Log In',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// ------------------------------------------------------------
/// Small inline CTA text widget with styled action word
/// ------------------------------------------------------------
class _InlineLink extends StatelessWidget {
  final String text;
  final String action;
  const _InlineLink({required this.text, required this.action});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(color: _inkGrey),
        children: [
          TextSpan(
            text: action,
            style: const TextStyle(
              color: _grassGreen,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

/// ------------------------------------------------------------
/// HOME SCREEN
/// ------------------------------------------------------------

// class MyHomeScreen extends StatefulWidget {
//   const MyHomeScreen({super.key});

//   @override
//   State<MyHomeScreen> createState() => _MyHomeScreen();
// }

// class _MyHomeScreen extends State<MyHomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Home')),
//       body: Center(
//         child: Container(
//           width: 250,
//           height: 150,
//           color: Colors.grey,
//           child: Center(
//             child: ElevatedButton(
//               onPressed: () {
//                 if (kDebugMode) {
//                   print('button pressed');
//                 }
//               },
//               child: const Text(
//                 'click here',
//                 style: TextStyle(
//                   fontSize: 25,
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   // backgroundColor: Colors.white,
//                 ),
//               ),
//             ),

//             child: Container(
//               width: 150,
//               height: 150,
//               child: Image.asset('assets/images/app_icn(1).png'),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        foregroundColor: Colors.white,
        backgroundColor: _grassGreen,
      ),
      body: Container(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('R1', style: TextStyle(fontSize: 25)),
            SizedBox(height: 16),
            Text('R2', style: TextStyle(fontSize: 25)),
            SizedBox(height: 16),
            Text('R3', style: TextStyle(fontSize: 25)),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (kDebugMode) {
                  print('button pressed');
                }
              },
              child: const Text(
                'click here',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: 50,
              height: 50,
              child: Image.asset('assets/images/app_icn.png'),
            ),
          ],
        ),
      ),
    );
  }
}
