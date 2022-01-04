import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const bgColor = Color(0xff141414);
const white = Color(0xffffffff);
const grey = Color(0xFF4E4B4B);
const black = Color(0xff000000);
var theme = ThemeData(
  fontFamily: 'Marvel',
);

headerText({required String content, Color? color})=>Text(
  content,
  style: TextStyle(
      fontSize: 36.sp, color: color?? grey, fontWeight: FontWeight.w700),
);