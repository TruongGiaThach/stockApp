import 'package:flutter/material.dart';
import 'package:flutter_application_1/viewmodel/stockListViewModel.dart';
import 'package:flutter_application_1/viewmodel/stockViewModel.dart';
import 'package:provider/provider.dart';

class StockList extends StatefulWidget {
  @override
  _StockListState createState() => _StockListState();
}

class _StockListState extends State<StockList> {
  @override
  void initState() {
    super.initState();
    // Provider.of<StockListViewModel>(context, listen: false)
    //    .populateTopHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    StockListViewModel stockListViewModel =
        Provider.of<StockListViewModel>(context);

    return FutureBuilder<void>(
        future: stockListViewModel.populateTopHeadlines(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          // AsyncSnapshot<Your object type>
          if (snapshot.hasError)
            return Text(
              'Error:\n\n${snapshot.error}',
              textAlign: TextAlign.center,
            );
          switch (snapshot.connectionState) {

            ///when the future is null
            case ConnectionState.none:
              return Text(
                'There is no data',
                textAlign: TextAlign.center,
              );

            ///when data is being fetched
            case ConnectionState.waiting:
              return Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white30)),
              );

            case ConnectionState.active:
            //when data can be changed
            case ConnectionState.done:
              return ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.grey[400],
                    );
                  },
                  itemCount: (stockListViewModel.listStocks.length == null)
                      ? 0
                      : stockListViewModel.listStocks.length,
                  itemBuilder: (context, index) {
                    final stock = stockListViewModel.listStocks[index];

                    return ListTile(
                      contentPadding: EdgeInsets.all(10),
                      title: Column(children: <Widget>[
                        Text(
                          "${stock.symbol}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "${stock.company}",
                          style:
                              TextStyle(color: Colors.grey[500], fontSize: 20),
                        )
                      ]),
                      trailing: Column(
                        children: <Widget>[
                          Text("\$${stock.price}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500)),
                          Container(
                            width: 75,
                            height: 25,
                            child: Text(
                              "${stock.changePercent}%",
                              style: TextStyle(color: Colors.white),
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.red),
                          )
                        ],
                      ),
                    );
                  });

              // TODO: Handle this case.
              break;
          }
        });
  }
}
