import 'package:book_keeping/production/Calculations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Production extends StatefulWidget {
  const Production({Key? key}) : super(key: key);

  @override
  _ProductionState createState() => _ProductionState();
}

class _ProductionState extends State<Production> {
  // controllers
  GlobalKey _openDrawer = GlobalKey();
  // text controller
  TextEditingController _controller = TextEditingController();
  TextEditingController _purchased = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
        // leading: ,
        title: Text('Set Target'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            // height: MediaQuery.of(context).size.height / 2,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 14,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('images/default.png'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      'Price target per kilogram (kg)',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontSize: 16,
                          ),
                    ),
                  ),
                  TextField(
                    autocorrect: true,
                    autofocus: true,
                    autofillHints: ["200", "3000", "4000"],
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      // focusedBorder: UnderlineInputBorder(),
                      hintTextDirection: TextDirection.ltr,
                      focusColor: Colors.purple.shade900,
                      hasFloatingPlaceholder: true,
                      hintMaxLines: 1,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: 'Enter your price target',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        gapPadding: 1,
                      ),
                    ),
                  ),
                  // purchased Maize
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      'Purchased Maize in kilograms (kg)',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontSize: 16,
                          ),
                    ),
                  ),
                  TextField(
                    autocorrect: true,
                    autofocus: true,
                    autofillHints: ["200", "3000", "4000"],
                    controller: _purchased,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      // focusedBorder: UnderlineInputBorder(),
                      hintTextDirection: TextDirection.ltr,
                      focusColor: Colors.purple.shade900,
                      hasFloatingPlaceholder: true,
                      hintMaxLines: 1,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: 'Enter your purchase',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        gapPadding: 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.purple.shade900),
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.all(15),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return Calculation(
                                  purchased: int.parse(_purchased.text),
                                  target: int.parse(_controller.text));
                            }),
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Proceed'),
                            SizedBox(
                              height: 20,
                            ),
                            Icon(Icons.next_plan),
                          ],
                        )),
                  ),
                  Text('${_controller.text}')
                ],
              ),
            ),
          ),
        ),
      )),
      drawer: Drawer(
        key: _openDrawer,
        elevation: 20,
      ),
    );
  }
}
