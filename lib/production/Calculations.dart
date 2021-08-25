import 'package:book_keeping/Reports/Reports.dart';
import 'package:flutter/material.dart';

class Calculation extends StatefulWidget {
  final int target;
  final int purchased;
  const Calculation({Key? key, required this.target, required this.purchased})
      : super(key: key);

  @override
  _CalculationState createState() => _CalculationState();
}

class _CalculationState extends State<Calculation> {
  var p1, p2, p3, p4, p5, p6;
  @override
  void initState() {
    super.initState();
    p1 = 0;
    p2 = 0;
    p3 = 0;
    p4 = 0;
    p6 = 0;
    p5 = 0;
  }

  // controllers
  TextEditingController __controller1 = TextEditingController();
  TextEditingController __controller2 = TextEditingController();
  TextEditingController __controller3 = TextEditingController();
  // ignore: slash_for_doc_comments
  /**
   * Controllers for maize brand
   */
  TextEditingController __controller4 = TextEditingController();
  TextEditingController __controller5 = TextEditingController();
  TextEditingController __controller6 = TextEditingController();
  // TextEditingController __controller4 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade900,
        title: Text('Computations'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Chip(
                  label: Text(
                    'Your target price per Kilogram is Shs:${widget.target}',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Align(
                child: Text(
                  'Production (Maize Flour)',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                alignment: Alignment.center,
              ),
            ),
            // table for computations
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Align(
                alignment: Alignment.center,
                child: Table(
                  children: [
                    TableRow(children: [
                      Text('Weight in kg(s)'),
                      Text('Quantity (No. of bags)')
                    ]),
                    TableRow(children: [
                      Text('50'),
                      TextField(
                        keyboardAppearance: Brightness.dark,
                        keyboardType: TextInputType.number,
                        controller: __controller1,
                        onChanged: (value1) {
                          setState(() {
                            p1 = int.parse(__controller1.text);
                          });
                        },
                      )
                    ]),
                    TableRow(children: [
                      Text('25'),
                      TextField(
                        controller: __controller2,
                        onChanged: (value2) {
                          setState(() {
                            p2 = int.parse(__controller2.text);
                          });
                        },
                      )
                    ]),
                    TableRow(children: [
                      Text('10'),
                      TextField(
                        controller: __controller3,
                        onChanged: (value3) {
                          setState(() {
                            p3 = int.parse(__controller3.text);
                          });
                        },
                      )
                    ]),
                    TableRow(children: [
                      Text('Total Stock'),
                      Text("${p1 * 50 + p2 * 25 + p3 * 10}")
                    ]),
                    TableRow(children: [
                      Text('Total Cost(Maize flour)'),
                      Text(
                          "Shs: ${(p1 * 50 + p2 * 25 + p3 * 10) * (widget.target)}")
                    ]),
                  ],
                ),
              ),
            ),
            // maize product
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                'Production - (Maize Brand)',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
            /**
             * Table layout for maize brand
             */
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Table(
                children: [
                  TableRow(children: [
                    Text('Weight in kilos(kg)'),
                    Text('Quantity(No. of bags)')
                  ]),
                  TableRow(
                    children: [
                      Text('50'),
                      TextField(
                        controller: __controller4,
                        onChanged: (value3) {
                          setState(() {
                            p4 = int.parse(__controller4.text);
                          });
                        },
                      )
                    ],
                  ),
                  TableRow(
                    children: [
                      Text('100'),
                      TextField(
                        controller: __controller5,
                        onChanged: (value3) {
                          setState(() {
                            p5 = int.parse(__controller5.text);
                          });
                        },
                      )
                    ],
                  ),
                  TableRow(
                    children: [
                      Text('350'),
                      TextField(
                        controller: __controller6,
                        onChanged: (value3) {
                          setState(() {
                            p6 = int.parse(__controller6.text);
                          });
                        },
                      )
                    ],
                  ),
                  TableRow(
                    children: [
                      Text('Total(Maize Brand)'),
                      Text("${p4 * 50 + p5 * 100 + p6 * 350}")
                    ],
                  ),
                  TableRow(
                    children: [
                      Text('Total Cost(Maize Brand)'),
                      Text(
                          "Shs: ${(p4 * 50 + p5 * 100 + p6 * 350) * (widget.target)}")
                    ],
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.indigo.shade900,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => BottomSheet(
                backgroundColor: Colors.transparent,
                onClosing: () {},
                builder: (context) {
                  int totalBrand = (p4 * 50 + p5 * 100 + p6 * 350);
                  int totalFlour = (p1 * 50 + p2 * 25 + p3 * 10);
                  return Reports(
                      flour: totalFlour,
                      waste: totalBrand,
                      purchased: widget.purchased);
                }),
          );
        },
        label: Text('Reports'),
        icon: Icon(Icons.report),
      ),
    );
  }
}
