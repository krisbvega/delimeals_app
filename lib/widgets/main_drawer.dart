import 'package:delimealsapp/views/filters_view.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).accentColor.withOpacity(.5),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 120,
                width: double.infinity,
                alignment: Alignment.centerLeft,
                color: Theme.of(context).accentColor,
                padding: EdgeInsets.all(20),
                child: Text(
                  'Cooking Time!',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              buildListTile(
                title: 'Meals',
                iconData: Icons.restaurant,
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/');
                },
              ),
              buildListTile(
                title: 'Filters',
                iconData: Icons.settings,
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(FiltersView.id);
                },
              ),
              Expanded(
                child: Container(),
              ),
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                child: Text(
                  '(c) 2020 KAT-V Solutions Inc.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    fontFamily: 'Raleway',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListTile buildListTile({String title, IconData iconData, Function onTap}) {
    return ListTile(
      leading: Icon(
        iconData,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }
}
