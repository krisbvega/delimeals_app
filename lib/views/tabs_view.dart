import 'package:delimealsapp/views/categories_view.dart';
import 'package:delimealsapp/views/favorite_meals_view.dart';
import 'package:delimealsapp/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class TabsView extends StatefulWidget {
  final String appBarTitle;

  TabsView({this.appBarTitle});

  @override
  _TabsViewState createState() => _TabsViewState();
}

class _TabsViewState extends State<TabsView> {
  final List<Map<String, Object>> tabPages = [
    {
      'page': CategoriesView(),
      'title': 'Categories',
    },
    {
      'page': FavoriteMealsView(),
      'title': 'My Favorites',
    }
  ];

  int selectedTabPageIndex = 0;

  void _selectedTabPageIndexChanged(int index) {
    setState(() {
      selectedTabPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '${widget.appBarTitle}: ${tabPages[selectedTabPageIndex]['title']}'),
      ),
      drawer: MainDrawer(),
      body: tabPages[selectedTabPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedTabPageIndexChanged,
        type: BottomNavigationBarType.shifting,
        showUnselectedLabels: true,
        iconSize: 32,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: selectedTabPageIndex,
        unselectedFontSize: 18,
        selectedFontSize: 20,
        unselectedLabelStyle: TextStyle(
          fontFamily: 'RobotoCondensed',
        ),
        selectedLabelStyle: TextStyle(
            fontFamily: 'RobotoCondensed', fontWeight: FontWeight.bold),
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.category,
            ),
            title: Text(
              'Categories',
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.star,
            ),
            title: Text(
              'Favorites',
            ),
          ),
        ],
      ),
    );

//    return DefaultTabController(
//      length: 2,
//      child: Scaffold(
//        appBar: AppBar(
//          title: Text(widget.appBarTitle),
//          bottom: TabBar(
//            labelStyle: TextStyle(
//              fontFamily: 'RobotoCondensed',
//              fontSize: 20,
//              fontWeight: FontWeight.bold,
//            ),
//            tabs: <Widget>[
//              Tab(
//                icon: Icon(
//                  Icons.category,
//                  color: Colors.lime,
//                ),
//                text: 'Categories',
//              ),
//              Tab(
//                icon: Icon(
//                  Icons.star,
//                  color: Colors.lime,
//                ),
//                text: 'Favorites',
//              )
//            ],
//          ),
//        ),
//        body: TabBarView(
//          children: <Widget>[
//            CategoriesView(),
//            FavoriteMealsView(),
//          ],
//        ),
//      ),
//    );
  }
}
