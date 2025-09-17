import 'package:flutter/material.dart';
import 'package:flutter5/notifier.dart';
import 'package:flutter5/settings.dart';

class TopABar extends StatelessWidget implements PreferredSizeWidget {
  const TopABar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Center(child: Text('Hello')),
      backgroundColor: Colors.blueGrey,
      actions: [
        ValueListenableBuilder<bool>(
          valueListenable: IsDarkMode,
          builder: (context, boolvalue, child) {
            return IconButton(
              onPressed: () {
                IsDarkMode.value = !IsDarkMode.value;
              },
              icon: boolvalue ? Icon(Icons.light_mode) : Icon(Icons.dark_mode),
            );
          },
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Settings(title: 'this is how you sent data via pages');
                },
              ),
            );
          },
          icon: Icon(Icons.settings),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
