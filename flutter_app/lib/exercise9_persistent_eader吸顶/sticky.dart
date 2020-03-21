import 'package:flutter/material.dart';

class StickyDemo extends StatefulWidget {
  @override
  _StickyDemoState createState() => _StickyDemoState();
}

class _StickyDemoState extends State<StickyDemo>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            elevation: 0,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Sliver-sticky效果'),
              background: Image.network(
                'http://img1.mukewang.com/5c18cf540001ac8206000338.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPersistentHeader(
              pinned: true,
              delegate: StickyTabBarDelegate(
                  child: TabBar(
                labelColor: Colors.black,
                controller: this.tabController,
                tabs: <Widget>[
                  Tab(text: 'Home'),
                  Tab(text: 'Profile'),
                ],
              ))),
          SliverFillRemaining(
            child: TabBarView(
              controller: this.tabController,
              children: <Widget>[
                Center(child: Text('Content of Home')),
                Center(child: Text('Content of Profile')),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;

  StickyTabBarDelegate({@required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return this.child;
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => this.child.preferredSize.height;

  @override
  // TODO: implement minExtent
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return true;
  }
}
