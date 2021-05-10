import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/model/stock.dart';
import 'package:flutter_application_1/services/webservice.dart';
import 'package:flutter_application_1/viewmodel/stockViewModel.dart';

class StockListViewModel extends ChangeNotifier {
  List<StockViewModel> listStocks;

  Future<void> populateTopHeadlines() async {
    BestMatch stocks = await Webservice().fetchTopHeadLines();
    this.listStocks = stocks.bestMatches
        .map((stock) => StockViewModel(stock: stock))
        .toList();

    notifyListeners();
  }
}
