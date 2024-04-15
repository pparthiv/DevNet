import 'package:dev_net/utils/constants/colors.dart';
import 'package:dev_net/utils/helpers/helper_function.dart';
import 'package:dev_net/utils/validators/validation.dart';
import 'package:flutter/material.dart';

class CommunitySearchBar extends StatelessWidget {
  const CommunitySearchBar({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // controller: email,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        fillColor: dark ? MyAppColors.darkishGrey : MyAppColors.textFieldLight,
        filled: true,
        prefixIcon: const Icon(
          Icons.search,
          color: MyAppColors.darkGrey,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            showMenu(
              context: context,
              position: RelativeRect.fromDirectional(
                  textDirection: TextDirection.ltr,
                  start: MyAppHelperFunctions.screenWidth(),
                  top: 100,
                  end: 50,
                  bottom: 0),
              color: Color.fromARGB(255, 112, 168, 248),
              items: [
                PopupMenuItem<String>(
                  value: 'Option 1',
                  child: Text('Option 1'),
                ),
                PopupMenuItem<String>(
                  value: 'Option 2',
                  child: Text('Option 2'),
                ),
                PopupMenuItem<String>(
                  value: 'Option 3',
                  child: Text('Option 3'),
                ),
                PopupMenuItem<String>(
                  value: 'Option 4',
                  child: Text('Option 4'),
                ),
              ],
            ).then((value) {
              if (value != null) {}
            });
          },
          icon: Icon(
            Icons.filter_list_rounded,
            color: Colors.grey,
          ),
        ),

        hintText: "Search People you know...",
        enabledBorder: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(width: 1, color: MyAppColors.darkerGrey),
        ),
        focusedBorder: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(width: 1, color: MyAppColors.darkGrey),
        ),
        // Set the hintStyle property to change the color of hint text
        hintStyle: const TextStyle(color: MyAppColors.darkGrey),
      ),
      validator: (value) {
        MyAppValidator.validateEmail(value);
        return null;
      },
    );
  }
}
