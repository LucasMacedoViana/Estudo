import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projero_desespesas/components/chart.dart';
import 'package:projero_desespesas/components/transaction_form.dart';
import 'dart:math';
import 'dart:io';
import 'components/chart.dart';
import 'components/transaction_list.dart';
import 'models/transaction.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.purple,
        fontFamily: 'Quicksand',
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [];
  bool _showChart = false;

  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date,
    );
    setState(() {
      _transactions.add(newTransaction);
    });
    Navigator.of(context).pop();
  }

  _removeTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id);
    });
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(_addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    bool isLandscap = mediaQuery.orientation == Orientation.landscape;
    final appBar = AppBar(
      title: Text(
        'Despesas Pessoais',
        style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
            fontSize: 20 * mediaQuery.textScaleFactor,
            fontWeight: FontWeight.bold),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      actions: <Widget>[
        if(isLandscap)IconButton(
          onPressed: () {
            setState(() {
              _showChart = !_showChart;
            });
          },
          icon: Icon(_showChart?
          Icons.list: Icons.show_chart,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () => _openTransactionFormModal(context),
          icon: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ],
    );

    final availableHeight = mediaQuery.size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top;

    final bodyPage = SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // if(isLandscap) Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text('Exibir grafico'),
          //     Switch.adaptive(value: _showChart, onChanged: (value){
          //       setState(() {
          //         _showChart = value;
          //       });
          //
          //     }),
          //   ],
          // ),
          if(_showChart || !isLandscap) Container(
            height: availableHeight * (isLandscap?0.7:0.30),
            child: Chart(_recentTransactions),
          ),
          if(!_showChart || !isLandscap)Container(
            height: availableHeight * (isLandscap?1:0.7),
            child: TransactionList(
              _transactions,
              _removeTransaction,
            ),
          ),
        ],
      ),
    );

    return Platform.isIOS ? CupertinoPageScaffold(child: bodyPage,) : Scaffold(
      appBar: appBar ,
      body: bodyPage,
      floatingActionButton: Platform.isIOS ? Container() : FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
