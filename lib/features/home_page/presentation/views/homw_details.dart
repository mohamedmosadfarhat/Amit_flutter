import 'package:amit_flutter/features/home_page/data/models/product_model.dart';
import 'package:flutter/material.dart';

class HomeDetails extends StatelessWidget {
  const HomeDetails({Key? key}) : super(key: key);
  static String id = "homedetails";
  @override
  Widget build(BuildContext context) {
    var product = ModalRoute.of(context)?.settings.arguments as ProductModel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 500,
                child: Image.network(
                  "${product.image}",
                  fit: BoxFit.fill,
                )),
            Text("${product.title}"),
            Text("${product.description}"),
          ],
        ),
      ),
    );
  }
}
