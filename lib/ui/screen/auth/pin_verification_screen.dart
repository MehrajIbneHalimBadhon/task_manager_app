import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager_app/ui/screen/auth/reset_password_screen.dart';
import 'package:task_manager_app/ui/screen/auth/sign_in_screen.dart';
import 'package:task_manager_app/ui/utility/app_colors.dart';

import '../../widget/background_widget.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key});

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  final TextEditingController _pinTEController = TextEditingController();

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
                  'Pin Verification',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'A 6 digits verification pin has been sent to your email address',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(
                  height: 16,
                ),
                _buildPinCodeTextField(),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: _onTapVerifyOTPButton,
                  child: Text('Verify'),
                ),
                SizedBox(
                  height: 36,
                ),
                _buildSignInSection()
              ],
            ),
          ),
        )),
      ),
    );
  }

  Widget _buildSignInSection() {
    return Center(
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
                recognizer: TapGestureRecognizer()..onTap = _onTapSignInButton,
              ),
            ]),
      ),
    );
  }

  Widget _buildPinCodeTextField() {
    return PinCodeTextField(
      length: 6,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 50,
          fieldWidth: 40,
          activeFillColor: AppColors.white,
          selectedFillColor: AppColors.white,
          inactiveFillColor: AppColors.white,
          selectedColor: AppColors.themeColor),
      animationDuration: Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      keyboardType: TextInputType.number,
      enableActiveFill: true,
      controller: _pinTEController,
      appContext: context,
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

  void _onTapVerifyOTPButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResetPasswordScreen(),
      ),
    );
  }
}
