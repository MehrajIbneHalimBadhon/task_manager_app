import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_app/ui/screen/auth/email_verification_screen.dart';
import 'package:task_manager_app/ui/screen/auth/sign_up_screen.dart';
import 'package:task_manager_app/ui/screen/main_bottom_nav_screen.dart';
import 'package:task_manager_app/ui/utility/app_colors.dart';

import '../../widget/background_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Text(
                  'Get Started With',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                    controller: _emailTEController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(hintText: 'Email')),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                    controller: _passwordTEController,
                    decoration: const InputDecoration(hintText: 'Password')),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: _onTapNextButton,
                  child: const Icon(Icons.arrow_forward_ios_rounded),
                ),
                const SizedBox(
                  height: 36,
                ),
                Center(
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: () => _onTapForgetPasswordButton(),
                        child: const Text('Forget Password'),
                      ),
                      RichText(
                        text: TextSpan(
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.4),
                            text: "Don't have an account? ",
                            children: [
                              TextSpan(
                                style: const TextStyle(color: AppColors.themeColor),
                                text: "Sign up",
                                recognizer: TapGestureRecognizer()
                                  ..onTap = _onTapSignUpButton,
                              ),
                            ]),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }

  void _onTapNextButton(){
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const MainBottomNavigationScreen(),
      ),
    );
  }

  void _onTapSignUpButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SignUpScreen(),
      ),
    );
  }

  void _onTapForgetPasswordButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EmailVerificationScreen(),
      ),
    );
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
