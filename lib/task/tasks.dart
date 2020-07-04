import 'package:buaacircle/category/category.dart';

class Task {
  final String title;
  DateTime startTime;
  DateTime endTime;
  Category category;

  Task({this.startTime, this.endTime, this.title, this.category});
}

  var defaultYear = DateTime.now().year;

List<Task> tasks = [
  Task(
    title: "物理作业",
    startTime: new DateTime.utc(defaultYear, 7, 6, 10, 0),
    endTime: new DateTime.utc(defaultYear, 7, 6, 12, 0),
    category: cateMap['course'],
  ),
  Task(
    title: "看电影",
    startTime: new DateTime.utc(defaultYear, 7, 6, 14, 0),
    endTime: new DateTime.utc(defaultYear, 7, 6, 16, 0),
    category: cateMap['dailylife'],
  ),
  Task(
    title: "OS实验报告",
    startTime: new DateTime.utc(defaultYear, 7, 6, 18, 0),
    endTime: new DateTime.utc(defaultYear, 7, 6, 20, 0),
    category: cateMap['course'],
  ),
  Task(
    title: "学生会_交稿子",
    startTime: new DateTime.utc(defaultYear, 7, 7, 8, 0),
    endTime: new DateTime.utc(defaultYear, 7, 7, 10, 0),
    category: cateMap['collective'],
  ),
  Task(
    title: "大班会",
    startTime: new DateTime.utc(defaultYear, 7, 7, 10, 0),
    endTime: new DateTime.utc(defaultYear, 7, 7, 12, 0),
    category: cateMap['meeting'],
  ),
  Task(
    title: "数学分析作业",
    startTime: new DateTime.utc(defaultYear, 7, 7, 12, 0),
    endTime: new DateTime.utc(defaultYear, 7, 7, 14, 0),
    category: cateMap['course'],
  ),
  Task(
    title: "团日感想",
    startTime: new DateTime.utc(defaultYear, 7, 7, 16, 0),
    endTime: new DateTime.utc(defaultYear, 7, 7, 18, 0),
    category: cateMap['collective'],
  ),
  Task(
    title: "艺术团选拔",
    startTime: new DateTime.utc(defaultYear, 7, 7, 10, 0),
    endTime: new DateTime.utc(defaultYear, 7, 7, 12, 0),
    category: cateMap['collective'],
  ),
  Task(
    title: "物理竞赛",
    startTime: new DateTime.utc(defaultYear, 7, 8, 12, 0),
    endTime: new DateTime.utc(defaultYear, 7, 8, 14, 0),
    category: cateMap['contest'],
  ),
  Task(
    title: "Lab4课下作业",
    startTime: new DateTime.utc(defaultYear, 7, 8, 14, 0),
    endTime: new DateTime.utc(defaultYear, 7, 8, 16, 0),
    category: cateMap['course'],
  ),
  Task(
    title: "看演唱会",
    startTime: new DateTime.utc(defaultYear, 7, 8, 20, 0),
    endTime: new DateTime.utc(defaultYear, 7, 8, 22, 0),
    category: cateMap['dailylife'],
  ),
];

