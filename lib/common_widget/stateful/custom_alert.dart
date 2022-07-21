import 'dart:ui';

import 'package:flutter/material.dart';

class CustomAlert extends StatelessWidget {
  final Widget child;

  const CustomAlert({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceWidth;

    Orientation orientation = MediaQuery.of(context).orientation;
    Size viewsSize = MediaQuery.of(context).size;

    deviceWidth = orientation == Orientation.portrait
        ? viewsSize.width
        : viewsSize.height;

    return MediaQuery(
      data: const MediaQueryData(),
      child: GestureDetector(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 0.5,
            sigmaY: 0.5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: SizedBox(
                        width: deviceWidth * 0.9,
                        child: GestureDetector(
                          onTap: () {},
                          child: Card(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                            child: child,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
