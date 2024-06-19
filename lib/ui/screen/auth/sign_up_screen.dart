import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_app/ui/utility/app_colors.dart';

import '../../widget/background_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();

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
                  'Join With Us',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                    controller: _emailTEController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(hintText: 'Email')),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                    controller: _firstNameTEController,
                    decoration: InputDecoration(hintText: 'First Name')),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                    controller: _lastNameTEController,
                    decoration: InputDecoration(hintText: 'Last Name')),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                    controller: _mobileTEController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: 'Mobile')),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                    controller: _passwordTEController,
                    decoration: InputDecoration(hintText: 'Password')),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Icon(Icons.arrow_forward_ios_rounded),
                ),
                SizedBox(
                  height: 36,
                ),
                _buildBackToSignInSection()
              ],
            ),
          ),
        )),
      ),
    );
  }

  Widget _buildBackToSignInSection() {
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

  void _onTapSignInButton() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
