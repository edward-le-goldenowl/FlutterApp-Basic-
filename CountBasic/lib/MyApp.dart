import 'package:flutter/material.dart';
import 'transaction.dart';
import 'transactionsList.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _contentController = TextEditingController();
  final _amountController = TextEditingController();
  var focusNode = FocusNode();
  Transaction _transaction = Transaction(
    content: '',
    amount: 0.0,
  );

  List<Transaction> _listTransactions = List<Transaction>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Widget Card',
      home: Scaffold(
        key: _scaffoldKey,
        body: SafeArea(
          minimum: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextField(
                  focusNode: focusNode,
                  decoration: InputDecoration(labelText: 'Content'),
                  controller: _contentController,
                  onChanged: (text) {
                    setState(() {
                      _transaction.content = text;
                    });
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  controller: _amountController,
                  onChanged: (text) {
                    setState(() {
                      _transaction.amount = double.tryParse(text) ?? 0;
                    });
                  },
                ),
                Padding(padding: const EdgeInsets.symmetric(vertical: 10)),
                ButtonTheme(
                  height: 50,
                  child: FlatButton(
                    child: Text(
                      'Insert transaction',
                      style: const TextStyle(fontSize: 18),
                    ),
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    onPressed: () {
                      setState(() {
                        _listTransactions.add(_transaction);
                        _transaction = Transaction(
                          content: '',
                          amount: 0.0,
                        );
                        _amountController.text = '';
                        _contentController.text = '';
                      });
                      _scaffoldKey.currentState.showSnackBar(
                        SnackBar(
                          content: Text(
                              'transaction list:' + _transaction.toString()),
                          duration: Duration(seconds: 3),
                        ),
                      );
                      focusNode.requestFocus();
                    },
                  ),
                ),
                Padding(padding: const EdgeInsets.symmetric(vertical: 10)),
                TransactionsList(transactions: _listTransactions)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
