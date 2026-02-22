import 'package:flutter/material.dart';
import '../../util/sizing.dart';

class ChangeTable extends StatelessWidget {
  final Map<int, int> change;
  final bool splitIntoTwoColumns;

  const ChangeTable({
    super.key,
    required this.change,
    required this.splitIntoTwoColumns,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: AppSizing.rowFontSize(context),
      fontWeight: FontWeight.w500,
    );

    Widget buildCol(List<int> dens) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: dens
            .map(
              (d) => Padding(
                padding: EdgeInsets.symmetric(vertical: AppSizing.gap(context) / 4),
                child: Text('$d: ${change[d] ?? 0}', style: textStyle),
              ),
            )
            .toList(),
      );
    }

    // Portrait: one column with all denominations
    if (!splitIntoTwoColumns) {
      return buildCol(const [500, 100, 50, 20, 10, 5, 2, 1]);
    }

    // Landscape: split like the screenshot feel (4 + 4)
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: buildCol(const [500, 100, 50, 20])),
        SizedBox(width: AppSizing.gap(context)),
        Expanded(child: buildCol(const [10, 5, 2, 1])),
      ],
    );
  }
}
