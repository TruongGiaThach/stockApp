import 'package:flutter/material.dart';
import 'package:flutter_application_1/viewmodel/stockListViewModel.dart';
import 'package:flutter_application_1/wiget/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MaterialApp(
          title: 'StocksApp',
          theme: ThemeData(
            primarySwatch: Colors.lightBlue,
          ),
          home: HomePage()),
      providers: [
        ChangeNotifierProvider(
          create: (_) => StockListViewModel(),
        )
      ],
    );
  }
}
