import 'package:flutter/material.dart';
import 'package:delimealsapp/dummy-data.dart';

class MealDetailsView extends StatelessWidget {
  static const id = 'MealDetailsView';

  Widget textHeading(String headingText) {
    return Column(
      children: <Widget>[
        Divider(
          height: 35,
          indent: 10,
          endIndent: 10,
          color: Colors.blueGrey,
        ),
        Text(
          headingText,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
            fontSize: 20,
            decoration: TextDecoration.underline,
            color: Colors.redAccent,
          ),
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;

    String id = '';
    if (arguments != null) {
      id = arguments['id'];
    }

    final filteredMeals =
        DUMMY_MEALS.firstWhere((element) => element.mealID == id);

    return Scaffold(
      appBar: AppBar(
        title: Text('${filteredMeals.title}'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete_outline),
        onPressed: () {
          Navigator.of(context).pop(id);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                filteredMeals.imageUrl,
                fit: BoxFit.fill,
              ),
            ),
            textHeading('INGREDIENTS'),
            ...filteredMeals.ingredients.map((e) {
              return Text(
                e,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                ),
              );
            }).toList(),
            textHeading('GLUTEN FREE'),
            Text(
              '${(filteredMeals.isGlutenFree ? 'YES' : 'NO')}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            textHeading('LACTOSE FREE'),
            Text(
              '${(filteredMeals.isLactoseFree ? 'YES' : 'NO')}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            textHeading('VEGAN'),
            Text(
              '${(filteredMeals.isVegan ? 'YES' : 'NO')}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            textHeading('FOR VEGETARIAN'),
            Text(
              '${(filteredMeals.isVegetarian ? 'YES' : 'NO')}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            textHeading('PROCEDURES'),
            ...filteredMeals.procedures.map((e) {
              var index = filteredMeals.procedures.indexOf(e);
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 20,
                    child: Text(
                      '${(index + 1)}',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  title: Text(
                    '$e',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              );
            }).toList(),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
