import 'package:flutter/cupertino.dart';

const settingsItem = BottomNavigationBarItem(
  icon: Icon(CupertinoIcons.settings),
  label: 'Settings',
);

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() {
    return SettingsTabState();
  }
}

class SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
          largeTitle: Text('Settings'),
        ),
      ],
    );
  }
}
