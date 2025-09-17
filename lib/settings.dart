import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key, required this.title});

  final String title;

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  TextEditingController controller = TextEditingController();
  bool? isChecked1 = false;
  bool? isCheched2 = false;
  bool isSwitched1 = false;
  bool isSwitched2 = false;
  double slided = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(child: Text('Settings')),
              TextField(
                controller: controller,
                onEditingComplete: () {
                  setState(() {});
                },
              ),
              Text(controller.text),
              Checkbox.adaptive(
                value: isChecked1,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked1 = value;
                  });
                },
              ),
              CheckboxListTile(
                value: isCheched2,
                onChanged: (bool? value) {
                  setState(() {
                    isCheched2 = value;
                  });
                },
                title: Text('CheckboxListTile'),
              ),
              Switch.adaptive(
                value: isSwitched1,
                onChanged: (bool value) {
                  setState(() {
                    isSwitched1 = value;
                  });
                },
              ),
              SwitchListTile.adaptive(
                value: isSwitched2,
                onChanged: (bool value) {
                  setState(() {
                    isSwitched2 = value;
                  });
                },
                title: Text('SwitchListTile'),
              ),
              Slider.adaptive(
                max: 10,
                divisions: 100,
                value: slided,
                onChanged: (double value) {
                  setState(() {
                    slided = value;
                  });
                  print(slided);
                },
              ),
              GestureDetector(
                onTap: () {
                  print('GestureDetector tapped');
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.blueGrey,
                  child: Center(child: Text('GestureDetector')),
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  print('InkWell tapped');
                },
                hoverColor: Colors.blue,
                splashColor: Colors.cyan,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  child: Center(child: Text('InkWell')),
                ),
              ),
              SizedBox(height: 20),
              Wrap(
                spacing: 8, // horizontal space
                runSpacing: 8, // vertical space
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.deepPurple,
                    ),
                    onPressed: () {},
                    child: Text('ElevatedButton'),
                  ),
                  FilledButton(
                    style: FilledButton.styleFrom(
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () {},
                    child: Text('FilledButton'),
                  ),
                  TextButton(onPressed: () {}, child: Text('TextButton')),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text('OutlinedButton'),
                  ),
                  CloseButton(color: Colors.red),
                  BackButton(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
