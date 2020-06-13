import 'package:delimealsapp/views/meal_details_view.dart';
import 'package:flutter/material.dart';
import 'package:delimealsapp/models/meals_model.dart';

class MealListViewItem extends StatelessWidget {
  final String mealID;
  final String imageUrl;
  final String mealTitle;
  final int preparationTime;
  final Complexity complexity;
  final Affordability affordability;
  final Function deleteMealMethod;

  MealListViewItem(
      {this.mealID,
      this.imageUrl,
      this.mealTitle,
      this.preparationTime,
      this.complexity,
      this.affordability,
      this.deleteMealMethod});

  String get complexityValue {
    switch (complexity) {
      case Complexity.Simple:
        return 'Easy';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Difficult';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityValue {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Expensive:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Expensive';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, MealDetailsView.id,
            arguments: {'id': mealID}).then((value) {
          if (value != null) {
            deleteMealMethod(value);
          }
        });
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              overflow: Overflow.clip,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 25,
                    ),
                    width: 300,
                    color: Colors.black45,
                    child: Text(
                      mealTitle,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.schedule,
                        color: Colors.blueGrey,
                      ),
                      Text(
                        ' $preparationTime min.',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.work,
                        color: Colors.red,
                      ),
                      Text(
                        ' $complexityValue',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.attach_money,
                        color: Colors.green,
                      ),
                      Text(
                        ' $affordabilityValue',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
