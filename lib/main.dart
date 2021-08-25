import 'package:book_keeping/production/production.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: 'Book Keeping App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // navigate to production section
  navigateToProduction() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Production(),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[900],
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 5,
                ),
                Text(
                  "Welcome To ${widget.title}",
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                ),
                // Add logo Image
                Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("images/default.png"),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(14),
                  child: Text(
                    'Save Time when keeping records',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                // login button
                Padding(
                  padding: EdgeInsets.all(15),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      alignment: Alignment.center,
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.all(20)),
                    ),
                    child: Text(
                      'Start Now',
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                    onPressed: () => navigateToProduction(),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    'PALZ CORNER MAIZE MILLERS',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
