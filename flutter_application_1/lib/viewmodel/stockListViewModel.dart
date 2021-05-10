import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/model/stock.dart';
import 'package:flutter_application_1/services/webservice.dart';
import 'package:flutter_application_1/viewmodel/stockViewModel.dart';

class StockListViewModel extends ChangeNotifier {
  List<StockViewModel> _listStocks;

  Future<List<StockViewModel>> getListStock() async {
    await _populateTopHeadlines().timeout(Duration(seconds: 5), onTimeout: () {
      print("Request time out!");
      return false;
    });
    return _listStocks;
  }

  Future _populateTopHeadlines() async {
    BestMatch stocks = await Webservice().fetchTopHeadLines();
    this._listStocks = stocks.bestMatches
        .map((stock) => StockViewModel(stock: stock))
        .toList();
    notifyListeners();
  }
}
