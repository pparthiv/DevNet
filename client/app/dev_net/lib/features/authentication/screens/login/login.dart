import 'package:dev_net/common/Authentication/auth_header.dart';
import 'package:dev_net/features/authentication/screens/login/widgets/login_credentials.dart';
import 'package:dev_net/features/authentication/screens/signup/signup.dart';
import 'package:dev_net/features/authentication/screens/signup/widgets/authentication_rich_text.dart';
import 'package:dev_net/utils/constants/colors.dart';
import 'package:dev_net/utils/helpers/helper_function.dart';
import 'package:dev_net/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MyAppHelperFunctions.isDarkMode(context);
    final loginformKey = GlobalKey<FormState>();
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Login Header
            const AuthHeader(),

            /// Login - Email, Password, Button
            LoginCredentials(dark: dark, loginformKey: loginformKey),

            const SizedBox(
              height: 30,
            ),

            // Go to Sign In Text Button
            AuthenticationRichText(
              text: "Don't have an account? ",
              onPressText: "Sign Up",
              onTap: () => Get.offAll(() => const SignUp()),
            )
          ],
        ),
      ),
    );
  }
}
