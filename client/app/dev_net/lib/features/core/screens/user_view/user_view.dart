import 'package:dev_net/common/widgets/profile_image_with_name_and_extra_field.dart';
import 'package:dev_net/common/widgets/user_skill_chip.dart';
import 'package:dev_net/features/core/screens/home/widgets/card_design.dart';
import 'package:dev_net/features/core/screens/project_view/project_view.dart';
import 'package:dev_net/features/core/screens/user_view/widgets/colab_button.dart';
import 'package:dev_net/utils/constants/colors.dart';
import 'package:dev_net/utils/constants/images_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () => Get.back(), child: Icon(Icons.arrow_back)),
                ],
              ),
              SizedBox(
                height: 20,
              ),

              // Profile Image, Name, Domain
              Row(
                children: [
                  Center(
                    child: CircleAvatar(
                      backgroundImage: AssetImage(MyAppImages.userProfile),
                      maxRadius: 50,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),

                  // Person's Name
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Krishnabh Das",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              color: MyAppColors.textWhite),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        // Person's Description
                        Text(
                          "Anything considered to be a subject for analysis by or as if by methods of literary criticism. Digital Technology. a text message.",
                          style: TextStyle(
                            fontSize: 14,
                            color: MyAppColors.darkGrey.withOpacity(0.9),
                            fontWeight: FontWeight.w400,
                            height: 1.25,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 24,
              ),

              // Person's Skills
              Wrap(
                runSpacing: 7,
                spacing: 7,
                children: [
                  for (int i = 0; i < 7; i++) ...[
                    UserSkillChips(
                      textSize: 15,
                      verticalSpacing: 8,
                      horizontalSpacing: 18,
                    )
                  ]
                ],
              ),
              SizedBox(
                height: 30,
              ),

              Text(
                "Projects",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: MyAppColors.textWhite),
              ),

              SizedBox(
                height: 14,
              ),

              for (int i = 0; i < 5; i++) ...[
                Column(
                  children: [
                    CardDesign(
                      isUser: false,
                      onTap: () => Get.to(() => ProjectView()),
                    ),
                    SizedBox(
                      height: 14,
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
