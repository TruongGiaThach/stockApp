import 'dart:convert';

import 'package:flutter_application_1/model/stock.dart';
import 'package:http/http.dart' as http;

class Webservice {
  /*static const _api_key = "e31dee770amsh777a677ea06d5e1p1c1a7bjsn538b4512a987";
  static const String _baseUrl = "alpha-vantage.p.rapidapi.com";
  static const Map<String, String> _headers = {
    "content-type": "application/json",
    "x-rapidapi-host": "alpha-vantage.p.rapidapi.com",
    "x-rapidapi-key": _api_key,
  };
  Future<dynamic> fetchTopHeadLines(
      {@required String endpoint, @required Map<String, String> query}) async {
    Uri uri = Uri.https(_baseUrl, endpoint, query);
    final response = await http.get(uri, headers: _headers);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["bestMatches"];
      return list.map((stock) => Stock.fromJSON(stock)).toList();
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load json data');
    }
  }*/

  /*Future<List<Stock>> fetchTopHeadLines() async {
    String url =
        "https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=tesco&apikey=demo";

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["bestMatches"];
      return list.map((stock) => Stock.fromJSON(stock)).toList();
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load json data');
    }
  }*/
  Future<List<Stock>> fetchTopHeadLines() async {
    String url =
        "https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=tesco&apikey=demo";

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      List<dynamic> list = result["bestMatches"];
      List<Stock> stocks = [];
      list.forEach((element) {
        stocks.add(Stock.fromJSON(element));
      });
      return stocks; //list.map((stock) => Stock.fromJSON(stock)).toList();
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load json data');
    }
  }
}
