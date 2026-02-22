import 'package:flutter/material.dart';
import '../../util/sizing.dart';

class Keypad extends StatelessWidget {
  final bool landscape;
  final void Function(int digit) onDigit;
  final VoidCallback onClear;

  const Keypad({
    super.key,
    required this.landscape,
    required this.onDigit,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    final h = AppSizing.keyHeight(context);
    final fontSize = AppSizing.keyFontSize(context);
    final radius = AppSizing.keyRadius(context);
    final gap = AppSizing.gap(context);

    Widget keyButton({
      required String label,
      required VoidCallback onTap,
      int flex = 1,
    }) {
      return Expanded(
        flex: flex,
        child: SizedBox(
          height: h,
          child: FilledButton(
            style: FilledButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
              ),
            ),
            onPressed: onTap,
            child: Text(label, style: TextStyle(fontSize: fontSize)),
          ),
        ),
      );
    }

    Widget row(List<Widget> children) {
      return Padding(
        padding: EdgeInsets.only(bottom: gap),
        child: Row(
          children: [
            for (int i = 0; i < children.length; i++) ...[
              if (i != 0) SizedBox(width: gap),
              children[i],
            ],
          ],
        ),
      );
    }


    if (!landscape) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          row([
            keyButton(label: '1', onTap: () => onDigit(1)),
            keyButton(label: '2', onTap: () => onDigit(2)),
            keyButton(label: '3', onTap: () => onDigit(3)),
          ]),
          row([
            keyButton(label: '4', onTap: () => onDigit(4)),
            keyButton(label: '5', onTap: () => onDigit(5)),
            keyButton(label: '6', onTap: () => onDigit(6)),
          ]),
          row([
            keyButton(label: '7', onTap: () => onDigit(7)),
            keyButton(label: '8', onTap: () => onDigit(8)),
            keyButton(label: '9', onTap: () => onDigit(9)),
          ]),
          row([
            keyButton(label: '0', onTap: () => onDigit(0)),
            keyButton(label: 'CLEAR', onTap: onClear, flex: 2),
          ]),
        ],
      );
    }


    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        row([
          keyButton(label: '1', onTap: () => onDigit(1)),
          keyButton(label: '2', onTap: () => onDigit(2)),
          keyButton(label: '3', onTap: () => onDigit(3)),
          keyButton(label: '4', onTap: () => onDigit(4)),
        ]),
        row([
          keyButton(label: '5', onTap: () => onDigit(5)),
          keyButton(label: '6', onTap: () => onDigit(6)),
          keyButton(label: '7', onTap: () => onDigit(7)),
          keyButton(label: '8', onTap: () => onDigit(8)),
        ]),
        row([
          keyButton(label: '9', onTap: () => onDigit(9)),
          keyButton(label: '0', onTap: () => onDigit(0)),
          keyButton(label: 'CLEAR', onTap: onClear, flex: 2),
        ]),
      ],
    );
  }
}
