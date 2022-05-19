import 'package:flutter/material.dart';
import 'package:flutter_cashtip/widgets/bill_total_widget.dart';
import 'package:flutter_cashtip/widgets/choose_tip_widget.dart';
import 'package:flutter_cashtip/widgets/logo_widget.dart';
import 'package:flutter_cashtip/widgets/result_widget.dart';
import 'package:flutter_cashtip/widgets/split_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Estimates>(
      create: (_) => Estimates(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: "Inter",
          primaryColor: Color(0xFFC4C4C4),
          accentColor: Color(0xFF53FF83),
          primaryColorDark: Color(0xFF616161),
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(428, 926));
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: 926.h,
            child: Column(
              children: [
                SizedBox(height: 25.h),
                const LogoWidget(),
                SizedBox(height: 25.h),
                const BillTotalWidget(),
                SizedBox(height: 25.h),
                const ChooseTipWidget(),
                SizedBox(height: 25.h),
                const SplitWidget(),
                SizedBox(height: 15.h),
                Expanded(
                  child: ResultWidget(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Estimates extends ChangeNotifier {
  double _bill = 0;
  double _tip = 10;
  int _split = 1;
  double _result = 0;

  double get bill => _bill;
  double get tip => _tip;
  int get split => _split;
  double get result => _result;

  updateResult() {
    _result = double.parse(
        ((_bill + (_bill * (_tip / 100))) / _split).toStringAsFixed(2));
  }

  changeBill(newBill) {
    _bill = newBill;
    updateResult();
    notifyListeners();
  }

  changeTip(newTip) {
    _tip = newTip;
    updateResult();
    notifyListeners();
  }

  changeSplit(newSplit) {
    _split = newSplit;
    updateResult();
    notifyListeners();
  }
}
