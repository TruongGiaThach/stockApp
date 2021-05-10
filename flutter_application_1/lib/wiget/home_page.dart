import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/viewmodel/stockListViewModel.dart';
import 'package:flutter_application_1/wiget/stocks_list.dart';
import 'package:provider/provider.dart';
import 'clock.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            color: Colors.black,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Stocks",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.bold)),
                  AspectRatio(
                    aspectRatio: 5,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: MyClock(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: SizedBox(
                      height: 50,
                      child: TextField(
                        decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.grey[500]),
                            hintText: 'Search',
                            prefix: Icon(Icons.search),
                            prefixIconConstraints:
                                BoxConstraints(minWidth: 32, minHeight: 32),
                            fillColor: Colors.grey[800],
                            filled: true,
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 0, style: BorderStyle.none),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)))),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 310,
                    child: MultiProvider(providers: [
                      FutureProvider(
                        create: (_) => StockListViewModel().getListStock(),
                        initialData: [],
                      )
                    ], child: StockList()),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
