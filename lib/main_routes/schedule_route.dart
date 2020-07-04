import 'package:buaacircle/main_routes/task_route.dart';
import 'package:buaacircle/task/tasks.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timetable_view/flutter_timetable_view.dart';

class ScheduleRoute extends StatefulWidget {
  @override
  _ScheduleRouteState createState() => _ScheduleRouteState();
}

class _ScheduleRouteState extends State<ScheduleRoute> {
  TextStyle laneTextStyle = TextStyle(
    fontSize: 15,
  );

  List<String> weeks = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TimetableView(
        timetableStyle: TimetableStyle(
          laneHeight: 40,
          laneColor: Colors.blue.shade100,
          timelineItemColor: Colors.blue.shade100,
          mainBackgroundColor: Colors.blue.shade50,
          startHour: 0,
          endHour: 24,
          timeItemWidth: 40,
          timeItemHeight: 50,
          laneWidth: 75,
        ),
        laneEventsList: weeks.asMap().keys.map((week) =>
          LaneEvents(
            lane: buildLane(name: weeks[week]),
            events: getTask(week + 1).map((task) =>
              TableEvent(
                title: task.title,
                start: TableEventTime(hour: task.startTime.hour, minute: task.startTime.minute),
                end: TableEventTime(hour: task.endTime.hour, minute: task.endTime.minute),
                textStyle: laneTextStyle,
                backgroundColor: task.category.iconBackgroundColor,
                onTap: () {
                  modify(task);
                },
              )
            ).toList(),
          )
        ).toList()
      ),
    );
  }

  void modify(Task task) async {
    String signal = await Navigator.push(context, 
        MaterialPageRoute(builder: (context) => TaskRoute(task)));
    if (signal != null && signal == "delete") {
      tasks.remove(task);
    }
    setState(() { });
  }

  Lane buildLane({String name}) {
    return Lane(
      height: 50,
      width: 75,
      name: name,
      backgroundColor: Colors.blue.shade100,
      textStyle: TextStyle(
        fontSize: 20,
        color: Colors.blue[500],
        fontWeight: FontWeight.bold,
      ),
    );
  }

  List<Task> getTask(int week) {
    List<Task> ans = [];
    for (int i = 0; i < tasks.length ; i++) {
      if (tasks[i].startTime.weekday == week) {
        ans.add(tasks[i]);
      }
    }
    return ans;
  }
}
