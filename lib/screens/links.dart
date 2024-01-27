import 'package:flutter/cupertino.dart';

const linksItem = BottomNavigationBarItem(
  icon: Icon(CupertinoIcons.link),
  label: 'Links',
);

class LinksTab extends StatefulWidget {
  const LinksTab({super.key});

  @override
  State<LinksTab> createState() {
    return LinksTabState();
  }
}

class LinksTabState extends State<LinksTab> {
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
          largeTitle: Text('Links'),
        ),
      ],
    );
  }
}
