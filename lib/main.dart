import 'package:flutter/material.dart';
import './widgets/new_Transaction.dart';
import './widgets/transactionList.dart';
import './models/transaction.dart';
import './widgets/menu.dart';
import './widgets/chart.dart';

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(titleMedium: TextStyle(color: Colors.black)),
        primarySwatch: Colors.deepPurple,
        fontFamily: 'Quicksand',
        primaryTextTheme: ThemeData.light().textTheme.copyWith(
            titleMedium: TextStyle(
              fontFamily: "OpenSans",
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            labelLarge: TextStyle(color: Colors.white)),
        appBarTheme: AppBarTheme(
          toolbarTextStyle: ThemeData.dark()
              .textTheme
              .copyWith(
                titleMedium: TextStyle(fontFamily: 'OpenSans', fontSize: 20),
              )
              .bodyMedium,
          titleTextStyle: ThemeData.dark()
              .textTheme
              .copyWith(
                titleMedium: TextStyle(fontFamily: 'OpenSans', fontSize: 20),
              )
              .titleLarge,
        ),
      ),
      // debugShowCheckedModeBanner: false,
      title: "Tracker Your Expenses",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransaction = [];

  bool _showChart = false;

  List<Transaction> get _recentTransaction {
    return _userTransaction
        .where((element) =>
            element.date.isAfter(DateTime.now().subtract(Duration(days: 7))))
        .toList();
  }

  void _addNewTransaction(String txTitle, int txAmount, DateTime chosenDate) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: chosenDate,
    );

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  void _deleteTransaction(String id) {
    setState(
      () {
        _userTransaction.removeWhere((ele) => ele.id == id);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final appBar = AppBar(
      title: Text("Expense Tracker"),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () => _startAddNewTransaction(context),
        ),
      ],
    );

    final txListWidget = Container(
      height: (MediaQuery.of(context).size.height -
              appBar.preferredSize.height -
              MediaQuery.of(context).padding.top) *
          0.7,
      child: TransactionList(_userTransaction, _deleteTransaction),
    );

    return Scaffold(
      appBar: appBar,
      drawer: Drawers(
        handler: _startAddNewTransaction,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            if (isLandscape)
              Container(
                padding: EdgeInsets.all(6),
                child: Row(
                  children: [
                    Text("Show Chart"),
                    Switch(
                      value: _showChart,
                      onChanged: (val) {
                        setState(
                          () {
                            _showChart = val;
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            if (!isLandscape)
              Container(
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.3,
                child: Chart(_recentTransaction),
              ),
            if (!isLandscape) txListWidget,
            if (isLandscape)
              _showChart
                  ? Container(
                      height: (MediaQuery.of(context).size.height -
                              appBar.preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          0.7,
                      child: Chart(_recentTransaction),
                    )
                  : txListWidget,
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
