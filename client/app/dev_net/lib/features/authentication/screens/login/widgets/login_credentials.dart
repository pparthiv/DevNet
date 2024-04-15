import 'package:dev_net/bottom_nav_bar.dart';
import 'package:dev_net/utils/constants/colors.dart';
import 'package:dev_net/utils/helpers/helper_function.dart';
import 'package:dev_net/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginCredentials extends StatelessWidget {
  const LoginCredentials({
    super.key,
    required this.dark,
    required this.loginformKey,
  });

  final bool dark;
  final GlobalKey<FormState> loginformKey;

  @override
  Widget build(BuildContext context) {
    final dark = MyAppHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
          color: dark
              ? const Color.fromARGB(255, 51, 51, 51)
              : const Color.fromARGB(255, 243, 245, 255),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: dark
                    ? const Color.fromARGB(255, 59, 59, 59)
                    : const Color.fromARGB(255, 217, 225, 255),
                blurRadius: 20,
                offset: const Offset(0, 15))
          ],
          border: Border.all(
              width: 1,
              color: dark
                  ? const Color.fromARGB(255, 104, 104, 104)
                  : const Color.fromARGB(255, 187, 204, 252))),
      child: Form(
          child: Column(
        children: [
          // Email
          TextFormField(
            // controller: email,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              fillColor: dark
                  ? const Color.fromARGB(255, 33, 32, 32)
                  : MyAppColors.textFieldLight,
              filled: true,
              prefixIcon: const Icon(
                Icons.email,
                color: MyAppColors.primary,
              ),
              labelText: "Email",
              labelStyle: const TextStyle(
                color: MyAppColors.primary,
              ),
              floatingLabelStyle: const TextStyle(
                color: MyAppColors.primary,
              ),

              enabledBorder: const OutlineInputBorder().copyWith(
                borderRadius: BorderRadius.circular(14),
                borderSide:
                    const BorderSide(width: 0.5, color: MyAppColors.primary),
              ),
              focusedBorder: const OutlineInputBorder().copyWith(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(
                    width: 0.5, color: Color.fromARGB(255, 41, 106, 197)),
              ),
              // Set the hintStyle property to change the color of hint text
              hintStyle: const TextStyle(
                color: Color.fromARGB(
                    255, 41, 106, 197), // Change the color to blue
              ),
            ),
            validator: (value) {
              MyAppValidator.validateEmail(value);
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),

          // Password
          TextFormField(
            // controller: email,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              fillColor: dark
                  ? const Color.fromARGB(255, 33, 32, 32)
                  : MyAppColors.textFieldLight,
              filled: true,
              prefixIcon: const Icon(
                Icons.lock,
                color: MyAppColors.primary,
              ),
              suffixIcon: const Icon(
                Icons.remove_red_eye,
                color: MyAppColors.primary,
              ),
              labelText: "Password",
              labelStyle: const TextStyle(
                color: MyAppColors.primary,
              ),
              floatingLabelStyle: const TextStyle(
                color: MyAppColors.primary,
              ),

              enabledBorder: const OutlineInputBorder().copyWith(
                borderRadius: BorderRadius.circular(14),
                borderSide:
                    const BorderSide(width: 0.5, color: MyAppColors.primary),
              ),
              focusedBorder: const OutlineInputBorder().copyWith(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(
                    width: 0.5, color: Color.fromARGB(255, 41, 106, 197)),
              ),
              // Set the hintStyle property to change the color of hint text
              hintStyle: const TextStyle(
                color: Color.fromARGB(
                    255, 41, 106, 197), // Change the color to blue
              ),
            ),
            validator: (value) {
              MyAppValidator.validateEmail(value);
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),

          // Login Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => BottomNavBar());
              },
              child: Text(
                "Login",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: MyAppColors.textWhite,
                    ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
