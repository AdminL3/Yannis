import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State createState() => Screen();
}

class Screen extends State<Test> {
  bool _switchValue = true;
  bool _switchDisabled = false;

  void _disableSwitch() {
    setState(() {
      _switchDisabled = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            SwitchListTile(
              title: const Text('Switch'),
              value: _switchValue,
              onChanged: _switchDisabled
                  ? null
                  : (bool newValue) {
                      setState(() {
                        _switchValue = newValue;
                      });
                    },
            ),
          ],
        ),
      ),
    );
  }
}
