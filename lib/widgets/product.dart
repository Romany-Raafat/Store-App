import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  const Product({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // SizedBox(height: 500),
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
                  Text("HandBag LV", style: TextStyle(fontSize: 26)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("250 USD", style: TextStyle(fontSize: 26)),
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
            'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png',
          ),
        ),
      ],
    );
  }
}
