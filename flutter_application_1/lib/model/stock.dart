/*class Stock {
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
}*/

// To parse this JSON data, do
//
//     final bestMatch = bestMatchFromMap(jsonString);

import 'dart:convert';

BestMatch bestMatchFromMap(String str) => BestMatch.fromMap(json.decode(str));

String bestMatchToMap(BestMatch data) => json.encode(data.toMap());

class BestMatch {
  BestMatch({
    this.bestMatches,
  });

  List<BestMatchElement> bestMatches;

  factory BestMatch.fromMap(Map<String, dynamic> json) => BestMatch(
        bestMatches: List<BestMatchElement>.from(
            json["bestMatches"].map((x) => BestMatchElement.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "bestMatches": List<dynamic>.from(bestMatches.map((x) => x.toMap())),
      };
}

class BestMatchElement {
  BestMatchElement({
    this.Symbol,
    this.Name,
    this.Type,
    this.Region,
    this.MarketOpen,
    this.MarketClose,
    this.Timezone,
    this.Currency,
    this.MatchScore,
  });

  String Symbol;
  String Name;
  String Type;
  String Region;
  String MarketOpen;
  String MarketClose;
  String Timezone;
  String Currency;
  String MatchScore;

  factory BestMatchElement.fromMap(Map<String, dynamic> json) =>
      BestMatchElement(
        Symbol: json["1. symbol"],
        Name: json["2. name"],
        Type: json["3. type"],
        Region: json["4. region"],
        MarketOpen: json["5. marketOpen"],
        MarketClose: json["6. marketClose"],
        Timezone: json["7. timezone"],
        Currency: json["8. currency"],
        MatchScore: json["9. matchScore"],
      );

  Map<String, dynamic> toMap() => {
        "1. symbol": Symbol,
        "2. name": Name,
        "3. type": Type,
        "4. region": Region,
        "5. marketOpen": MarketOpen,
        "6. marketClose": MarketClose,
        "7. timezone": Timezone,
        "8. currency": Currency,
        "9. matchScore": MatchScore,
      };
}
