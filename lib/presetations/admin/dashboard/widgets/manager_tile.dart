import 'package:e_book_app/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ManagerTile extends StatelessWidget {
  final Widget title;
  final Widget subTitle;
  final Widget? trailing;
  final Function()? onPress;

  const ManagerTile(
      {super.key,
      required this.title,
      required this.subTitle,
      this.trailing,
      this.onPress});
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: AppColors.darkBlue, width: 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: DefaultTextStyle(
        style: GoogleFonts.openSans(
          color: AppColors.darkBlue,
          fontWeight: FontWeight.bold,
        ),
        child: ListTile(
          title: title,
          subtitle: subTitle,
          trailing: trailing,
          onTap: onPress,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
