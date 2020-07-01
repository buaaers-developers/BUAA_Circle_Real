import 'package:buaacircle/category/category.dart';

class Task {
  final String title;
  final int durationHour;
  final DateTime dateTime;
  final Category category;

  const Task(
      {this.durationHour, this.dateTime, this.title, this.category});
}

  var defaultYear = DateTime.now().year;

List<Task> tasks = [
  Task(
    title: "物理作业",
    durationHour: 2,
    dateTime: new DateTime.utc(defaultYear, 5, 18, 10, 0),
    category: cateMap['course'],
  ),
  Task(
    title: "看电影",
    durationHour: 2,
    dateTime: new DateTime.utc(defaultYear, 5, 18, 14, 0),
    category: cateMap['dailylife'],
  ),
  Task(
    title: "OS实验报告",
    durationHour: 2,
    dateTime: new DateTime.utc(defaultYear, 5, 18, 18, 0),
    category: cateMap['course'],
  ),
  Task(
    title: "学生会_交稿子",
    durationHour: 2,
    dateTime: new DateTime.utc(defaultYear, 5, 19, 8, 0),
    category: cateMap['collective'],
  ),
  Task(
    title: "大班会",
    durationHour: 2,
    dateTime: new DateTime.utc(defaultYear, 5, 19, 10, 0),
    category: cateMap['meeting'],
  ),
  Task(
    title: "数学分析作业",
    durationHour: 2,
    dateTime: new DateTime.utc(defaultYear, 5, 19, 12, 0),
    category: cateMap['course'],
  ),
  Task(
    title: "团日感想",
    durationHour: 2,
    dateTime: new DateTime.utc(defaultYear, 5, 19, 16, 0),
    category: cateMap['collective'],
  ),
  Task(
    title: "艺术团选拔",
    durationHour: 2,
    dateTime: new DateTime.utc(defaultYear, 5, 19, 10, 0),
    category: cateMap['collective'],
  ),
  Task(
    title: "物理竞赛",
    durationHour: 2,
    dateTime: new DateTime.utc(defaultYear, 5, 20, 12, 0),
    category: cateMap['contest'],
  ),
  Task(
    title: "Lab4课下作业",
    durationHour: 2,
    dateTime: new DateTime.utc(defaultYear, 5, 20, 14, 0),
    category: cateMap['course'],
  ),
  Task(
    title: "看演唱会",
    durationHour: 2,
    dateTime: new DateTime.utc(defaultYear, 5, 20, 20, 0),
    category: cateMap['dailylife'],
  ),
];

