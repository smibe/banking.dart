library banking;

class Account {
  double balance = 0;
  var transactions = List<double>();

  void deposit(double amount) {
   transactions.add(amount); 
   balance += amount;
  }

  void withdraw(double amount) {
    transactions.add(-amount);
    balance -= amount;
  }

  void printStatements(void Function(String) output) {
    output("Date\tAmount\tBalance");
    var balance = 0.0;
    for(var t in transactions) {
      balance += t;
      output("date\t${t.truncate()}\t${balance.truncate()}");
    }
  }
}
