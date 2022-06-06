import 'package:flutter/material.dart';
import 'package:take_home/data/price_model.dart';

import '../const/theme.dart';

class DataTableWidget extends StatelessWidget {
  const DataTableWidget({
    Key? key,
    required this.prices,
  }) : super(key: key);
  final Prices prices;

  @override
  Widget build(BuildContext context) {
    const firstColumnStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    return DataTable(
      headingRowColor: MaterialStateProperty.all(
        MainTheme.cream.withOpacity(.2),
      ),
      horizontalMargin: 10,
      columnSpacing: 30,
      headingTextStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        color: MainTheme.cream,
        fontSize: 16,
      ),
      dataTextStyle: const TextStyle(
        color: MainTheme.cream,
        fontSize: 13,
      ),
      columns: const <DataColumn>[
        DataColumn(
          label: Text(
            'Weight',
          ),
        ),
        DataColumn(
          label: Text(
            'Silver',
          ),
        ),
        DataColumn(
          label: Text(
            'Gold',
          ),
        ),
        DataColumn(
          label: Text(
            'Platinum',
          ),
        ),
      ],
      rows: <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text(
              prices.ounce.weightName,
              style: firstColumnStyle,
            )),
            DataCell(Text(prices.ounce.silver.toString())),
            DataCell(Text(prices.ounce.gold.toString())),
            DataCell(Text(prices.ounce.platinum.toString())),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text(
              prices.gram.weightName,
              style: firstColumnStyle,
            )),
            DataCell(Text(prices.gram.silver.toString())),
            DataCell(Text(prices.gram.gold.toString())),
            DataCell(Text(prices.gram.platinum.toString())),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text(
              prices.hundredGram.weightName,
              style: firstColumnStyle,
            )),
            DataCell(Text(prices.hundredGram.silver.toString())),
            DataCell(Text(prices.hundredGram.gold.toString())),
            DataCell(Text(prices.hundredGram.platinum.toString())),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text(
              prices.thousandGram.weightName,
              style: firstColumnStyle,
            )),
            DataCell(Text(prices.thousandGram.silver.toString())),
            DataCell(Text(prices.thousandGram.gold.toString())),
            DataCell(Text(prices.thousandGram.platinum.toString())),
          ],
        ),
      ],
    );
  }
}
