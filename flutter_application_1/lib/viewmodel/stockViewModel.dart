import 'package:flutter_application_1/model/stock.dart';

class StockViewModel {
  BestMatchElement _stock;
  StockViewModel({BestMatchElement stock}) : _stock = stock;

  String get symbol {
    return _stock.Symbol;
  }

  String get company {
    return _stock.Name;
  }

  double get price {
    return 5;
  }

  double get changePercent {
    return double.parse(_stock.MatchScore);
  }
}
