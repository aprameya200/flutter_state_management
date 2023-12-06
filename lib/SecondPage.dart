import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ListProvider.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  @override
  Widget build(BuildContext context) {
    return Consumer<NumbersListProvider>(
      //provider
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Second Page"),
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
