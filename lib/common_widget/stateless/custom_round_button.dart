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
    return MaterialButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: const StadiumBorder(),
      onPressed: onPress,
      child: Text(
        title,
      ),
    );
  }
}
