import 'package:flutter/material.dart';

class KetigaPage extends StatefulWidget {
  const KetigaPage({super.key});

  @override
  State<KetigaPage> createState() => _KetigaPageState();
}

class _KetigaPageState extends State<KetigaPage> {
  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    final double widthScreen = mediaQueryData.size.width;
    final double heightScreen = mediaQueryData.size.width;
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: widthScreen / heightScreen,
      children: [
        Container(
            color: Colors.yellowAccent,
            child:
                const Center(child: Text("1", style: TextStyle(fontSize: 14)))),
        Container(
            color: Colors.blueAccent,
            child:
                const Center(child: Text("2", style: TextStyle(fontSize: 14)))),
        Container(
            color: Colors.redAccent,
            child:
                const Center(child: Text("3", style: TextStyle(fontSize: 14)))),
        Container(
            color: Colors.greenAccent,
            child:
                const Center(child: Text("4", style: TextStyle(fontSize: 14)))),
        Container(
            color: Colors.orangeAccent,
            child:
                const Center(child: Text("5", style: TextStyle(fontSize: 14)))),
      ],
    );
  }
}
