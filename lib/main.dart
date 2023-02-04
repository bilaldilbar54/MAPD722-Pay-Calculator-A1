import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final key = GlobalKey<FormState>();

  double _regularpay = 0.0;
  double _overtimepay = 0.0;
  double _totalpay = 0.0;
  double _paytax = 0.0;

  final TextEditingController _userhours = TextEditingController();
  final TextEditingController _userrate = TextEditingController();

  void paycalculation() {
    setState(() {
      var hoursworked = double.parse(_userhours.text.toString().trim());
      var payrate = double.parse(_userrate.text.toString().trim());

      if (hoursworked > 40) {
        _regularpay = (40 * payrate);
        _overtimepay = ((hoursworked - 40) * payrate * 1.5);
        _paytax = (_regularpay * 0.18);
        _totalpay = (_regularpay + _overtimepay);
      } else {
        _regularpay = (hoursworked * payrate);
        _paytax = (_regularpay * 0.18);
        _totalpay = (_regularpay + _overtimepay);
      }
    });
  }

  void clear() {
    setState(() {
      _regularpay = 0.0;
      _overtimepay = 0.0;
      _totalpay = 0.0;
      _paytax = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                title: const Text('⎝ *My PAY Calculator* ⎠'),
                backgroundColor: Colors.blueAccent[200]),
            body: Column(
              children: [
                SizedBox(
                  height: 530,
                  child: Column(children: [
                    Column(
                      children: [
                        SizedBox(
                            width: double.infinity,
                            child: Form(
                                key: key,
                                child: Column(
                                  children: [
                                    Container(
                                        width: double.infinity,
                                        margin: const EdgeInsets.fromLTRB(
                                            20, 70, 20, 20),
                                        child: TextFormField(
                                          controller: _userhours,
                                          decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelText:
                                                  'Please Enter Your Number of Hours '),
                                          style: const TextStyle(fontSize: 15),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Number of hours required!';
                                            } else {
                                              return null;
                                            }
                                          },
                                        )),
                                    Container(
                                        width: double.infinity,
                                        margin: const EdgeInsets.fromLTRB(
                                            20, 5, 20, 20),
                                        child: TextFormField(
                                          controller: _userrate,
                                          decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelText:
                                                  'Please Enter Your Hourly Pay Rate '),
                                          style: const TextStyle(fontSize: 15),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Hourly pay rate required!';
                                            }
                                            return null;
                                          },
                                        )),
                                    Row(
                                      children: [
                                        Container(
                                          width: 180,
                                          margin: const EdgeInsets.fromLTRB(
                                              25, 5, 15, 8),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              if (key.currentState!
                                                  .validate()) {
                                                paycalculation();
                                              }
                                            },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.blueAccent[200],
                                                textStyle: const TextStyle(
                                                    fontSize: 16)),
                                            child: const Text('Calculate Pay'),
                                          ),
                                        ),
                                        Container(
                                          width: 130,
                                          margin: const EdgeInsets.fromLTRB(
                                              20, 5, 15, 8),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              clear();
                                            },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.blueAccent[200],
                                                textStyle: const TextStyle(
                                                    fontSize: 16)),
                                            child: const Text('Clear'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ))),
                        Container(
                          margin: const EdgeInsets.fromLTRB(15, 25, 0, 0),
                          alignment: Alignment.topLeft,
                          child: const Text('Report:',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline),
                              textAlign: TextAlign.center),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                          alignment: Alignment.topLeft,
                          child: Text('Your Regular Pay: \$$_regularpay',
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.blue,
                                  fontStyle: FontStyle.italic)),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                          alignment: Alignment.topLeft,
                          child: Text('Your Overtime Pay: \$$_overtimepay',
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.blue,
                                  fontStyle: FontStyle.italic)),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                          alignment: Alignment.topLeft,
                          child: Text('Your Total Pay: \$$_totalpay',
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.blue,
                                  fontStyle: FontStyle.italic)),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                          alignment: Alignment.topLeft,
                          child: Text(
                              'Calculated Tax: \$${_paytax.toStringAsFixed(3)}',
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.blue,
                                  fontStyle: FontStyle.italic)),
                        ),
                      ],
                    ),
                  ]),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueAccent[200],
                  ),
                  height: 150,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(15, 25, 0, 0),
                        alignment: Alignment.center,
                        child: const Text('Muhammad Bilal',
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(15, 16, 0, 0),
                        alignment: Alignment.center,
                        child: const Text('301205152',
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                )
              ],
            )));
  }
}
