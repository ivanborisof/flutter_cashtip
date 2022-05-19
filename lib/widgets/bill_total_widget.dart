import 'package:flutter/material.dart';
import 'package:flutter_cashtip/main.dart';
import 'package:flutter_cashtip/widgets/subtitle_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BillTotalWidget extends StatelessWidget {
  const BillTotalWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SubTitle(text: "Enter bill total"),
        SizedBox(height: 15.h),
        SizedBox(
          width: 110.w,
          child: TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) =>
                context.read<Estimates>().changeBill(double.parse(value)),
            style: TextStyle(fontSize: 25.sp),
            decoration: InputDecoration.collapsed(
              hintText: "\$452.48",
              hintStyle: TextStyle(
                fontSize: 25.sp,
                color: Theme.of(context).primaryColorDark,
              ),
              border: UnderlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
