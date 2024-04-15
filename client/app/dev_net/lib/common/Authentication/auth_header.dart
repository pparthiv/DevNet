import 'package:dev_net/utils/constants/colors.dart';
import 'package:dev_net/utils/constants/images_strings.dart';
import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        const Image(
            image: AssetImage(MyAppImages.logoImage),
            fit: BoxFit.fitHeight,
            height: 150),
        const SizedBox(
          height: 15,
        ),
        const Text(
          "Welcome To,",
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
              color: Color.fromARGB(255, 100, 150, 244)),
        ),
        Transform.translate(
          offset: const Offset(-2, -10),
          child: const Text(
            "DevNet",
            style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.w700,
                color: MyAppColors.primary),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
