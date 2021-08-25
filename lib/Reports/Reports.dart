import 'package:flutter/material.dart';

class Reports extends StatefulWidget {
  final int flour;
  final int waste;
  final int purchased;
  const Reports(
      {Key? key,
      required this.flour,
      required this.waste,
      required this.purchased})
      : super(key: key);

  @override
  _ReportsState createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  // ignore: slash_for_doc_comments
  /**
   * Computes the percentage production
   */
  percentProduction(int flour, int v2) {
    var result = ((flour / v2) * 100);
    return result.floorToDouble();
  }

  // ignore: slash_for_doc_comments
  /**
   * Computes the percentage waste
   */
  percentWaste(int waste, int purchase) {
    var ans = ((waste / purchase) * 100);
    return ans.floorToDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Chip(label: Text('Report for production and sales')),
              ),
              Table(
                textBaseline: TextBaseline.alphabetic,
                border: TableBorder.all(style: BorderStyle.none),
                children: [
                  TableRow(
                    children: [
                      Text('Total (Maize Brand and Maize flour)'),
                      Text(
                        '${(widget.flour) + (widget.waste)} (KG)',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                      )
                    ],
                  ),
                  TableRow(
                    children: [
                      Text(
                        'Remains (Maize Brand and Maize flour)',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      Text(
                        '${(widget.purchased) - ((widget.flour) + (widget.waste))} (KG)',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                      )
                    ],
                  ),
                  TableRow(
                    children: [
                      Text('Percentage Production'),
                      Text(
                        "${percentProduction(widget.flour, widget.purchased)} %",
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                      )
                    ],
                  ),
                  TableRow(
                    children: [
                      Text(
                        'Percentage waste(Remains)',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      Text(
                        "${percentWaste(((widget.purchased) - ((widget.flour) + (widget.waste))), widget.purchased)} %",
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
