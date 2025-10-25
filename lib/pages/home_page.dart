import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/all_product_service.dart';
import 'package:store_app/widgets/product.dart';

class HomePage extends StatelessWidget {
  static const String routeName = 'home_page';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart, color: Colors.black, size: 35),
            ),
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "New Trend",
          style: TextStyle(
            fontFamily: 'Michroma-Regular',
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 120.0, left: 120),
        child: FutureBuilder(
          future: AllProductService().getAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProductModel>? products = snapshot.data;
              return GridView.builder(
                itemCount: products?.length ?? 0,
                clipBehavior: Clip.none,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1 / 1.2,
                ),
                itemBuilder: (context, index) {
                  return Product(product: products![index]);
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
