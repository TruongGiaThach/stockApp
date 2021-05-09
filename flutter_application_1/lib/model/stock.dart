import 'package:flutter/foundation.dart';

class Stock {
  final String symbol;
  final String company;
  final double price;
  final double changePercent;
  Stock({this.symbol, this.company, this.price, this.changePercent});
  factory Stock.fromJSON(Map<String, dynamic> json) {
    return new Stock(
        symbol: json['1. symbol'],
        company: json['2. name'],
        price: 5,
        changePercent: json['9. matchScore']);
  }
}
