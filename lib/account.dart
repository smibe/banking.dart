library banking;

class Account {
  double balance = 0;

  void deposit(int amount) => balance += amount;
  void withdraw(int amount) => balance -= amount;

  void printStatements(void Function(String) output) {
    output("Date\tAmount\tBalance");
  }
}
