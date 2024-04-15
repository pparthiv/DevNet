import 'package:dev_net/features/core/screens/community/widgets/community_people_indivitual_card.dart';
import 'package:dev_net/features/core/screens/community/widgets/community_search_bar.dart';
import 'package:dev_net/features/core/screens/user_view/user_view.dart';
import 'package:dev_net/utils/constants/colors.dart';
import 'package:dev_net/utils/constants/images_strings.dart';
import 'package:dev_net/utils/helpers/helper_function.dart';
import 'package:dev_net/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class Community extends StatelessWidget {
  const Community({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MyAppHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22, vertical: 80),
          child: Column(
            children: [
              CommunitySearchBar(dark: dark),
              SizedBox(
                height: 20,
              ),
              for (int i = 0; i < 5; i++) ...[
                Column(
                  children: [
                    CommunityPeopleIndivitualCard(),
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
