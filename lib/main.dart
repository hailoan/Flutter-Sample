import 'dart:collection';
import 'dart:ffi';

void main() {
  /**
   * list
   */

  var productList = <Product>[];
  productList.add(Product('T-Shirt', '1', DateTime.now().millisecond, false));
  productList.add(Product('Dress', '2', DateTime.now().millisecond, true));
  productList.add(Product('Trouser', '3', DateTime.now().millisecond, false));
  productList
      .add(Product('Jean', '4', DateTime.now().millisecond + 1000, false));
  productList.add(Product('Jean', '5', DateTime.now().millisecond, true));
  productList.add(Product('Shoe', '6', DateTime.now().millisecond, false));
  productList.printProducts('list product:');
  productList
      .sortWithNameAcs()
      .printProducts('list product sort alphabetical:');
  productList
      .sortWithNameAndTime()
      .printProducts('list product sort-condition (name+time):');

  print('first product incart=true: ${productList.firstProductInCart().name}');

  print('last product incart=true: ${productList.lastProductInCart().name}');

  productList
      .filterProductsInCart()
      .printProducts('list product filter incart=true:');

  productList.removeWithCodition().printProducts('list product after remove:');

/**
 * set
 */
  var productSet = productList.toSet();
  productSet.printProducts('set product:');
  var newProduct = productSet.first.copyTo();
  productSet.add(newProduct);
  productSet.add(productSet.first);
  productSet.printProducts('set product after modifier:');

  /**
   * map
   */

  var productMap = <int, Product>{};
  productMap.addAll(productList.asMap().cast<int, Product>());
  productMap.printKeys('Map keys:');
  productMap.printValues('Map values');
  var product = Product('New Dress', '10', DateTime.now().microsecond, true);
  productMap[1] = product;
  productMap.printValues('Map insert key=1');
  productMap[5] = product;
  productMap.printValues('Map insert key=5');
  print('containkey = 4: ${productMap.containsKey(4)}');
  print('containkey = 4: ${productMap.containsKey(5)}');
  productMap.values
      .toList()
      .sortWithNameAcs()
      .printProducts('Map To List And Sort');
  productMap.removeWhere((key, value) => value.name.startsWith('T'));
  productMap.printValues('Map after remove');
  productMap[1]?.desc = 'edit 10';
  productMap.printValues('Map after modifer key=1');
  productMap.putIfAbsent(1, () => product);
  productMap.printValues('Map after putIfAbsent key=1');
  productMap.putIfAbsent(-20, () => product);
  productMap.printValues('Map after putIfAbsent key=10');
  productMap.printKeys('Map keys:');
  var productSplayMap = SplayTreeMap();
  productSplayMap.addAll(productMap);
  print('Splay keys: ${productSplayMap.keys}');
}

extension ProductParsing on Iterable<Product> {
  void printProducts(String prefix) {
    print('$prefix ${map((e) => '${e.name}-${e.desc}')}');
  }
}

extension ProductList on List<Product> {
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

  Iterable<Product> filterProductsInCart() {
    return where((element) => element.inCart);
  }

  List<Product> removeWithCodition() {
    removeWhere((element) => element.name.contains('a') || element.inCart);
    return this;
  }
}

extension ProductMap on Map<int, Product> {
  void printValues(String prefix) {
    values.printProducts(prefix);
  }

  void printKeys(String prefix) {
    print('$prefix ${keys}');
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
