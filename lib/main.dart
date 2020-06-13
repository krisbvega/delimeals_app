import 'package:delimealsapp/dummy-data.dart';
import 'package:delimealsapp/models/meals_model.dart';
import 'package:delimealsapp/views/categories_meal_view.dart';
import 'package:delimealsapp/views/filters_view.dart';
import 'package:delimealsapp/views/tabs_view.dart';
import 'package:flutter/material.dart';
import 'package:delimealsapp/views/meal_details_view.dart';
import 'package:delimealsapp/views/categories_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deli Meal App',
      theme: ThemeData(
        primaryColor: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold),
            ),
        appBarTheme: ThemeData.light().appBarTheme.copyWith(
              textTheme: ThemeData.light().textTheme.copyWith(
                    headline6: TextStyle(
                        color: Colors.lime,
                        fontSize: 26,
                        fontFamily: 'RobotoCondensed',
                        fontWeight: FontWeight.bold),
                  ),
            ),
      ),
      home: TabsView(
        appBarTitle: 'Deli Meals',
      ),
      initialRoute: CategoriesView.id,
      routes: {
        CategoriesMealView.id: (context) =>
            CategoriesMealView(availableMeals: this._availableMeals),
        MealDetailsView.id: (context) => MealDetailsView(),
        FiltersView.id: (context) => FiltersView(
            filterMethod: this._setFilters, currentFilters: this._filters),
      },
    );
  }
}
