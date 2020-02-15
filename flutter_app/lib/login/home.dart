import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'package:flutter_app/login/supplemental/asymmetric_view.dart';
import 'package:intl/intl.dart';

import 'model/products_repository.dart';
import 'model/product.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      // TODO: Add app bar (102)
      appBar: AppBar(
        //为 AppBar 的 leading 字段设置一个 IconButton 。
        // （需要将其放在 title 字段前面，因为它们遵循从头至尾 leading-to-trailing 的先后顺序）
        leading: IconButton(
            icon: Icon(
              Icons.menu,
              semanticLabel: 'menu',
            ),
            onPressed: () {
              print('Menu button');
            }),

        //TODO: Add buttons and title (102)
        title: Text('SHRINE'),

        //添加 actions

        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                semanticLabel: 'search',
              ),
              onPressed: () {
                print('Search button');
              }),
          //对于 Icon 类，SemanticLabel
          // 通常用于添加无障碍信息
          IconButton(
              icon: Icon(
                Icons.tune,
                semanticLabel: 'filter',
              ),
              onPressed: () {
                print('Filter button');
              })
        ],
      ),

      //我们来解读一下代码。GridView 中的条目是有限的而不是无穷多个，所以需要调用 count()。但还要一些信息来定义其布局。
      //
      //crossAxisCount：指定每横行展示多少条目。这里我们想要两列。

      //padding： 给 GridView 的四周都增加了空间。
      // 当然你目前还看不到 GridView 尾部或底部新增加的空间，因为还没有足够多的子 view 被添加进来。
      //childAspectRatio： 以宽高比（宽除以高）的形式定义了条目的大小。
      //GridView 里每个条目的大小默认都是一样的。
      //总的来说， GridView 以如下方式计算各个子项的宽度：([width of the entire grid] - [left padding] - [right padding]) / number of columns。代入我们已有的值，得到：([width of the entire grid] - 16 - 16) / 2 。
      //
      //基于宽度、宽高比计算出高度：([width of the entire grid] - 16 - 16) / 2 * 9 / 8 。因为是先得到宽之后再计算高，所以我们把 8 和 9 除法关系颠倒了一下。
      body: AsymmetricView(products: ProductsRepository.loadProducts(Category.all)),

      /*GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        childAspectRatio: 8.0 / 9.0,
        children: _buildGridCards(context),

        *//*<Widget>[final NumberFormat formatter = NumberFormat.simpleCurrency(
      locale: Localizations.localeOf(context).toString());
          Card(
            //这段代码添加了一个 Column widget ，使子项可以垂直排列。
            //
            //crossAxisAlignment 字段设为了 CrossAxisAlignment.start ，意思是"将文本向头部对齐"。
            //
            //图片形状由 AspectRatio 决定，而不是提供的图片本身的形状。
            //
            //Padding 则使得文本从边缘向中间移动一点。
            //
            //两个 Text widgets 上下放置，用 SizedBox 来表示它们之间有 8 points 的距离。
            // 我们在 Padding 之中创建了一个 Column 来放置它们。

            //在预览里，你会看到这张卡片被靠边放置，它带有圆角、阴影（表现出卡片的 elevation ）。
            // 这种外形在 Material 里叫 "container"
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 18.0 / 11.0,
                  child: Image.asset('assets/diamond.png'),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Title'),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text('Secondary Text')
                    ],
                  ),
                )
              ],
            ),
          )
        ],*//*
      ),*/
    );
  }

  List<Card> _buildGridCards(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(Category.all);
    if (products == null || products.isEmpty) {
      return const <Card>[];
    }
    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return products.map((product) {
      // TODO: Adjust card heights (103)
      return Card(
        child: Column(
          // TODO: Center items on the card (103)
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18 / 11,
              //产品数据展示出来了，但是图片周围有多余的空间。图片是由 BoxFit 进行绘制的，
              // （在这个案例中）默认是 .scaleDown 模式。我们把它改为 .fitWidth 以让图片填充，
              // 去掉多出的空白。
              child: Image.asset(
                product.assetName,
                package: product.assetPackage,
                // TODO: Adjust the box size (102)
                fit: BoxFit.fitWidth,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(
                  // TODO: Align labels to the bottom and center (103)
                 // crossAxisAlignment: CrossAxisAlignment.start,

                  //居中
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // TODO: Change innermost Column (103)
                  children: <Widget>[
                    // TODO: Handle overflowing labels (103)
                    Text(
                      product == null ? '' : product.name,
                      style: theme.textTheme.button,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      maxLines: 1,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      product == null ? '' : formatter.format(product.price),
                      style: theme.textTheme.caption,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }).toList();
  }

  List<Card> _buildGridCards1(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(Category.all);
    if (products == null || products.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return products.map((product) {
      return Card(
        //在 home.dart 文件中，为 Cards 添加 elevations: 值
        elevation: 0.0,
        // TODO: Adjust card heights (103)
        child: Column(
          // TODO: Center items on the card (103)
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18 / 11,
              child: Image.asset(
                product.assetName,
                package: product.assetPackage,
                // TODO: Adjust the box size (102)
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(
                  // TODO: Align labels to the bottom and center (103)
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // TODO: Change innermost Column (103)
                  children: <Widget>[
                    // TODO: Handle overflowing labels (103)
                    Text(
                      product.name,
                      style: theme.textTheme.title,
                      maxLines: 1,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      formatter.format(product.price),
                      style: theme.textTheme.body2,
                    ),
                  ],


                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }
}
