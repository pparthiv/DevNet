import 'package:dev_net/common/widgets/user_skill_chip.dart';
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

                  // Colab Button
                  ColabButton()
                ],
              ),
              SizedBox(
                height: 20,
              ),

              // Person's Image
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage(MyAppImages.userProfile),
                  maxRadius: 50,
                ),
              ),
              SizedBox(
                height: 12,
              ),

              // Person's Name
              Center(
                child: Text(
                  "Krishnabh Das",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: MyAppColors.textWhite),
                ),
              ),

              // Person's Domain
              Center(
                child: Text(
                  "App Developer",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: MyAppColors.textWhite.withOpacity(0.7)),
                ),
              ),
              SizedBox(
                height: 12,
              ),

              // Person's Description
              Text(
                "Anything considered to be a subject for analysis by or as if by methods of literary criticism. Digital Technology. a text message.",
                style: TextStyle(
                  fontSize: 15,
                  color: MyAppColors.darkGrey.withOpacity(0.9),
                  fontWeight: FontWeight.w400,
                  height: 1.25,
                ),
                textAlign: TextAlign.center,
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
                      textSize: 16,
                      verticalSpacing: 8,
                      horizontalSpacing: 18,
                    )
                  ]
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
