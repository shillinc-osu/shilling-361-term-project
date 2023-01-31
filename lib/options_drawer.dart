import 'package:flutter/material.dart';
import 'package:weather_app/addscreen.dart';
import 'package:weather_app/cityscreen.dart';

class OptionsDrawer extends StatefulWidget {
  final void Function(bool) swapTheme;
  final bool isInDarkMode;
  const OptionsDrawer(
      {Key? key, required this.swapTheme, required this.isInDarkMode})
      : super(key: key);

  @override
  State<OptionsDrawer> createState() => _OptionsDrawerState();
}

class _OptionsDrawerState extends State<OptionsDrawer> {
  ListTile cityTile(BuildContext context, String name) {
    return ListTile(
        title: Text(name),
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => CityScreen(
                    swapTheme: widget.swapTheme,
                    isInDarkMode: widget.isInDarkMode,
                    name: name)))));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        const SizedBox(
          height: 50,
          child: DrawerHeader(child: Text("Settings")),
        ),
        ListTile(
            title: const Text("Dark Mode"),
            trailing: Switch(
              value: widget.isInDarkMode,
              onChanged: widget.swapTheme,
            )),
        cityTile(context, "Placeholder City 1"),
        cityTile(context, "Placeholder City 2"),
        cityTile(context, "Placeholder City 3"),
        cityTile(context, "Placeholder City 4"),
        ListTile(
          title: Icon(Icons.add),
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: ((context) => AddScreen()))),
        )
      ]),
    );
  }
}
