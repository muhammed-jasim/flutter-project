
import 'package:flutter/material.dart';

class Loan {
  final String title;
  final String bank;
  final String logo; // asset path or icon placeholder
  final double totalAmount;
  final double paidAmount;
  final double interestRate;
  final DateTime dueDate;
  final double nextEmiAmount;
  final Color color;

  Loan({
    required this.title,
    required this.bank,
    required this.logo,
    required this.totalAmount,
    required this.paidAmount,
    required this.interestRate,
    required this.dueDate,
    required this.nextEmiAmount,
    this.color = Colors.blue,
  });

  double get progress => paidAmount / totalAmount;
  double get remainingAmount => totalAmount - paidAmount;
}

class BillCategory {
  final String name;
  final IconData icon;
  final Color color;

  BillCategory({required this.name, required this.icon, required this.color});
}

class Transaction {
  final String title;
  final String subtitle;
  final double amount;
  final bool isSuccess;
  final DateTime date;
  final IconData icon;

  Transaction({
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.isSuccess,
    required this.date,
    required this.icon,
  });
}

final List<Loan> mockLoans = [
  Loan(
    title: 'Home Loan',
    bank: 'HDFC Bank • ***8291',
    logo: '',
    totalAmount: 4500000,
    paidAmount: 1800000,
    interestRate: 8.5,
    dueDate: DateTime.now().add(const Duration(days: 5)),
    nextEmiAmount: 32500,
    color: const Color(0xFF4A90E2),
  ),
  Loan(
    title: 'Car Loan',
    bank: 'ICICI Bank • ***4422',
    logo: '',
    totalAmount: 1200000,
    paidAmount: 800000,
    interestRate: 9.2,
    dueDate: DateTime.now().add(const Duration(days: 12)),
    nextEmiAmount: 14200,
    color: const Color(0xFFF5A623),
  ),
    Loan(
    title: 'Personal Loan',
    bank: 'Axis Bank • ***1121',
    logo: '',
    totalAmount: 500000,
    paidAmount: 100000,
    interestRate: 11.5,
    dueDate: DateTime.now().add(const Duration(days: 20)),
    nextEmiAmount: 12500,
    color: const Color(0xFFE24A4A),
  ),
];

final List<BillCategory> mockCategories = [
  BillCategory(name: 'Mobile', icon: Icons.phone_iphone, color: Colors.blue.shade100),
  BillCategory(name: 'DTH', icon: Icons.tv, color: Colors.purple.shade100),
  BillCategory(name: 'Electricity', icon: Icons.lightbulb_outline, color: Colors.yellow.shade100),
  BillCategory(name: 'Gas', icon: Icons.local_fire_department, color: Colors.orange.shade100),
  BillCategory(name: 'Internet', icon: Icons.wifi, color: Colors.cyan.shade100),
  BillCategory(name: 'Water', icon: Icons.water_drop, color: Colors.blueAccent.shade100),
  BillCategory(name: 'Insurance', icon: Icons.security, color: Colors.green.shade100),
  BillCategory(name: 'More', icon: Icons.grid_view, color: Colors.grey.shade200),
];

final List<Transaction> mockTransactions = [
  Transaction(
    title: 'HDFC Home Loan',
    subtitle: 'EMI • 10:45 AM',
    amount: -32500.0,
    isSuccess: true,
    date: DateTime.now(),
    icon: Icons.home,
  ),
  Transaction(
    title: 'Airtel Prepaid',
    subtitle: 'Recharge • 09:12 AM',
    amount: -719.0,
    isSuccess: true,
    date: DateTime.now(),
    icon: Icons.phone_android,
  ),
  Transaction(
    title: 'Electricity Bill',
    subtitle: 'Utility • Yesterday',
    amount: -2450.0,
    isSuccess: false,
    date: DateTime.now().subtract(const Duration(days: 1)),
    icon: Icons.lightbulb,
  ),
  Transaction(
    title: 'Salary Credit',
    subtitle: 'Credit • 30th Oct',
    amount: 85000.0,
    isSuccess: true,
    date: DateTime.now().subtract(const Duration(days: 2)),
    icon: Icons.account_balance_wallet,
  ),
];
