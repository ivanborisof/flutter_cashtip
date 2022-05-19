import 'package:flutter/material.dart';
import 'package:flutter_cashtip/main.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ResultWidget extends StatelessWidget {
  const ResultWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(60.r),
          topLeft: Radius.circular(60.r),
        ),
        color: Theme.of(context).primaryColor,
      ),
      width: 365.w,
      child: Column(
        children: [
          SizedBox(height: 25.h),
          Text(
            "Total per person",
            style: TextStyle(
              fontSize: 30.sp,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            "\$" + context.watch<Estimates>().result.toString(),
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 62.sp,
              color: Theme.of(context).accentColor,
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 125.w,
                child: Column(
                  children: [
                    Text(
                      "bill",
                      style: TextStyle(
                        fontSize: 30.sp,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "\$" + context.watch<Estimates>().bill.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 30.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 60.w),
              SizedBox(
                width: 125.w,
                child: Column(
                  children: [
                    Text("tip",
                        style: TextStyle(
                          fontSize: 30.sp,
                          color: Colors.white,
                        )),
                    SizedBox(height: 10.h),
                    Text(
                      context.watch<Estimates>().tip.toString() + "%",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 30.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
