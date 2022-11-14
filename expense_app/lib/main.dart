import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/new_tx.dart';
import 'package:flutter_complete_guide/widgets/tx_list.dart';

import './widgets/new_tx.dart';
import './widgets/tx_list.dart';
import './models/transaction.dart';
import './widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses App',
      home: MyHomePage(),
      theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.amber,
          errorColor: Colors.red,
          textTheme: TextTheme(
            titleMedium: TextStyle(fontFamily: 'QuickSand', fontSize: 18, fontWeight: FontWeight.bold),
            titleSmall: TextStyle(fontFamily: 'QuickSand', fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)
          ),
          appBarTheme: AppBarTheme(textTheme: ThemeData.light().textTheme)
              .copyWith(
                  titleTextStyle:
                      TextStyle(fontFamily: 'OpenSans', fontSize: 20, fontWeight: FontWeight.w900))),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final List<Transaction> _userTransactions = [
    // Transaction(
    //     id: 't1', title: 'New Shoes', amount: 1000, date: DateTime.now()),
    // Transaction(
    //     id: 't2', title: 'New Earphones', amount: 500, date: DateTime.now())
  ];

  List<Transaction> get _recentTransactions{
    return _userTransactions.where((tx){
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNewTransaction(String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: chosenDate);
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startNewTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return GestureDetector(
          child: NewTransaction(_addNewTransaction),
          onTap: () {},
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx){
        return tx.id==id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
        actions: <Widget>[
          IconButton(
            onPressed: () => _startNewTransaction(context),
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Chart(_recentTransactions),
          TransactionList(_userTransactions,_deleteTransaction),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startNewTransaction(context),
      ),
    );
  }
}
