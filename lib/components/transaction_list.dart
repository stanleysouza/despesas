import 'package:despesas/models/trasaction.dart';
import 'package:flutter/material.dart';
import '../models/trasaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'Nenhuma Transacao cadastrada!',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                final tr = transactions[index];
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    horizontal: 1,
                    vertical: 2,
                  ),
                  child: ListTile(
                    leading: Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 1,
                          vertical: 10,
                        ),
                        child: FittedBox(
                          child: Text(
                            'R\$${tr.value}',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      tr.title,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    subtitle: Text(
                      DateFormat('d mm y').format(tr.date),
                    ),
                    trailing: Text('excluir'),
                  ),
                );
              },
            ),
    );
  }
}
