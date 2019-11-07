import 'package:flutter_test/flutter_test.dart';

import 'package:banking/account.dart';

void main() {
  test('initial account has balance == 0', () {
    final account = Account();
    expect(0, account.balance);
  });
}
