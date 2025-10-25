import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product_service.dart';

class UpdateProductPage extends StatefulWidget {
  final ProductModel product;

  const UpdateProductPage({super.key, required this.product});

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  late TextEditingController titleController;
  late TextEditingController priceController;
  late TextEditingController descController;
  late TextEditingController imageController;
  late TextEditingController categoryController;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.product.title);
    priceController = TextEditingController(
      text: widget.product.price.toString(),
    );
    descController = TextEditingController(text: widget.product.description);
    imageController = TextEditingController(text: widget.product.image);
    categoryController = TextEditingController(text: widget.product.category);
  }

  @override
  void dispose() {
    titleController.dispose();
    priceController.dispose();
    descController.dispose();
    imageController.dispose();
    categoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Update Product'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: priceController,
                decoration: InputDecoration(labelText: 'Price'),
              ),
              TextField(
                controller: descController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
              TextField(
                controller: imageController,
                decoration: InputDecoration(labelText: 'Image URL'),
              ),
              TextField(
                controller: categoryController,
                decoration: InputDecoration(labelText: 'Category'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  setState(() => isLoading = true);

                  await UpdateProductService().updateProduct(
                    id: widget.product.id!,
                    title: titleController.text,
                    price: double.parse(priceController.text),
                    descritpion: descController.text,
                    image: imageController.text,
                    ctegory: categoryController.text,
                  );

                  setState(() => isLoading = false);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Product updated successfully ✅')),
                  );
                },
                child: isLoading
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
