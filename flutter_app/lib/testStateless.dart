import 'package:english_words/english_words.dart' as prefix0;
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';


//一个 State 类，StatefulWidget 类本身是不变的，但是 State 类在 widget 生命周期中始终存在。
class RandomWordsState extends State<RandomWords> {
  @override                                  // 新增代码片段 - 开始 ...
  Widget build(BuildContext context) {
    final WordPair wordPair = new WordPair.random();
    return new Text(wordPair.asPascalCase);
  }                                          // ... 新增的代码片段 - 结束
}



//Stateless widgets 是不可变的，这意味着它们的属性不能改变——所有的值都是 final。
//Stateful widgets 持有的状态可能在 widget 生命周期中发生变化，实现一个 stateful widget 至少需要两个类：1）一个 StatefulWidget 类；
// 2）一个 State 类，StatefulWidget 类本身是不变的，但是 State 类在 widget 生命周期中始终存在。
class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RandomWordsState();
  }
}


//在这一步，你将添加一个 stateful widget（有状态的控件）—— RandomWords，
// 它会创建自己的状态类 —— RandomWordsState，然后你需要将 RandomWords 内嵌到已有的无状态的 MyApp widget。

