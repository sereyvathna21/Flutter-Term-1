class InvalidAmountException implements Exception {
  final String message;
  InvalidAmountException(this.message);

  @override
  String toString() => 'InvalidAmountException: $message';
}

class InsufficientFundsException implements Exception {
  final String message;
  InsufficientFundsException(this.message);

  @override
  String toString() => 'InsufficientFundsException: $message';
}

class AccountAlreadyExistsException implements Exception {
  final String message;
  AccountAlreadyExistsException(this.message);

  @override
  String toString() => 'AccountAlreadyExistsException: $message';
}

class BankAccount {
  final int accountId;
  final String accountOwner;
  double _balance = 0.0;

  BankAccount(this.accountId, this.accountOwner) {
    if (accountOwner.isEmpty) {
      throw InvalidAmountException('Account owner cannot be an empty string!');
    }
  }

  double get balance => _balance;

  void credit(double amount) {
    if (amount <= 0) {
      throw InvalidAmountException('Credit amount must be positive!');
    }
    _balance += amount;
  }

  void withdraw(double amount) {
    if (amount <= 0) {
      throw InvalidAmountException('Withdrawal amount must be positive!');
    }
    if (amount > _balance) {
      throw InsufficientFundsException('Insufficient balance for withdrawal!');
    }
    _balance -= amount;
  }
}

class Bank {
  final String name;
  final Map<int, BankAccount> _accounts = {};

  Bank({required this.name});

  BankAccount createAccount(int accountId, String accountOwner) {
    if (_accounts.containsKey(accountId)) {
      throw AccountAlreadyExistsException(
          'Account with ID $accountId already exists!');
    }

    var newAccount = BankAccount(accountId, accountOwner);
    _accounts[accountId] = newAccount;
    return newAccount;
  }

  BankAccount getAccount(int accountId) {
    if (!_accounts.containsKey(accountId)) {
      throw InvalidAmountException(
          'Account with ID $accountId does not exist!');
    }
    return _accounts[accountId]!;
  }

  void listAccounts() {
    if (_accounts.isEmpty) {
      print('No accounts found in $name.');
    } else {
      _accounts.forEach((id, account) {
        print(
            'Account ID: $id, Owner: ${account.accountOwner}, Balance: \$${account.balance}');
      });
    }
  }
}

void main() {
  Bank myBank = Bank(name: "CADT Bank");

  BankAccount Account = myBank.createAccount(01, 'Vathna');
  print('Initial Balance: \$${Account.balance}');
  Account.credit(100);
  print('After Credit, Balance: \$${Account.balance}');
  Account.withdraw(20);
  print('After Withdrawal, Balance: \$${Account.balance}');

  try {
    myBank.createAccount(02, 'Sokhom');
  } catch (e) {
    print('Error: $e');
  }

  myBank.listAccounts();
}
