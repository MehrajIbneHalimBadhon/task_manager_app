import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_app/ui/screen/auth/pin_verification_screen.dart';
import 'package:task_manager_app/ui/screen/auth/sign_in_screen.dart';
import 'package:task_manager_app/ui/utility/app_colors.dart';

import '../../widget/background_widget.dart';
class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _confirmPasswordTEController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                ),
                Text(
                  'Set Password',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'Minimum length of password should be more than 6 letters and combination number',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                    controller: _passwordTEController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(hintText: 'Password')),
                TextFormField(
                    controller: _confirmPasswordTEController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(hintText: 'Confirm Password')),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () => _onTapConfirmButton(),
                  child: Text('Confirm'),
                ),
                SizedBox(
                  height: 36,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.4),
                        text: "Have account? ",
                        children: [
                          TextSpan(
                            style: TextStyle(color: AppColors.themeColor),
                            text: "Sign in",
                            recognizer: TapGestureRecognizer()
                              ..onTap = _onTapSignInButton,
                          ),
                        ]),
                  ),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }

  void _onTapSignInButton() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => SignInScreen(),
        ),
        (route) => false);
  }

  void _onTapConfirmButton() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => SignInScreen(),
        ),
        (route) => false);
  }

  @override
  void dispose() {
    _passwordTEController.dispose();
    _confirmPasswordTEController.dispose();
    super.dispose();
  }
}
