import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State createState() => Screen();
}

class Screen extends State<Home> {
  bool _switchValue = true;
  bool _showFab = false;
  bool _switchlistvalue = false;
  Color _switchlistcolor = Colors.redAccent.shade400;
  int _count = 0;
  bool _switchDisabled = false;

  void _disableSwitch() {
    setState(() {
      _switchDisabled = true;
    });
  }

  void _onShowFabChanged(bool value) {
    setState(() {
      _showFab = value;
      _switchlistcolor = _color();
    });
  }

  Color _color() {
    if (!_switchlistvalue) {
      _switchlistvalue = true;
      return Colors.lightGreenAccent.shade400;
    } else {
      _switchlistvalue = false;
      return Colors.redAccent.shade400;
    }
  }

  void _dialog(int x) {
    Widget cancelButton = IconButton(
      color: Colors.redAccent.shade400,
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
          const Text("Spaß \n"),
          RichText(
            text: const TextSpan(
              text: '😜😜😜😜\n',
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
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        elevation: 4,
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff3a57e8),
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
            value: _showFab,
            onChanged: _switchDisabled ? null: (bool newValue) {
              setState(() {
                _switchValue = _showFab;
              });
            },
            tileColor: _switchlistcolor,
            activeColor: Colors.lightGreenAccent.shade400,
            activeTrackColor: Colors.lightGreenAccent.shade200,
            controlAffinity: ListTileControlAffinity.trailing,
            dense: false,
            inactiveThumbColor: Colors.redAccent.shade700,
            inactiveTrackColor: Colors.redAccent.shade100,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            selected: false,
            selectedTileColor: const Color(0x42000000),
          ),
        ),
      ),
      floatingActionButton: _showFab
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
    _count = _count + 1 ;
    print(_count);
    if(_count >= 5){
    }
  }
}
