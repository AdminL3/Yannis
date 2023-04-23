import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'Page2.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State createState() => Screen();
}

class Screen extends State<Home> {
  bool _switch_on = false;
  final Color _red = Colors.redAccent.shade400;
  final Color _green = Colors.lightGreenAccent.shade400;
  Color _switch_color = Colors.redAccent.shade400;
  int _count = 0;
  bool _switchDisabled = false;

  void _disableSwitch() {
    setState(() {
      _switchDisabled = true;
      _switch_color = _red;
      _switch_on = false;
    });
  }

  void _reset() {
    setState(() {
      if (_switch_on) {
        _switch_on = false;
        _switch_color = _red;
      } else {
        _switch_on = true;
        _switch_color = _green;
      }
    });
  }

  void _dialog(int x) {
    Widget cancelButton = IconButton(
      color: _red,
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: const Icon(Icons.check_sharp),
    );

    AlertDialog alert1 = AlertDialog(
      title: const Text('Schon aufgegeben?'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RichText(
            text: const TextSpan(
              text: '😜😜\n',
              style: TextStyle(fontFamily: 'EmojiOne', fontSize: 20),
            ),
          ),
          const Text("https://tinyurl.com/yanniiiiii"),
        ],
      ),
      actions: [
        cancelButton,
      ],
    );

    AlertDialog alert2 = AlertDialog(
      title: const Text('Ende?'),
      content: RichText(
        text: const TextSpan(
          children: <TextSpan>[
            TextSpan(
                text: 'Such weiter \n',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                )),
            TextSpan(
              text: '😅👌😮',
              style: TextStyle(fontFamily: 'EmojiOne', fontSize: 20),
            ),
          ],
        ),
      ),
      actions: [
        cancelButton,
      ],
    );

    if (x == 1) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert1;
        },
      );
    }
    if (x == 2) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert2;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 4,
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueAccent.shade200,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        leading: IconButton(
          icon: const Icon(Icons.home),
          color: Colors.black,
          onPressed: () {
            _dialog(1);
          },
        ),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Container(
          width: 250,
          height: 60,
          decoration: BoxDecoration(
            color: const Color(0x1f000000),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.zero,
            border: Border.all(color: const Color(0x4d9e9e9e), width: 1),
          ),
          child: SwitchListTile(
            title: const Text(
              "Start",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 17,
                color: Color(0xff000000),
              ),
              textAlign: TextAlign.start,
            ),
            value: _switch_on,
            onChanged: _switchDisabled
                ? null
                : (bool newValue) {
                    setState(() {
                      _reset();
                    });
                  },
            tileColor: _switch_color,
            activeColor: _green,
            activeTrackColor: Colors.lightGreenAccent.shade200,
            controlAffinity: ListTileControlAffinity.trailing,
            dense: false,
            inactiveThumbColor: _red,
            inactiveTrackColor: Colors.redAccent.shade100,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            selected: false,
            selectedTileColor: const Color(0x42000000),
            secondary: defaultTargetPlatform == TargetPlatform.iOS
                ? CupertinoSwitch(
                    value: _switch_on,
                    onChanged: _switchDisabled
                        ? null
                        : (bool newValue) {
                            setState(() {
                              _reset();
                            });
                          },
                    activeColor: CupertinoColors.activeGreen,
                  )
                : null,
          ),
        ),
      ),
      floatingActionButton: _switch_on
          ? FloatingActionButton(
              onPressed: () {
                _counter();
              },
              tooltip: 'Create',
              child: const Icon(Icons.add),
            )
          : null,
    );
  }

  void _counter() {
    _count = _count + 1;
    print(_count);
    if (_count >= 20) {
      _disableSwitch();
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Page2()));
    }
  }
}
