import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleIconButton extends StatelessWidget {
  final String title;
  final String content;
  final Function()? onPress;
  final Color primaryColor;

  const TitleIconButton(
      {super.key,
      required this.title,
      required this.content,
      this.onPress,
      required this.primaryColor});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(seedColor: primaryColor);
    return Theme(
      data: ThemeData(
        useMaterial3: true,
        // colorSchemeSeed: Colors.green,
      ),
      child: Card(
        color: colorScheme.secondaryContainer,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {},
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    content,
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: colorScheme.primary,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
