import 'package:flutter/material.dart';

class Drawers extends StatelessWidget {
  final Function handler;
  const Drawers({Key key, this.handler}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Card(
            child: Container(
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  "No Options Available 1.",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              color: Theme.of(context).primaryColor,
              padding: EdgeInsets.all(10),
            ),
          ),
          Card(
            child: Container(
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  "No Options Available 2.",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              color: Theme.of(context).primaryColor,
              padding: EdgeInsets.all(10),
            ),
          ),
          Card(
            child: Container(
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  "No Options Available 3.",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              color: Theme.of(context).primaryColor,
              padding: EdgeInsets.all(10),
            ),
          ),
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => handler(context),
          ),
        ],
      ),
    );
  }
}
