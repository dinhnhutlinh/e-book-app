import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CatButton extends StatelessWidget {
  final String title;
  final Widget content;
  final Function()? onPress;
  final Color primaryColor;

  const CatButton(
      {super.key,
      required this.title,
      required this.content,
      this.onPress,
      required this.primaryColor});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(seedColor: primaryColor);
    return Card(
      color: colorScheme.secondaryContainer,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onPress,
        child: Column(
          children: [
            ListTile(
              title: Text(
                title,
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
