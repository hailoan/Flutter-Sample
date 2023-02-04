import 'dart:ffi';

void main() {
  var numberList = [11, 2, 13, 4];
  numberList.sort(
    (a, b) {
      return a > b ? 1 : 0;
    },
  );
  print("list sort asc: $numberList");

  numberList.sort((a, b) {
    return a < b ? 1 : 0;
  });
  print("list sort dec: $numberList");

  var productList = <Product>[];
  productList.add(Product('T-Shirt', '1', DateTime.now().millisecond, false));
  productList.add(Product('Dress', '2', DateTime.now().millisecond, true));
  productList.add(Product('Trouser', '3', DateTime.now().millisecond, false));
  productList
      .add(Product('Jean', '4', DateTime.now().millisecond + 1000, false));
  productList.add(Product('Jean', '5', DateTime.now().millisecond, true));
  productList.add(Product('Shoe', '6', DateTime.now().millisecond, false));
  print("list product: ${productList.mapToNameAndDesc()}");

  print(
      "list product sort alphabetical: ${productList.sortWithNameAcs().mapToNameAndDesc()}");

  print(
      "list product sort-condition (name+time): ${productList.sortWithNameAndTime().mapToNameAndDesc()}");

  print('first product incart=true: ${productList.firstProductInCart().name}');

  print('last product incart=true: ${productList.lastProductInCart().name}');

  print(
      'list product filter incart=true: ${productList.removeWithCodition().mapToNameAndDesc()}');

  var productMap = productList.asMap();
  productList
      .removeWhere((element) => element.name.contains('a') || element.inCart);

  print('list product after remove: ${productList.mapToNameAndDesc()}');

  var productSet = productList.toSet();
  print('set product: ${productSet.mapToNameAndDesc()}');
  var newProduct = productSet.first.copyTo();
  productSet.add(newProduct);
  productSet.add(productSet.first);
  print('set product after modifier: ${productSet.mapToNameAndDesc()}');
}

extension ProductParsing on Iterable<Product> {
  Iterable<String> mapToNameAndDesc() {
    return map((e) => '${e.name}-${e.desc}');
  }
}

extension ProductSort on List<Product> {
  List<Product> sortWithNameAcs() {
    sort((a, b) {
      return a.name.compareTo(b.name);
    });
    return this;
  }

  List<Product> sortWithNameAndTime() {
    sort((a, b) {
      int compare = a.name.compareTo(b.name);
      if (compare == 0) {
        return a.created < b.created ? 0 : 1;
      } else {
        return compare;
      }
    });
    return this;
  }

  Product firstProductInCart() {
    return firstWhere((element) => element.inCart);
  }

  Product lastProductInCart() {
    return lastWhere((element) => element.inCart);
  }

  List<Product> removeWithCodition() {
    removeWhere((element) => element.name.contains('a') || element.inCart);
    return this;
  }
}

class Product {
  Product(this.name, this.desc, this.created, this.inCart);
  String name;
  String desc;
  bool inCart = false;
  int created = 0;

  Product copyTo() {
    return Product(name, desc, created, inCart);
  }
}
