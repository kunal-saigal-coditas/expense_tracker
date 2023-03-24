import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = int.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount < 0) {
      return;
    }

    widget.addTx(
      titleController.text,
      int.parse(amountController.text),
    );

    Navigator.of(context).pop();
  }

  bool changes = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            InkWell(
              onTap: () {
                setState(() {
                  changes = true;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                padding: EdgeInsets.all(10),
                // padding: EdgeInsets.all(changes ? 50 : 10),
                child: Text(
                  "Click Me",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: titleController,
              onSubmitted: (_) => submitData(),
              // onChanged: (val) => titleInput = val,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
              // onChanged: (val) => amountInput = val,
            ),
            TextButton(
              onPressed: submitData,
              child: Text("Add Transaction"),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(
                  Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
