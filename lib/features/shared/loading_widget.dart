import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.isTransparent = false});

  final bool isTransparent;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        color: isTransparent ? Colors.transparent : Colors.white.withOpacity(0.5),
        alignment: Alignment.center,
        child: Lottie.asset(
          'assets/json/loading.json',
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}
