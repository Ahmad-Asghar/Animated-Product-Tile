import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTextWidget extends StatelessWidget {
  final String title;
  final Color color;
  double? fontSize;
  final int? maxLines;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextDecoration textDecoration;
  final List<Shadow>? shadows;

  CustomTextWidget({
    super.key,
    required this.title,
    this.color = Colors.black,
    this.fontSize,
    this.maxLines,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.start,
    this.textDecoration = TextDecoration.none,
    this.shadows
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      textAlign: textAlign,
      style: GoogleFonts.poppins(
          decoration: textDecoration,
          color: color,
          fontSize: fontSize??16.5.sp,
          fontWeight: fontWeight,
          shadows: shadows
      ),
    );
  }
}