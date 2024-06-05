import 'package:flutter/material.dart';

class ListFadeWidget extends StatelessWidget {
  const ListFadeWidget({
    super.key,
    required this.widget,
  });
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
        shaderCallback: (Rect rect) {
          return LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade900,
              Colors.transparent,
              Colors.transparent,
              Colors.blue.shade900
            ],
            stops: const [0.000, 0.016, .9, 1.0], // 10% , 80% transparent, 10%
          ).createShader(rect);
        },
        blendMode: BlendMode.dstOut,
        child: widget);
  }
}
