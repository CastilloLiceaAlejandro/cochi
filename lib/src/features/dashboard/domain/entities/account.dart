import 'package:flutter/foundation.dart';

enum AccountType { debit, credit, cash, savings }

enum AccountStatus { active, archived, hidden }

@immutable
class Account {
  const Account({
    required this.id,
    required this.name,
    required this.type,
    required this.balance,
    required this.colorValue,
    this.bank,
    this.number,
    this.isPrimary = false,
    this.status = AccountStatus.active,
    this.creditLimit,
    this.updatedAt,
  });

  final String id;
  final String name;
  final AccountType type;
  final double balance;
  final int colorValue;
  final String? bank;
  final String? number;
  final bool isPrimary;
  final AccountStatus status;
  final double? creditLimit;
  final DateTime? updatedAt;
}
