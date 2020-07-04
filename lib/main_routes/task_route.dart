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
  final Color _themeColor;

  _TaskRouteState(this._task) : this._themeColor = _task.category.cardColor;

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
          IconButton(icon: Icon(Icons.remove), onPressed: () {
            deleteAlert();
          }),
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
            color: _themeColor,
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
                "活动日期 :\t" + _task.startTime.year.toString() + "-"
                    + _task.startTime.month.toString() + "-"
                    + _task.startTime.day.toString(),
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.left,
              ),
              color: _themeColor,
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
                "开始时间 :\t" + timeFormat(_task.startTime.hour, _task.startTime.minute),
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.left,
              ),
              color: _themeColor,
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
                "结束时间 :\t" + timeFormat(_task.endTime.hour, _task.endTime.minute),
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.left,
              ),
              color: _themeColor,
            ),
          ),
        ],
      ),
      backgroundColor: _themeColor,
    );
  }

  String timeFormat(int hh, int mm) {
    return hh.toString() + (mm >= 10 ? ":" : ":0") + mm.toString();
  }

  void deleteAlert() async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("提示"),
          content: Text("是否删除该任务？"),
          actions: <Widget>[
            MaterialButton(
              child: Text("否"),
              textColor: Colors.white,
              color: Colors.lightBlue,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            MaterialButton(
              child: Text("是"),
              textColor: Colors.white,
              color: Colors.lightBlue,
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context, "delete");
              },
            ),
          ],
        );
      },
    );
  }
}