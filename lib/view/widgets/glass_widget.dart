import 'dart:ui';

import 'package:flutter/material.dart';

class GlassMorphism extends StatelessWidget {
  Widget child;
  GlassMorphism({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
        child: Container(
          child: child,
          padding: EdgeInsets.all(_size.height * .01),
          decoration: BoxDecoration(
              color: const Color(0xff3d3f6d).withOpacity(0.3),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                  width: 1.5, color: const Color(0xff3d3f6d).withOpacity(0.3))),
        ),
      ),
    );
  }
}
