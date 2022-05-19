import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubTitle extends StatelessWidget {
  final String text;
  const SubTitle({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20.sp,
          color: Color(0xFFAEAEAE),
        ),
      ),
    );
  }
}
