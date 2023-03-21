import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tracker Your Expenses",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transaction = [
    Transaction(
      id: "t1",
      title: "Sneakers",
      amount: 1500,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t1",
      title: "Groceries",
      amount: 500,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              child: Container(
                child: Text("Chart"),
                color: Colors.blueAccent,
                width: 100,
              ),
              elevation: 5,
            ),
          ),
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  TextField(decoration: InputDecoration(labelText: "Title")),
                  TextField(decoration: InputDecoration(labelText: "Amount")),
                  TextButton(
                    onPressed: () {},
                    child: Text("Add Transaction"),
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.purple),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: transaction.map((tx) {
              return Card(
                child: Row(children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Text("${tx.amount.toString()} /- Rs.",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.purple,
                        )),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        tx.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        DateFormat.yMMMMd().format(tx.date),
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  )
                ]),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
