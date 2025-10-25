import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/pages/update_product_page.dart';

class Product extends StatelessWidget {
  final ProductModel product;
  const Product({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UpdateProductPage(product: product),
          ),
        );
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 10,
                  offset: Offset(5, 5),
                ),
              ],
            ),
            height: 350,
            width: 320,
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 26),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${product.price.toString()} \$",
                          style: TextStyle(fontSize: 26),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 10,
            top: -100,
            child: Image.network(
              width: 320,
              height: 320,
              fit: BoxFit.contain,
              product.image!,
            ),
          ),
        ],
      ),
    );
  }
}
