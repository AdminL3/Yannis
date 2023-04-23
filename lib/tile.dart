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

  void _enableSwitch() {
    setState(() {
      _switchDisabled = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('SwitchListTile Example'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _disableSwitch,
              child: const Text('Disable Switch'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _enableSwitch,
              child: const Text('Enable Switch'),
            ),
          ],
        ),
      ),
    );
  }
}
