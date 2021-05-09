import 'package:flutter_application_1/model/stock.dart';

class StockViewModel {
  Stock _stock;
  StockViewModel({Stock stock}) : _stock = stock;

  String get symbol {
    return _stock.symbol;
  }

  String get company {
    return _stock.company;
  }

  double get price {
    return _stock.price;
  }

  double get changePercent {
    return _stock.changePercent;
  }
}
