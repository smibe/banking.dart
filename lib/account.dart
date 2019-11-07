library banking;

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

@immutable
class Transaction{
  final double amount;
  final DateTime date;
  Transaction(this.date, this.amount);
}

class Account {
  double balance = 0;
  var transactions = List<Transaction>();
  var now = () => DateTime.now();

  Account();
  Account.forTesting(DateTime Function() now) : this.now = now;

  void deposit(double amount) {
   transactions.add(Transaction(now(), amount)); 
   balance += amount;
  }

  void withdraw(double amount) {
    transactions.add(Transaction(now(), -amount));
    balance -= amount;
  }

  void printStatements(void Function(String) output) {
    output("Date\tAmount\tBalance");
    var balance = 0.0;
    for(var t in transactions) {
      balance += t.amount;
      output("${DateFormat('d.MM.y').format(t.date)}\t${t.amount.truncate()}\t${balance.truncate()}");
    }
  }
}
