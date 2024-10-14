import 'package:flutter/material.dart';

class ItemSelecter extends StatefulWidget {
  const ItemSelecter({super.key});

  @override
  State<ItemSelecter> createState() => _ItemSelecterState();
}

class _ItemSelecterState extends State<ItemSelecter>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  Widget build(BuildContext context) {
    _tabController = TabController(length: 3, vsync: this);

    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(icon: Icon(Icons.cloud_outlined)),
            Tab(icon: Icon(Icons.beach_access_sharp)),
            Tab(icon: Icon(Icons.brightness_5_sharp)),
          ],
        ),
        Expanded(
          flex: 1,
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              _gridView(),
              _gridView(),
              _gridView(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _gridView() {
    return GridView.count(crossAxisCount: 4, children: [
      Container(
        color: Colors.black,
      ),
      Container(
        color: Colors.blue,
      ),
      Container(
        color: Colors.red,
      ),
      Container(
        color: Colors.green,
      ),
      Container(
        color: Colors.yellow,
      ),
      Container(
        color: Colors.purple,
      ),
    ]);
  }
}
