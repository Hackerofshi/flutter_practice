import 'dart:ffi';
import 'dart:math';

import 'package:english_words/english_words.dart' as prefix0;
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

/*
6. 创建一个无限滚动的 ListView
    在这一步中，您将扩展（继承）RandomWordsState 类，以生成并显示单词对列表。 当用户滚动时，
    ListView 中显示的列表将无限增长。 ListView 的 builder 工厂构造函数允许您按需建立一个懒加载的列表视图。
 */

//向 RandomWordsState 类中添加一个 _suggestions 列表以保存建议的单词对，同时，添加一个 biggerFont
// 变量来增大字体大小 Also, add a _biggerFont variable for making the font size larger.
class RandomWordsState extends State<RandomWords1> {
  // 添加如下两行  随机数对象
  final List<WordPair> _suggestions = <WordPair>[];
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

  //这个集合存储用户喜欢（收藏）的单词对。
  final Set<WordPair> _saved = new Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Startup Name Generator"),
        //某些 widget 属性需要单个 widget（child），而其它一些属性，
        // 如 action，需要一组widgets（children），用方括号 [] 表示。
        actions: <Widget>[
          new IconButton(icon: const Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  //在这一步中，您将添加一个显示收藏夹内容的新页面（在 Flutter 中称为路由［route］）。您将学习如何在主路由和新路由之间导航（切换页面）。
  //
  //在 Flutter 中，导航器管理应用程序的路由栈。将路由推入（push）到导航器的栈中，将会显示更新为该路由页面。 从导航器的栈中弹出（pop）路由，将显示返回到前一个路由。
  //
  //接下来，我们在 RandomWordsState 的 build 方法中为 AppBar 添加一个列表图标。当用户点击列表图标时，包含收藏夹的新路由页面入栈显示。

  //接下来，（当用户点击导航栏中的列表图标时）我们会建立一个路由并将其推入到导航管理器栈中。
  // 此操作会切换页面以显示新路由，新页面的内容会在 MaterialPageRoute 的 builder 属性中构建，builder 是一个匿名函数。

  //添加 Navigator.push 调用，这会使路由入栈（以后路由入栈均指推入到导航管理器的栈）

  //在新的 route（路由）页面中显示收藏的内容。
  // Navigator（导航器）会在应用栏中自动添加一个"返回"按钮，
  // 无需调用Navigator.pop，点击后退按钮就会返回到主页路由。
  void _pushSaved() {
    //接下来，添加 MaterialPageRoute 及其 builder。 现在，添加生成 ListTile 行的代码，ListTile 的 divideTiles() 方法在每个 ListTile 之间添加 1 像素的分割线。
    // 该 divided 变量持有最终的列表项，并通过 toList()方法非常方便的转换成列表显示。
    Navigator.of(context)
        .push(new MaterialPageRoute<Void>(builder: (BuildContext context) {
      final Iterable<ListTile> tiles = _saved.map((prefix0.WordPair pair) {
        return new ListTile(
          title: new Text(
            pair.asPascalCase,
            style: _biggerFont,
          ),
        );
      });
      final List<Widget> divided =
      ListTile.divideTiles(context: context, tiles: tiles).toList();

      //builder 返回一个 Scaffold，其中包含名为"Saved Suggestions"的新路由的应用栏。
      // 新路由的body 由包含 ListTiles 行的 ListView 组成；每行之间通过一个分隔线分隔。

      return new Scaffold(
        appBar: new AppBar(
          title: const Text("saved Suggestions"),
        ),
        body: new ListView(children: divided,),
      );

    }));
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        //对于每个建议的单词对都会调用一次 itemBuilder
        //然后将单词对添加到ListTitle中
        //在偶数行，该函数会为单词添加一个ListTile row.
        // 在奇数行，该函数会添加一个分割线的 widget，来分隔相邻的词对。
        // 注意，在小屏幕上，分割线看起来可能比较吃力。
        itemBuilder: (BuildContext _context, int i) {
          // 在每一列之前，添加一个1像素高的分隔线widget
          if (i.isOdd) {
            return new Divider();
          }

          // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整）
          // 比如 i 为：1, 2, 3, 4, 5 时，结果为 0, 1, 1, 2, 2，
          // 这可以计算出 ListView 中减去分隔线后的实际单词对数量

          final int index = i ~/ 2;
          // 如果是建议列表中最后一个单词对
          if (index >= _suggestions.length) {
            // ...接着再生成10个单词对，然后添加到建议列表
            // ignore: missing_return
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    //alreadySaved 来检查确保单词对还没有添加到收藏夹中。
    final bool alreadySaved = _saved.contains(pair);

    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      // 添加一个心形 ❤️图标到 ListTiles以启用收藏功能。接下来，
      // 你就可以给心形 ❤️图标添加交互能力了。
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      //为了做到这个，我们在 _buildRow 中让心形 ❤️图标变得可以点击。
      // 如果单词条目已经添加到收藏夹中， 再次点击它将其从收藏夹中删除。
      // 当心形 ❤️图标被点击时，函数调用 setState() 通知框架状态已经改变。
      onTap: () {
        // 在 Flutter 的响应式风格的框架中，
        // 调用 setState() 会为 State 对象触发 build() 方法，从而导致对 UI 的更新
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}

//Stateless widgets 是不可变的，这意味着它们的属性不能改变——所有的值都是 final。
//Stateful widgets 持有的状态可能在 widget 生命周期中发生变化，实现一个 stateful widget 至少需要两个类：1）一个 StatefulWidget 类；
// 2）一个 State 类，StatefulWidget 类本身是不变的，但是 State 类在 widget 生命周期中始终存在。
class RandomWords1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RandomWordsState();
  }
}

//在这一步，你将添加一个 stateful widget（有状态的控件）—— RandomWords，
// 它会创建自己的状态类 —— RandomWordsState，然后你需要将 RandomWords 内嵌到已有的无状态的 MyApp widget。
