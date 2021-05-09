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

  String get price {
    return _stock.Currency;
  }

  String get changePercent {
    return _stock.MatchScore;
  }
}
