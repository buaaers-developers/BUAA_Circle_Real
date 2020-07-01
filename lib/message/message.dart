import 'package:buaacircle/category/category.dart';
import 'package:flutter/material.dart';

class Message {
  final String content;
  final String groupName;
  final Category category;

  const Message({this.groupName, this.category, this.content});
}

List<Message> messages = [
  Message(
    groupName: "2006大班圈",
    category: cateMap['course'],
    content: "2020年第17届全国大学生安全与对抗技术竞赛，现在还可以参赛。",
  ),
  Message(
    groupName: "2000大班圈",
    category: cateMap['contest'],
    content: "补考通知已下发，学院补考安排另行通知。课程（2002大班圈）",
  ),
  Message(
    groupName: "北航舞蹈团圈",
    category: cateMap['collective'],
    content: "本次任务：两段已练习过的动作和音乐完成，时间：4月30日17:00，注意节奏问题",
  ),
  Message(
    groupName: "2007班委圈",
    category: cateMap['studentWork'],
    content: "各班班委于明日参加“青春在战疫中绽放”主题宣讲活动",
  ),
  Message(
    groupName: "2021大班圈",
    category: cateMap['levy'],
    content: " 2020征集新兵时间调整。",
  ),
  Message(
    groupName: "李XX老师理力课程圈",
    category: cateMap['course'],
    content: "大学物理-力学课程通知和相关注意事项。",
  ),
  Message(
    groupName: "2008大班圈",
    category: cateMap['meeting'],
    content: "请同学网上主题报告会：时间：5月12日上午10：00收看平台：津云新媒体直播平台们",
  ),
  Message(
    groupName: "203721小班圈",
    category: cateMap['collective'],
    content: "本学期每周三下午将组织进行专题学习日。",
  ),
];
