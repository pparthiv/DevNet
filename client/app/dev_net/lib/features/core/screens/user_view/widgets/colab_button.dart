import 'package:dev_net/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ColabButton extends StatelessWidget {
  const ColabButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: MyAppColors.primary,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(width: 0.6, color: MyAppColors.primary)),
      child: Row(
        children: [
          Icon(
            Icons.add_circle,
          ),
          SizedBox(
            width: 7,
          ),
          Text(
            "Colab Request",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}
