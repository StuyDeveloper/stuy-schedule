import 'package:flutter/cupertino.dart';

const scheduleItem = BottomNavigationBarItem(
  icon: Icon(CupertinoIcons.list_number),
  label: 'Schedule',
);

class ScheduleTab extends StatefulWidget {
  const ScheduleTab({super.key});

  @override
  State<ScheduleTab> createState() {
    return ScheduleTabState();
  }
}

class ScheduleTabState extends State<ScheduleTab> {
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
          largeTitle: Text('Schedule'),
        ),
        SliverList(
          delegate: SliverChildListDelegate.fixed(
            <Widget>[
              DecoratedBox(
                decoration: BoxDecoration(
                  color: CupertinoColors.systemFill,
                  borderRadius: BorderRadius.all(Radius.circular(60)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(
                    child: Text(
                      'No schedule available',
                      style: TextStyle(
                        color: CupertinoColors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
