
import 'package:flutter/cupertino.dart';

class NumbersListProvider extends ChangeNotifier{

  List<int> listOfIntegers = [1,2,3,4,5];


  void add(){
    int last  = listOfIntegers.last;
    listOfIntegers.add(last + 1);
    notifyListeners();
  }


}