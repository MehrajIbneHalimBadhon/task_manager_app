import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager_app/data/model/network_response.dart';
import 'package:task_manager_app/data/network_caller/network_caller.dart';
import 'package:task_manager_app/data/utilities/urls.dart';
import 'package:task_manager_app/ui/controller/auth_controller.dart';
import 'package:task_manager_app/ui/screen/auth/reset_password_screen.dart';
import 'package:task_manager_app/ui/screen/auth/sign_in_screen.dart';
import 'package:task_manager_app/ui/utility/app_colors.dart';
import 'package:task_manager_app/ui/widget/snackbar_message.dart';

import '../../widget/background_widget.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key});

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  final TextEditingController _pinTEController = TextEditingController();
  bool _otpVerificationInProgress = false;

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
                  'Pin Verification',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'A 6 digits verification pin has been sent to your email address',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(
                  height: 16,
                ),
                _buildPinCodeTextField(),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: _onTapVerifyOTPButton,
                  child: const Text('Verify'),
                ),
                const SizedBox(
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
                style: const TextStyle(color: AppColors.themeColor),
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
      animationDuration: const Duration(milliseconds: 300),
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
          builder: (context) => const SignInScreen(),
        ),
        (route) => false);
  }
  Future<void> _emailVerification(String otp) async {
    _otpVerificationInProgress = true;
    if (mounted) setState(() {});
    NetworkResponse response =
    await NetworkCaller.postRequest(Urls.verifyOTP(otp));
    if (response.isSuccess) {
      await AuthController.otpVerification(otp);
    } else {
      if (mounted) {
        showSnackbarMessage(context,
            response.errorMessage ?? 'OTP Verification Failed! Try Again');
      }
    }
    _otpVerificationInProgress = false;
    if (mounted) setState(() {});
  }

  void _onTapVerifyOTPButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ResetPasswordScreen(),
      ),
    );
  }
}
