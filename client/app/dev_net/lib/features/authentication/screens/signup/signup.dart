import 'package:dev_net/features/authentication/screens/login/login.dart';
import 'package:dev_net/features/authentication/screens/signup/widgets/authentication_rich_text.dart';
import 'package:dev_net/features/authentication/screens/signup/widgets/signup_button.dart';
import 'package:dev_net/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:dev_net/common/Authentication/auth_header.dart';
import 'package:dev_net/utils/constants/sizes.dart';
import 'package:dev_net/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MyAppHelperFunctions.isDarkMode(context);
    final signupformKey = GlobalKey<FormState>();
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header
            const AuthHeader(),

            /// Form Fill
            SignupForm(signupformKey: signupformKey, dark: dark),

            /// Sign Up Button
            SignupButton(signupformKey: signupformKey),

            const SizedBox(
              height: MyAppSizes.spaceBtwSections / 1.5,
            ),

            // Go to Login Text Button
            AuthenticationRichText(
              text: "Already have an account? ",
              onPressText: "Login",
              onTap: () => Get.offAll(() => const Login()),
            )
          ],
        ),
      ),
    );
  }
}
