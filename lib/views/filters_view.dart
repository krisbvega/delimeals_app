import 'package:delimealsapp/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersView extends StatefulWidget {
  static const id = 'FiltersView';

  final Function filterMethod;
  final Map<String, bool> currentFilters;

  FiltersView({this.filterMethod, this.currentFilters});

  @override
  _FiltersViewState createState() => _FiltersViewState();
}

class _FiltersViewState extends State<FiltersView> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _isVegan = false;
  bool _forVegetarian = false;

  SwitchListTile _buildSwitchTile({
    String title,
    String subtitle,
    bool valueProperty,
    Function onChanged,
  }) {
    return SwitchListTile(
      title: Text(title),
      value: valueProperty,
      subtitle: Text(subtitle),
      onChanged: onChanged,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _isVegan = widget.currentFilters['vegan'];
    _forVegetarian = widget.currentFilters['vegetarian'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter Settings'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _isVegan,
                'vegetarian': _forVegetarian
              };

              widget.filterMethod(selectedFilters);
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selections',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchTile(
                    title: 'Gluten-free',
                    subtitle: 'Include meals that are only Gluten-free.',
                    valueProperty: _glutenFree,
                    onChanged: (value) {
                      setState(() {
                        _glutenFree = value;
                      });
                    }),
                _buildSwitchTile(
                    title: 'Lactose-free',
                    subtitle: 'Include meals that are only Lactose-free.',
                    valueProperty: _lactoseFree,
                    onChanged: (value) {
                      setState(() {
                        _lactoseFree = value;
                      });
                    }),
                _buildSwitchTile(
                    title: 'Vegan',
                    subtitle: 'Include meals that are Vegan.',
                    valueProperty: _isVegan,
                    onChanged: (value) {
                      setState(() {
                        _isVegan = value;
                      });
                    }),
                _buildSwitchTile(
                    title: 'Vegetarian',
                    subtitle:
                        'Include meals that are only for Vegetarian person.',
                    valueProperty: _forVegetarian,
                    onChanged: (value) {
                      setState(() {
                        _forVegetarian = value;
                      });
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
