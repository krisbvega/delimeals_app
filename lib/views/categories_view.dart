import 'package:flutter/material.dart';
import 'package:delimealsapp/dummy-data.dart';
import 'package:delimealsapp/widgets/category_gridview_item.dart';

class CategoriesView extends StatelessWidget {
  static const id = 'categories';

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      children: <Widget>[
        ...DUMMY_CATEGORIES
            .map(
              (catData) => CategoryGridViewItem(
                categoryID: catData.id,
                title: catData.title,
                color: catData.color,
              ),
            )
            .toList()
      ],
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
    );
  }
}
