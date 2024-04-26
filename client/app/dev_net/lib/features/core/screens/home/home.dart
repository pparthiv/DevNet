import 'package:dev_net/features/core/screens/home/widgets/home_header.dart';
import 'package:dev_net/features/core/screens/home/widgets/home_search_bar.dart';
import 'package:dev_net/features/core/screens/home/widgets/card_design.dart';
import 'package:dev_net/common/widgets/user_skill_chip.dart';
import 'package:dev_net/features/core/screens/user_view/user_view.dart';
import 'package:dev_net/utils/constants/colors.dart';
import 'package:dev_net/utils/constants/images_strings.dart';
import 'package:dev_net/utils/helpers/helper_function.dart';
import 'package:dev_net/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MyAppHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Home Header
              HomeHeader(dark: dark),

              const SizedBox(
                height: 30,
              ),

              // User Description
              Text(
                "Anything considered to be a subject for analysis by or as if by methods of literary criticism. Digital Technology. a text message.",
                style: TextStyle(
                    fontSize: 15,
                    color: MyAppColors.darkGrey.withOpacity(0.9),
                    fontWeight: FontWeight.w500,
                    height: 1.25),
              ),

              const SizedBox(
                height: 35,
              ),

              // User Skills
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your Skills",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color:
                            dark ? MyAppColors.grey : MyAppColors.darkerGrey),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Wrap(
                    spacing: 6,
                    runSpacing: 7,
                    children: [
                      for (int i = 0; i < 6; i++) ...[
                        // User Skill Chips
                        UserSkillChips(),
                      ]
                    ],
                  ),
                ],
              ),

              const SizedBox(
                height: 40,
              ),

              // Home People Search (AEC)
              HomeSearchBar(dark: dark),

              const SizedBox(
                height: 20,
              ),

              for (int i = 0; i < 5; i++) ...[
                Column(
                  children: [
                    // Person Near You
                    CardDesign(onTap: () => Get.to(() => UserView())),
                    SizedBox(
                      height: 10,
                    )
                  ],
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
