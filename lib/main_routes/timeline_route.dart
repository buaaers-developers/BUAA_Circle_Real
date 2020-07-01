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
      Card(
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
              Text(datetime2String(task.dateTime), style: textTheme.caption),
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
      position:
      i % 2 == 0 ? TimelineItemPosition.right : TimelineItemPosition.left,
      isFirst: i == 0,
      isLast: i == tasks.length,
      iconBackground: task.category.iconBackgroundColor,
      icon: task.category.icon,
    );
  }

  String datetime2String(DateTime dateTime) {
    return dateTime.month.toString() + "月" + dateTime.day.toString() + "日，" +
        dateTime.hour.toString() + ":" + dateTime.minute.toString();
  }
}
