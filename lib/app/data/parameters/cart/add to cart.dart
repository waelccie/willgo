class CartParameters {
  final List<Product> products;

  CartParameters({required this.products});

  Map<String, dynamic> toMap() {
    return {
      'products': products.map((product) => product.toMap()).toList(),
    };
  }
}

class Product {
  final int productId;
  final int quantity;
  final List<Option> options;

  Product({
    required this.productId,
    required this.quantity,
    required this.options,
  });

  Map<String, dynamic> toMap() {
    return {
      'product_id': productId,
      'quantity': quantity,
      'options': options.map((option) => option.toMap()).toList(),
    };
  }
}

class Option {
  final int id;

  Option({required this.id});

  Map<String, dynamic> toMap() => {'id': id};
}
