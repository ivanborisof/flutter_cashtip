import 'package:flutter/material.dart';
import 'package:flutter_cashtip/main.dart';
import 'package:flutter_cashtip/widgets/subtitle_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SplitWidget extends StatelessWidget {
  const SplitWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SubTitle(text: "Split"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                int lastValue = context.read<Estimates>().split;
                if (lastValue > 1) {
                  context.read<Estimates>().changeSplit(lastValue - 1);
                }
              },
              child: Text(
                "-",
                style: TextStyle(
                  fontSize: 50.sp,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            SizedBox(width: 20.w),
            Text(
              context.watch<Estimates>().split.toString(),
              style: TextStyle(
                color: Theme.of(context).primaryColorDark,
                fontSize: 40.sp,
              ),
            ),
            SizedBox(width: 20.w),
            InkWell(
              onTap: () {
                int lastValue = context.read<Estimates>().split;
                context.read<Estimates>().changeSplit(lastValue + 1);
              },
              child: Text("+",
                  style: TextStyle(
                      fontSize: 40.sp, color: Theme.of(context).primaryColor)),
            ),
          ],
        ),
      ],
    );
  }
}
