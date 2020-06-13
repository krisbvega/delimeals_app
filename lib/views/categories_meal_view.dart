import 'package:delimealsapp/models/meals_model.dart';
import 'package:flutter/material.dart';
import 'package:delimealsapp/dummy-data.dart';
import 'package:delimealsapp/widgets/meal_listview_item.dart';

class CategoriesMealView extends StatefulWidget {
  static const id = 'CategoriesMealView';

  final List<Meal> availableMeals;

  CategoriesMealView({this.availableMeals});

  @override
  _CategoriesMealViewState createState() => _CategoriesMealViewState();
}

class _CategoriesMealViewState extends State<CategoriesMealView> {
  String title = '', id = '';
  List<Meal> filteredMeals;
  bool _initDataLoaded = false;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    if (!_initDataLoaded) {
      final Map arguments = ModalRoute.of(context).settings.arguments as Map;

      if (arguments != null) {
        id = arguments['id'];
        title = arguments['title'];
      }

//      filteredMeals = DUMMY_MEALS.where((element) {
//        return element.categories.contains(id);
//      }).toList();

      filteredMeals = widget.availableMeals.where((element) {
        return element.categories.contains(id);
      }).toList();

      _initDataLoaded = true;
    }
  }

  void _deleteMeal(String id) {
    setState(() {
      filteredMeals.removeWhere((element) {
        return element.mealID.contains(id);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$title Meals'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final item = filteredMeals[index];

          return MealListViewItem(
            mealID: item.mealID,
            imageUrl: item.imageUrl,
            mealTitle: item.title,
            preparationTime: item.preparationTime,
            complexity: item.complexity,
            affordability: item.affordability,
            deleteMealMethod: this._deleteMeal,
          );
        },
        itemCount: filteredMeals.length,
      ),
    );
  }
}
