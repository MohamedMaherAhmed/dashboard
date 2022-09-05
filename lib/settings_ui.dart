import 'package:flutter/material.dart';
import 'my_global_vars.dart' as globals;

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: globals.getTextColour())),
        leading: BackButton(
          color: globals.getTextColour(),
          onPressed: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil('DashBoard', (route) => false);
          },
        ),
        centerTitle: false,
        elevation: 0,
        backgroundColor: globals.getModeBackGroundColour(),
      ),
      backgroundColor: globals.getModeBackGroundColour(),
      body: Align(
        alignment: AlignmentDirectional.center,
        child: TextButton(
            onPressed: () {
              bool mode = globals.isDark;
              switch (mode) {
                case true:
                  setState(() {
                    globals.isDark = false;
                  });
                  break;
                case false:
                  setState(() {
                    globals.isDark = true;
                  });
                  break;
              }
            },
            child: globals.isDark
                ? Row(
                    textDirection: TextDirection.ltr,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Text(
                          'Light Mode',
                          style: TextStyle(color: globals.getButtonColour()),
                        ),
                        const SizedBox(width: 10),
                        const Icon(Icons.light_mode, size: 10),
                      ])
                : Row(
                    textDirection: TextDirection.ltr,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        const Text('Dark Mode'),
                        const SizedBox(width: 10),
                        Icon(
                          Icons.dark_mode,
                          size: 10,
                          color: globals.getIconColour(),
                        ),
                      ])),
      ),
    );
  }
}
