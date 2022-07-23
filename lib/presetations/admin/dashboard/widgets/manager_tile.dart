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
        borderRadius: BorderRadius.circular(16),
      ),
      child: DefaultTextStyle(
        style: GoogleFonts.openSans(
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
