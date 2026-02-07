


/*class CustomCircle extends StatelessWidget {
  final double size;
  final Color borderColor;
  final double borderWidth;
  final Color? fillColor;
  final String? tag;

  const CustomCircle({
    super.key,
    this.size = 24,
    this.borderColor = Colors.grey,
    this.borderWidth = 2,
    this.fillColor,
    this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: fillColor ?? Colors.transparent,
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
      ),
    );
  }
}*/


import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';

class CustomCircle extends StatelessWidget {
  final double size;
  final Color borderColor;
  final double borderWidth;
  final Color? fillColor;
  final int index;
  final int variationId;

  const CustomCircle({
    super.key,
    required this.index,
    this.size = 24,
    this.borderColor = Colors.grey,
    this.borderWidth = 2,
    this.fillColor, required this.variationId,
  });

  @override
  Widget build(BuildContext context) {


    return  GestureDetector(
      onTap: (){
        // Handle tap event, e.g., update selected variation
      },
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color:  AppColors.primaryColor,
          border: Border.all(
            color:
                 AppColors.primaryColor,
            width: borderWidth,
          ),
        ),
      ),
    );
  }
}
