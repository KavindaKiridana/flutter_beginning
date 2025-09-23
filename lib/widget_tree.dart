import 'package:flutter/material.dart';
import 'package:flutter5/comming_from_internet.dart';
import 'package:flutter5/internet_page.dart';
import 'package:flutter5/notifier.dart';
import 'package:flutter5/profile.dart';
import 'package:flutter5/about.dart';
import 'package:flutter5/top_a_bar.dart';

List<Widget> pages = [
  About(),
  Profile(),
  InternetPage(),
  CommingFromInternet(),
];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: selectedBarNo,
      builder: (context, value, child) {
        return Scaffold(
          appBar: TopABar(),
          body: pages.elementAt(value),
          bottomNavigationBar: NavigationBar(
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.contact_page),
                label: 'about',
              ),
              NavigationDestination(icon: Icon(Icons.person), label: 'profile'),
              NavigationDestination(
                icon: Icon(Icons.integration_instructions_rounded),
                label: 'internet',
              ),
              NavigationDestination(
                icon: Icon(Icons.signal_wifi_connected_no_internet_4),
                label: 'internet',
              ),
            ],
            onDestinationSelected: (int num) {
              selectedBarNo.value = num;
            },
            selectedIndex: value,
          ),
        );
      },
    );
  }
}
