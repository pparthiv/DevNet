import 'package:dev_net/utils/constants/colors.dart';
import 'package:dev_net/utils/helpers/helper_function.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AuthenticationRichText extends StatelessWidget {
  const AuthenticationRichText({
    super.key,
    required this.text,
    required this.onPressText,
    this.onTap,
  });

  final String text;
  final String onPressText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = MyAppHelperFunctions.isDarkMode(context);
    return Center(
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
            text: text,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: dark ? MyAppColors.textWhite : MyAppColors.dark,
                fontSize: 14)),
        TextSpan(
            text: onPressText,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: MyAppColors.blue,
                fontSize: 15,
                fontWeight: FontWeight.w600),
            recognizer: TapGestureRecognizer()..onTap = onTap),
      ])),
    );
  }
}
