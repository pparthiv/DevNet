import 'package:dev_net/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({
    super.key,
    required GlobalKey<FormState> signupformKey,
  }) : _signupformKey = signupformKey;

  final GlobalKey<FormState> _signupformKey;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (_signupformKey.currentState!.validate()) {}
        },
        child: Text(
          "Sign Up",
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: MyAppColors.textWhite,
              ),
        ),
      ),
    );
  }
}
