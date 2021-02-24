import 'package:flutter/material.dart';

class Transaction {
  String content;
  double amount;
  Transaction({this.content, this.amount});

  @override
  String toString() {
    // TODO: implement toString
    return 'Content: $content, Amount: $amount';
  }
}
