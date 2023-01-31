import 'package:flutter/material.dart';

import 'options_drawer.dart';

class CityScreen extends StatefulWidget {
  const CityScreen(
      {super.key,
      required this.swapTheme,
      required this.isInDarkMode,
      required this.name});

  final void Function(bool) swapTheme;
  final bool isInDarkMode;
  final String name;

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  Icon weatherIcon = Icon(Icons.sunny);
  int temp = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            endDrawer: OptionsDrawer(
                swapTheme: widget.swapTheme, isInDarkMode: widget.isInDarkMode),
            appBar: AppBar(
                title: const Text('Weather App'),
                centerTitle: true,
                bottom: const TabBar(tabs: <Widget>[
                  Tab(icon: Text('1-Day Forecast')),
                  Tab(icon: Text('6-Day Forecast'))
                ])),
            body: TabBarView(
              children: <Widget>[oneDay(context), threeDay(context)],
            )));
  }

  Widget oneDay(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(widget.name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const Padding(padding: EdgeInsets.all(10)),
        weatherBox(context),
        const Padding(padding: EdgeInsets.all(10)),
        Text("$temp*C",
            style: const TextStyle(fontSize: 17, fontStyle: FontStyle.italic))
      ],
    );
  }

  Widget weatherBox(BuildContext context) {
    return Container(
        height: 70,
        width: 70,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 3),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: FittedBox(fit: BoxFit.fill, child: weatherIcon));
  }

  Widget threeDay(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(widget.name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const Padding(padding: EdgeInsets.all(10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            weatherBox(context),
            const Padding(padding: EdgeInsets.all(10)),
            weatherBox(context),
            const Padding(padding: EdgeInsets.all(10)),
            weatherBox(context),
          ],
        ),
        const Padding(padding: EdgeInsets.all(10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            weatherBox(context),
            const Padding(padding: EdgeInsets.all(10)),
            weatherBox(context),
            const Padding(padding: EdgeInsets.all(10)),
            weatherBox(context),
          ],
        ),
        const Padding(padding: EdgeInsets.all(10)),
        Text("$temp*C",
            style: const TextStyle(fontSize: 17, fontStyle: FontStyle.italic))
      ],
    );
  }
}
