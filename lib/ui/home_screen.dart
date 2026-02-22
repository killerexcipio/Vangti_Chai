import 'package:flutter/material.dart';
import '../util/change.dart';
import '../util/sizing.dart';
import 'widgets/change_table.dart';
import 'widgets/keypad.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _amount = 0;

  void _addDigit(int digit) {
    setState(() {
      // Safety limit so the UI doesn't get silly-large numbers.
      if (_amount > 999999999) return;
      _amount = (_amount * 10) + digit;
    });
  }

  void _clear() {
    setState(() => _amount = 0);
  }

  @override
  Widget build(BuildContext context) {
    final change = makeChange(_amount);
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    final pad = AppSizing.pagePadding(context);
    final gap = AppSizing.gap(context);

    Widget header() {
      return Padding(
        padding: EdgeInsets.only(bottom: gap),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Taka: ',
                style: TextStyle(
                  fontSize: AppSizing.headerFontSize(context),
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '$_amount',
                style: TextStyle(
                  fontSize: AppSizing.amountFontSize(context),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget portraitLayout() {
      return Column(
        children: [
          header(),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: ChangeTable(
                    change: change,
                    splitIntoTwoColumns: false,
                  ),
                ),
                SizedBox(width: gap),
                Expanded(
                  flex: 5,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Keypad(
                      landscape: false,
                      onDigit: _addDigit,
                      onClear: _clear,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }

    Widget landscapeLayout() {
      return Column(
        children: [
          header(),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 4,
                  child: ChangeTable(
                    change: change,
                    splitIntoTwoColumns: true,
                  ),
                ),
                SizedBox(width: gap),
                Expanded(
                  flex: 6,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Keypad(
                      landscape: true,
                      onDigit: _addDigit,
                      onClear: _clear,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('VangtiChai')),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(pad),
          child: isLandscape ? landscapeLayout() : portraitLayout(),
        ),
      ),
    );
  }
}
