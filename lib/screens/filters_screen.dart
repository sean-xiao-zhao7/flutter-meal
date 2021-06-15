import 'package:flutter/material.dart';
import 'package:meal/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function setFilters;
  final Map<String, bool> _filters;

  FiltersScreen(this._filters, this.setFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _gluten;
  bool _crunchy_water;
  bool _red_ring_of_death;
  bool _milk;

  @override
  initState() {
    _gluten = widget._filters['gluten'];
    _milk = widget._filters['milk'];
    _crunchy_water = widget._filters['crunchy water'];
    _red_ring_of_death = widget._filters['red ring of death'];

    super.initState();
  }

  Widget buildSwitchListTile(
      String title, String subTitle, bool value, Function onChanged) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      subtitle: Text(subTitle),
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Filters'), actions: <Widget>[
        IconButton(
          icon: Icon(Icons.save),
          onPressed: () {
            widget.setFilters({
              'gluten': _gluten,
              'milk': _milk,
              'crunchy water': _crunchy_water,
              'red ring of death': _red_ring_of_death,
            });
          },
        )
      ]),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                buildSwitchListTile('Bacon', 'Bacon only.', _gluten, (nv) {
                  setState(() {
                    _gluten = nv;
                  });
                }),
                buildSwitchListTile(
                    'Crunchy water', 'Keep the meal pure.', _crunchy_water,
                    (nv) {
                  setState(() {
                    _crunchy_water = nv;
                  });
                }),
                buildSwitchListTile(
                    'Red ring of deatch',
                    'Don\'t mess with the red rings.',
                    _red_ring_of_death, (nv) {
                  setState(() {
                    _red_ring_of_death = nv;
                  });
                }),
                buildSwitchListTile('Milk', 'Got milk?', _milk, (nv) {
                  setState(() {
                    _milk = nv;
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
