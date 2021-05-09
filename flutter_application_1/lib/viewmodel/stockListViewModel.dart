import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/model/stock.dart';
import 'package:flutter_application_1/services/webservice.dart';
import 'package:flutter_application_1/viewmodel/stockViewModel.dart';

class StockListViewModel extends ChangeNotifier {
  List<StockViewModel> listStocks;

  void populateTopHeadlines() async {
    List<Stock> stocks = await Webservice().fetchTopHeadLines();
    this.listStocks =
        stocks.map((stock) => StockViewModel(stock: stock)).toList();

    notifyListeners();
  }
}
