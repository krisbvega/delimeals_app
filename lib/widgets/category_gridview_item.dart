import 'package:delimealsapp/views/categories_meal_view.dart';
import 'package:flutter/material.dart';

const kBoxShadow = <BoxShadow>[
  BoxShadow(
    offset: Offset(5.0, 8.0),
    blurRadius: 10.0,
    color: Colors.grey,
  ),
  BoxShadow(
    offset: Offset(5.0, 8.0),
    blurRadius: 20.0,
    color: Colors.grey,
  ),
];

class CategoryGridViewItem extends StatelessWidget {
  final String categoryID;
  final String title;
  final Color color;

  CategoryGridViewItem({this.categoryID, this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, CategoriesMealView.id,
            arguments: {'id': categoryID, 'title': title});
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(80),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
//          boxShadow: kBoxShadow,
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
