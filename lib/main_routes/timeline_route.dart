import 'package:buaacircle/main_routes/task_route.dart';
import 'package:flutter/material.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';
import '../task/tasks.dart';

class TimelineRoute extends StatefulWidget {
  @override
  _TimelineRouteState createState() => _TimelineRouteState();
}

class _TimelineRouteState extends State<TimelineRoute> {


  @override
  Widget build(BuildContext context) {
    tasks.sort((up, down) => up.startTime.compareTo(down.startTime));
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: Timeline.builder(
          itemBuilder: centerTimelineBuilder,
          itemCount: tasks.length,
          physics: ClampingScrollPhysics(),
          position: TimelinePosition.Center),
    );
  }

  TimelineModel centerTimelineBuilder(BuildContext context, int i) {
    final task = tasks[i];
    final textTheme = Theme
        .of(context)
        .textTheme;
    return TimelineModel(
      GestureDetector(
        child: Card(
          color: task.category.cardColor,
          margin: EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(
                  height: 8.0,
                ),
                Text(datetime2String(task.startTime), style: textTheme.caption),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  task.title,
                  style: textTheme.title,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          modify(task);
        },
      ),
      position:
      i % 2 == 0 ? TimelineItemPosition.right : TimelineItemPosition.left,
      isFirst: i == 0,
      isLast: i == tasks.length,
      iconBackground: task.category.iconBackgroundColor,
      icon: task.category.icon,
    );
  }

  void modify(Task task) async {
    await Navigator.push(context, MaterialPageRoute(builder: (context) => TaskRoute(task)));
    setState(() { });
  }

  String datetime2String(DateTime dateTime) {
    return dateTime.month.toString() + "月" + dateTime.day.toString() + "日，" +
        dateTime.hour.toString() + (dateTime.minute >= 10 ? ":" : ":0") + dateTime.minute.toString();
  }
}
