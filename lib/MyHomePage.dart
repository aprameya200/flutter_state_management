import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_mgmt/ListProvider.dart';
import 'package:state_mgmt/SecondPage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<NumbersListProvider>(
      //provider
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("${value.listOfIntegers.last} is the last element",
                  style: TextStyle(fontSize: 30, color: Colors.red)),
              Expanded(
                child: ListView.builder(
                    itemCount: value.listOfIntegers.length,
                    itemBuilder: (context, index) {
                      return Text(
                        value.listOfIntegers[index].toString(),
                        style: TextStyle(fontSize: 30, color: Colors.black),
                      );
                    }),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SecondPage()));
                  },
                  child: Text("Next Page"))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            value.add();
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
