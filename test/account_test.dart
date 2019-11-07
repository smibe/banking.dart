import 'package:flutter_test/flutter_test.dart';

import 'package:banking/account.dart';

void main() {
  var account = Account();

  setUp((){
    account = Account();
  });

  test('initial account has balance == 0', () {
    expect(0, account.balance);
  });

  test('deposit amount increases balance', () {
    account.deposit(1000);
    expect(1000, account.balance);
  });
  test('withdraw amount decreases balance', () {
    account.deposit(1000);
    account.withdraw(500);
    expect(500, account.balance);
  });

  test ('print the header', (){
    var statements = List<String>();
    account.printStatements((s) => statements.add(s));
    expect(["Date\tAmount\tBalance"], statements);
  });
  
  test ('print deposit and withdrawal', (){
    account.deposit(1000);
    account.withdraw(500);
    var statements = List<String>();
    account.printStatements((s) => statements.add(s));
    expect(statements, ["Date\tAmount\tBalance", "date\t1000\t1000", "date\t-500\t500"]);
  });
}
