import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // variables.
  var firstNumberController = TextEditingController();
  var secondNumberController = TextEditingController();
  var result = "Result:";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Simple Calculator",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.red),
              ),
              Card(
                child: SizedBox(
                  width: double.infinity,
                  height: 350,
                  child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Enter any two numbers to calculate",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          controller: firstNumberController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "First Number"),
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          controller: secondNumberController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Second Number"),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            //Addition
                            OutlinedButton(
                                onPressed: () {
                                  var firstNumber =
                                      int.parse(firstNumberController.text);
                                  var secondNumber =
                                      int.parse(secondNumberController.text);
                                  setState(() {
                                    var addition = firstNumber + secondNumber;
                                    result = "Addition = $addition";
                                  });
                                },
                                child: Text("Add")),
                            //Subtraction.
                            OutlinedButton(
                                onPressed: () {
                                  var firstNumber =
                                      int.parse(firstNumberController.text);
                                  var secondNumber =
                                      int.parse(secondNumberController.text);
                                  var subtraction = firstNumber - secondNumber;
                                  result = "Subtraction = $subtraction";
                                  setState(() {});
                                },
                                child: Text("Sub")),
                            //Multiplicaton.
                            OutlinedButton(
                                onPressed: () {
                                  var firstNumber =
                                      int.parse(firstNumberController.text);
                                  var secondNumber =
                                      int.parse(secondNumberController.text);

                                  setState(() {
                                    var multiplication =
                                        firstNumber * secondNumber;
                                    result = "Multiplication = $multiplication";
                                  });
                                },
                                child: Text("Mul")),
                            //Division.
                            OutlinedButton(
                                onPressed: () {
                                  var firstNumber =
                                      int.parse(firstNumberController.text);
                                  var secondNumber =
                                      int.parse(secondNumberController.text);

                                  var division = firstNumber / secondNumber;
                                  result =
                                      "Division = ${division.toStringAsFixed(3)}";
                                  setState(() {});
                                },
                                child: Text("Div")),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Text(
                            result,
                            style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )));
  }
}
