import 'package:flutter/material.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';
import '../models/trasaction.dart';

class TransactionUser extends StatefulWidget {
  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _trasctions = [
    Transaction(
      id: 't1',
      title: 'Novo tenis de corrida',
      value: 310.76,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de luz',
      value: 211.30,
      date: DateTime.now(),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(_trasctions),
        TransactionForm(),
      ],
    );
  }
}
