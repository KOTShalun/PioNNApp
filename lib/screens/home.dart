import 'package:flutter/material.dart';
import 'package:pionn_app/domain/product.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(widget.title),
        leading: Icon(Icons.analytics_outlined),
      ),
      body: Center(child: SaleList()),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class SaleList extends StatelessWidget {
  final products = <Product>[
    Product("cthm", "dsdfafasf"),
    Product("cthm1", "dsdfafasf"),
    Product("cthm2", "dsdfafasf"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 2.0,
            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 7.0),
            child: Container(
              child: ListTile(
                leading: Container(
                  padding: EdgeInsets.only(right: 5.0),
                  child: Icon(
                    Icons.pest_control_rodent,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                title: Text(products[index].title),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: Theme.of(context).primaryColor,
                ),
                subtitle: Subtile(context, products[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget Subtile(BuildContext context, Product product) {
  return Text(product.description);
}
