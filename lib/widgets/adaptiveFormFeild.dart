import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class AdaptiveFormFeild extends StatelessWidget {
  const AdaptiveFormFeild({Key key, this.title, this.submit, this.amount});

  final TextEditingController title;
  final TextEditingController amount;
  final Function submit;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Column(
            children: [
              CupertinoTextField(
                placeholder: "Title",
                controller: title,
                onSubmitted: (_) => submit,
              ),
              SizedBox(
                height: 10,
              ),
              CupertinoTextField(
                placeholder: "Amount",
                controller: amount,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submit,
              ),
            ],
          )
        : Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: "Title"),
                controller: title,
                onSubmitted: (_) => submit,
                // onChanged: (val) => titleInput = val,
              ),
              TextField(
                decoration: InputDecoration(labelText: "Amount"),
                controller: amount,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submit,
                // onChanged: (val) => amountInput = val,
              )
            ],
          );
  }
}
