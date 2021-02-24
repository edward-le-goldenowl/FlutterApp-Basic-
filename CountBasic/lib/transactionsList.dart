import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'transaction.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionsList({
    this.transactions,
  });

  ListView _buildListView() {
    return ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: (index - 1) % 2 == 0 ? Colors.red : Colors.pink,
            elevation: 10,
            child: ListTile(
              leading: const Icon(Icons.access_alarm),
              title: Text(
                transactions[index].content,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                'Price: ${transactions[index].amount}',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              onTap: () {
                print('You clicked ${transactions[index].content}');
              },
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 400,
      child: _buildListView(),
    );
  }
}
