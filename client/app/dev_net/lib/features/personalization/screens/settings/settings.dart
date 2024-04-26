import 'package:dev_net/common/widgets/profile_image_with_name_and_extra_field.dart';
import 'package:dev_net/features/personalization/screens/settings/widgets/custom_clipper.dart';
import 'package:dev_net/utils/constants/colors.dart';
import 'package:dev_net/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (_, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              floating: true,
              expandedHeight: 280,
              flexibleSpace: ClipPath(
                clipper: SettingsCustomClipper(),
                child: FlexibleSpaceBar(
                  background: Container(
                    color: const Color.fromARGB(255, 42, 41, 41),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 80,
                        ),
                        ProfileImagewithNameAndExtraField(
                          fieldValue: "krishnabhdas3@gmail.com",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ];
        },
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Divider(
                thickness: 4,
                color: MyAppColors.darkerGrey,
                endIndent: MyAppHelperFunctions.screenWidth() / 2 - 30,
                indent: MyAppHelperFunctions.screenWidth() / 2 - 30,
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    IndivitualSettingsField(
                        leftValue: "College",
                        rightValue: "Assam Engineering College"),
                    Divider(
                      height: 40,
                      thickness: 1.5,
                    ),
                    IndivitualSettingsField(
                        leftValue: "Field", rightValue: "App Developer"),
                    Divider(
                      height: 40,
                      thickness: 1.5,
                    ),
                    IndivitualSettingsField(
                        leftValue: "DOB", rightValue: "12/01/24"),
                    SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: MyAppColors.red,
                              side: BorderSide(color: MyAppColors.red)),
                          onPressed: () {},
                          child: Text("Log Out")),
                    )
                  ],
                ))
          ],
        ),
        floatHeaderSlivers: true,
      ),
    );
  }
}

class IndivitualSettingsField extends StatelessWidget {
  const IndivitualSettingsField({
    super.key,
    required this.leftValue,
    required this.rightValue,
  });

  final String leftValue;
  final String rightValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leftValue,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: MyAppColors.grey),
        ),
        SizedBox(
          width: 45,
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              rightValue,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: MyAppColors.darkGrey),
              maxLines: 3,
            ),
          ),
        )
      ],
    );
  }
}
