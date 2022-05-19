import 'package:flutter/material.dart';
import 'package:flutter_cashtip/main.dart';
import 'package:flutter_cashtip/widgets/subtitle_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ChooseTipWidget extends StatelessWidget {
  const ChooseTipWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SubTitle(text: "Choose tip"),
        SizedBox(height: 15.h),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(100.r),
                  onTap: () {
                    context.read<Estimates>().changeTip(10.0);
                  },
                  child: PercentagesItem(
                    text: "10%",
                    active: context.watch<Estimates>().tip == 10 ? true : false,
                  ),
                ),
                SizedBox(width: 40.w),
                InkWell(
                  borderRadius: BorderRadius.circular(100.r),
                  onTap: () {
                    context.read<Estimates>().changeTip(15.0);
                  },
                  child: PercentagesItem(
                    text: "15%",
                    active: context.watch<Estimates>().tip == 15 ? true : false,
                  ),
                ),
                SizedBox(width: 40.w),
                InkWell(
                  borderRadius: BorderRadius.circular(100.r),
                  onTap: () {
                    context.read<Estimates>().changeTip(20.0);
                  },
                  child: PercentagesItem(
                    text: "20%",
                    active: context.watch<Estimates>().tip == 20 ? true : false,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(100.r),
                  onTap: () {
                    context.read<Estimates>().changeTip(25.0);
                  },
                  child: PercentagesItem(
                    text: "25%",
                    active: context.watch<Estimates>().tip == 25 ? true : false,
                  ),
                ),
                SizedBox(width: 40.w),
                InkWell(
                  borderRadius: BorderRadius.circular(100.r),
                  onTap: () {
                    showDialog<void>(
                      context: context,
                      builder: (BuildContext context) {
                        TextEditingController modalFieldController =
                            new TextEditingController();

                        return AlertDialog(
                          title: const Text('Custom tip:'),
                          content: SingleChildScrollView(
                            child: TextField(
                              controller: modalFieldController,
                              keyboardType: TextInputType.number,
                              style: TextStyle(fontSize: 20.sp),
                              decoration: InputDecoration.collapsed(
                                hintText: "\$" +
                                    context.watch<Estimates>().tip.toString(),
                                hintStyle: TextStyle(
                                  fontSize: 20.sp,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                                border: UnderlineInputBorder(),
                              ),
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('Set the tip'),
                              onPressed: () {
                                if (modalFieldController.text != "") {
                                  context.read<Estimates>().changeTip(
                                      double.parse(modalFieldController.text));
                                }

                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: PercentagesItem(
                    text: "Custom tip",
                    active: ![10, 15, 20, 25]
                            .contains(context.watch<Estimates>().tip)
                        ? true
                        : false,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class PercentagesItem extends StatelessWidget {
  final String text;
  final bool? active;
  const PercentagesItem({
    Key? key,
    required this.text,
    this.active,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(18.w, 14.w, 18.w, 14.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.r),
        color: (active != null && active == true)
            ? Theme.of(context).accentColor
            : Theme.of(context).primaryColor,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 22.sp, color: Colors.white),
        ),
      ),
    );
  }
}
