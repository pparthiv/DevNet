import 'package:dev_net/utils/constants/colors.dart';
import 'package:dev_net/utils/validators/validation.dart';
import 'package:flutter/material.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
    required GlobalKey<FormState> signupformKey,
    required this.dark,
  }) : _signupformKey = signupformKey;

  final GlobalKey<FormState> _signupformKey;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _signupformKey,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: TextFormField(
                    // controller: email,
                    keyboardType: TextInputType.emailAddress,

                    decoration: InputDecoration(
                      fillColor: dark
                          ? const Color.fromARGB(255, 20, 20, 20)
                          : MyAppColors.textFieldLight,
                      filled: true,
                      prefixIcon: const Icon(
                        Icons.person,
                        color: MyAppColors.primary,
                      ),
                      labelText: "First Name",
                      labelStyle: const TextStyle(
                        color: MyAppColors.primary,
                      ),
                      floatingLabelStyle: const TextStyle(
                        color: MyAppColors.primary,
                      ),
                      border: const OutlineInputBorder().copyWith(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(
                            width: 1, color: MyAppColors.primary),
                      ),
                      enabledBorder: const OutlineInputBorder().copyWith(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(
                            width: 1, color: MyAppColors.primary),
                      ),
                      focusedBorder: const OutlineInputBorder().copyWith(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(
                            width: 1, color: Color.fromARGB(255, 41, 106, 197)),
                      ),
                    ),
                    style: const TextStyle(
                      color:
                          MyAppColors.primary, // Change label text color here
                    ),
                    validator: (value) {
                      MyAppValidator.validateEmail(value);
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  width: 14,
                ),
                Expanded(
                  child: TextFormField(
                    // controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      fillColor: dark
                          ? const Color.fromARGB(255, 20, 20, 20)
                          : MyAppColors.textFieldLight,
                      filled: true,
                      prefixIcon: const Icon(
                        Icons.person,
                        color: MyAppColors.primary,
                      ),
                      labelText: "Last Name",
                      labelStyle: const TextStyle(
                        color: MyAppColors.primary,
                      ),
                      floatingLabelStyle: const TextStyle(
                        color: MyAppColors.primary,
                      ),
                      border: const OutlineInputBorder().copyWith(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(
                            width: 1, color: MyAppColors.primary),
                      ),
                      enabledBorder: const OutlineInputBorder().copyWith(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(
                            width: 1, color: MyAppColors.primary),
                      ),
                      focusedBorder: const OutlineInputBorder().copyWith(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(
                            width: 1, color: Color.fromARGB(255, 41, 106, 197)),
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
                ),
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            TextFormField(
              // controller: email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                fillColor: dark
                    ? const Color.fromARGB(255, 20, 20, 20)
                    : MyAppColors.textFieldLight,
                filled: true,
                prefixIcon: const Icon(
                  Icons.email,
                  color: MyAppColors.primary,
                ),
                labelText: "Email ID",
                labelStyle: const TextStyle(
                  color: MyAppColors.primary,
                ),
                floatingLabelStyle: const TextStyle(
                  color: MyAppColors.primary,
                ),
                border: const OutlineInputBorder().copyWith(
                  borderRadius: BorderRadius.circular(14),
                  borderSide:
                      const BorderSide(width: 1, color: MyAppColors.primary),
                ),
                enabledBorder: const OutlineInputBorder().copyWith(
                  borderRadius: BorderRadius.circular(14),
                  borderSide:
                      const BorderSide(width: 1, color: MyAppColors.primary),
                ),
                focusedBorder: const OutlineInputBorder().copyWith(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(
                      width: 1, color: Color.fromARGB(255, 41, 106, 197)),
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
              height: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: TextFormField(
                    // controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      fillColor: dark
                          ? const Color.fromARGB(255, 20, 20, 20)
                          : MyAppColors.textFieldLight,
                      filled: true,
                      prefixIcon: const Icon(
                        Icons.calendar_month,
                        color: MyAppColors.primary,
                      ),
                      labelText: "DOB",
                      labelStyle: const TextStyle(
                        color: MyAppColors.primary,
                      ),
                      floatingLabelStyle: const TextStyle(
                        color: MyAppColors.primary,
                      ),
                      border: const OutlineInputBorder().copyWith(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(
                            width: 1, color: MyAppColors.primary),
                      ),
                      enabledBorder: const OutlineInputBorder().copyWith(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(
                            width: 1, color: MyAppColors.primary),
                      ),
                      focusedBorder: const OutlineInputBorder().copyWith(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(
                            width: 1, color: Color.fromARGB(255, 41, 106, 197)),
                      ),
                    ),
                    style: const TextStyle(
                      color:
                          MyAppColors.primary, // Change label text color here
                    ),
                    validator: (value) {
                      MyAppValidator.validateEmail(value);
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  width: 14,
                ),
                Expanded(
                  child: TextFormField(
                    // controller: email,
                    keyboardType: TextInputType.emailAddress,
                    readOnly: true,
                    decoration: InputDecoration(
                      fillColor: dark
                          ? const Color.fromARGB(255, 20, 20, 20)
                          : MyAppColors.textFieldLight,
                      filled: true,
                      prefixIcon: const Icon(
                        Icons.lightbulb,
                        color: MyAppColors.primary,
                      ),
                      labelText: "Field",
                      labelStyle: const TextStyle(
                        color: MyAppColors.primary,
                      ),
                      suffixIcon: PopupMenuButton<String>(
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<String>>[
                          const PopupMenuItem<String>(
                            value: 'Option 1',
                            child: Text('Option 1'),
                          ),
                          const PopupMenuItem<String>(
                            value: 'Option 2',
                            child: Text('Option 2'),
                          ),
                          const PopupMenuItem<String>(
                            value: 'Option 3',
                            child: Text('Option 3'),
                          ),
                        ],
                        onSelected: (String value) {
                          // Handle selection here
                          debugPrint('Selected: $value');
                        },
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: MyAppColors.primary,
                        ),
                      ),
                      floatingLabelStyle: const TextStyle(
                        color: MyAppColors.primary,
                      ),
                      border: const OutlineInputBorder().copyWith(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(
                          width: 1,
                          color: MyAppColors.primary,
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder().copyWith(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(
                          width: 1,
                          color: MyAppColors.primary,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder().copyWith(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: const BorderSide(
                          width: 1,
                          color: Color.fromARGB(255, 41, 106, 197),
                        ),
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
                ),
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            TextFormField(
              // controller: email,
              keyboardType: TextInputType.text,
              readOnly: true,
              decoration: InputDecoration(
                fillColor: dark
                    ? const Color.fromARGB(255, 20, 20, 20)
                    : MyAppColors.textFieldLight,
                filled: true,
                prefixIcon: const Icon(
                  Icons.house,
                  color: MyAppColors.primary,
                ),
                suffixIcon: PopupMenuButton<String>(
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: 'Option 1',
                      child: Text('Option 1'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'Option 2',
                      child: Text('Option 2'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'Option 3',
                      child: Text('Option 3'),
                    ),
                  ],
                  onSelected: (String value) {
                    // Handle selection here
                    debugPrint('Selected: $value');
                  },
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: MyAppColors.primary,
                  ),
                ),
                labelText: "College",
                labelStyle: const TextStyle(
                  color: MyAppColors.primary,
                ),
                floatingLabelStyle: const TextStyle(
                  color: MyAppColors.primary,
                ),
                border: const OutlineInputBorder().copyWith(
                  borderRadius: BorderRadius.circular(14),
                  borderSide:
                      const BorderSide(width: 1, color: MyAppColors.primary),
                ),
                enabledBorder: const OutlineInputBorder().copyWith(
                  borderRadius: BorderRadius.circular(14),
                  borderSide:
                      const BorderSide(width: 1, color: MyAppColors.primary),
                ),
                focusedBorder: const OutlineInputBorder().copyWith(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(
                      width: 1, color: Color.fromARGB(255, 41, 106, 197)),
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
              height: 14,
            ),
            TextFormField(
              // controller: email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                fillColor: dark
                    ? const Color.fromARGB(255, 20, 20, 20)
                    : MyAppColors.textFieldLight,
                filled: true,
                prefixIcon: const Icon(
                  Icons.linked_camera,
                  color: MyAppColors.primary,
                ),
                labelText: "LinkedIn Url",
                labelStyle: const TextStyle(
                  color: MyAppColors.primary,
                ),
                floatingLabelStyle: const TextStyle(
                  color: MyAppColors.primary,
                ),
                border: const OutlineInputBorder().copyWith(
                  borderRadius: BorderRadius.circular(14),
                  borderSide:
                      const BorderSide(width: 1, color: MyAppColors.primary),
                ),
                enabledBorder: const OutlineInputBorder().copyWith(
                  borderRadius: BorderRadius.circular(14),
                  borderSide:
                      const BorderSide(width: 1, color: MyAppColors.primary),
                ),
                focusedBorder: const OutlineInputBorder().copyWith(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(
                      width: 1, color: Color.fromARGB(255, 41, 106, 197)),
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
          ],
        ));
  }
}
