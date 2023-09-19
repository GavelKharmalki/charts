import 'package:charts/bar_graph/bar_graph.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<double> weeklySummary = [
    4.40,
    23.0,
    4.67,
    12.9,
    14.6,
    13.6,
    5.5,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SizedBox(height: 400, child: MyBarGraph()),
      ),
    );
  }
}
