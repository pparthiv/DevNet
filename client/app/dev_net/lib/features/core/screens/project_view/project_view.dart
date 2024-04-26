import 'package:dev_net/common/widgets/user_skill_chip.dart';
import 'package:dev_net/features/core/screens/user_view/widgets/colab_button.dart';
import 'package:dev_net/utils/constants/colors.dart';
import 'package:dev_net/utils/constants/images_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProjectView extends StatelessWidget {
  const ProjectView({super.key});

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
                        maxRadius: 60,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),

                    // Project's Name
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Spotify",
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w800,
                                color: MyAppColors.textWhite),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "~ Aaeren Yedger",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: MyAppColors.darkGrey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 22,
                ),
                Text(
                  "Anything considered to be a subject for analysis by or as if by methods of literary criticism. Digital Technology. a text message.",
                  style: TextStyle(
                    fontSize: 15,
                    color: MyAppColors.darkGrey.withOpacity(0.9),
                    fontWeight: FontWeight.w400,
                    height: 1.25,
                  ),
                ),

                SizedBox(
                  height: 30,
                ),

                Text(
                  "Tech Used",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: MyAppColors.textWhite),
                ),

                SizedBox(
                  height: 14,
                ),

                Wrap(
                  spacing: 6,
                  runSpacing: 7,
                  children: [
                    for (int i = 0; i < 5; i++) ...[
                      UserSkillChips(
                        textSize: 15,
                      )
                    ]
                  ],
                ),

                SizedBox(
                  height: 30,
                ),

                Text(
                  "Collaborators",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: MyAppColors.textWhite),
                ),

                SizedBox(
                  height: 14,
                ),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (int i = 0; i < 10; i++) ...[
                      CircleAvatar(
                        backgroundImage: AssetImage(MyAppImages.userProfile),
                        maxRadius: 25,
                      )
                    ]
                  ],
                ),

                SizedBox(
                  height: 45,
                ),

                Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      color: MyAppColors.darkerGrey,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Type your Message...",
                        hintStyle: TextStyle(
                            fontSize: 16, color: MyAppColors.darkGrey),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(width: 160, child: ColabButton()))
              ],
            )),
      ),
    );
  }
}
