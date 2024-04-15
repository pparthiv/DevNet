import 'package:dev_net/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ColabButton extends StatelessWidget {
  const ColabButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 34, 33, 33),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 0.6, color: MyAppColors.grey)),
      child: Row(
        children: [
          Icon(
            Icons.people,
            color: MyAppColors.darkGrey,
          ),
          SizedBox(
            width: 7,
          ),
          Text(
            "Colab +",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: MyAppColors.grey),
          )
        ],
      ),
    );
  }
}
