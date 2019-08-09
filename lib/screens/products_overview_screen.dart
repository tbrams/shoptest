import 'package:flutter/material.dart';

import '../widgets/products_grid.dart';

class ProducsOverviewScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      appBar: AppBar(
        title: Text('Flutter Shop Overview'),
      ),
      body: ProductsGrid(),
    );
    return scaffold;
  }
}


