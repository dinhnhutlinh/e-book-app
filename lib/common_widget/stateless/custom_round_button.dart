import 'package:e_book_app/themes/app_colors.dart';
import 'package:e_book_app/themes/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomRoundButton extends StatelessWidget {
  final Function() onPress;
  final String title;
  final Color? color;
  final Gradient? gradient;

  const CustomRoundButton(
      {Key? key,
      required this.onPress,
      required this.title,
      this.color,
      this.gradient})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 52,
      decoration: const ShapeDecoration(
        shape: StadiumBorder(),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.deepOrange, AppColors.orange],
        ),
      ),
      child: MaterialButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: const StadiumBorder(),
        onPressed: onPress,
        child: Text(
          title,
          style: AppTextStyle.buttonWhite,
        ),
      ),
    );
  }
}
