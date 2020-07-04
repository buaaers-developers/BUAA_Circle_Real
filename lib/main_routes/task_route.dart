import 'package:buaacircle/task/tasks.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskRoute extends StatefulWidget {

  Task _task;

  TaskRoute(this._task);

  @override
  _TaskRouteState createState() => _TaskRouteState(this._task);

}

class _TaskRouteState extends State<TaskRoute> {

  final Task _task;

  _TaskRouteState(this._task);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BUAA_CIRCLE",
          style: TextStyle(
            color: Colors.blue[200],
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.edit), onPressed: () {}),
          IconButton(icon: Icon(Icons.remove), onPressed: () {}),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(6.0),
        children: <Widget>[
          Card(
            child: Text(
              _task.title,
              style: TextStyle(
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
            color: _task.category.cardColor,
            margin: EdgeInsets.all(20.0),
          ),
          GestureDetector(
            onTap: () {
              showDatePicker(
                context: context,
                initialDate: new DateTime.now(),
                firstDate: new DateTime.now().subtract(new Duration(days: 10)),
                lastDate: new DateTime.now().add(new Duration(days: 365)),
              ).then((value) {
                setState(() {
                  if (value != null)
                    _task.startTime = new DateTime(value.year, value.month, value.day,
                                        _task.startTime.hour, _task.startTime.minute);
                });
              });
            },
            child: Card(
              child: Text(
                "date :\t" + _task.startTime.year.toString() + "-"
                    + _task.startTime.month.toString() + "-"
                    + _task.startTime.day.toString(),
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.left,
              ),
              color: _task.category.cardColor,
            ),
          ),
          GestureDetector(
            onTap: () {
              showTimePicker(context: context, initialTime: TimeOfDay.now())
                  .then((value) {
                    setState(() {
                      if (value != null)
                        _task.startTime = new DateTime(
                          _task.startTime.year,
                          _task.startTime.month,
                          _task.startTime.day,
                          value.hour,
                          value.minute,
                        );
                    });
                  });
            },
            child: Card(
              child: Text(
                "start time :\t" + timeFormat(_task.startTime.hour, _task.startTime.minute),
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.left,
              ),
              color: _task.category.cardColor,
            ),
          ),
          GestureDetector(
            onTap: () {
              showTimePicker(context: context, initialTime: TimeOfDay.now())
                  .then((value) {
                    setState(() {
                      if (value != null)
                        _task.endTime = new DateTime(
                          _task.endTime.year,
                          _task.endTime.month,
                          _task.endTime.day,
                          value.hour,
                          value.minute,
                        );
                    });
                  });
            },
            child: Card(
              child: Text(
                "end time :\t" + timeFormat(_task.endTime.hour, _task.endTime.minute),
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.left,
              ),
              color: _task.category.cardColor,
            ),
          ),
        ],
      ),
      backgroundColor: _task.category.cardColor,
    );
  }

  String timeFormat(int hh, int mm) {
    return hh.toString() + (mm >= 10 ? ":" : ":0") + mm.toString();
  }

}