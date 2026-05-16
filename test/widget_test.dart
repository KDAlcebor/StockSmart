import 'package:flutter_test/flutter_test.dart';
import 'package:stock_smart/main.dart';

void main() {
  test('Product low stock detection works', () {
    final product = Product(
      id: 'test1',
      name: 'Test Product',
      category: 'Electronics',
      quantity: 5,
      reorderLevel: 10,
      price: 100,
      cost: 50,
      barcode: '12345',
      createdAt: DateTime.now(),
      lastUpdated: DateTime.now(),
    );
    expect(product.isLowStock, true);
  });

  test('Product inventory value calculation is correct', () {
    final product = Product(
      id: 'test2',
      name: 'Test Product 2',
      category: 'Groceries',
      quantity: 10,
      reorderLevel: 5,
      price: 200,
      cost: 100,
      barcode: '67890',
      createdAt: DateTime.now(),
      lastUpdated: DateTime.now(),
    );
    expect(product.inventoryValue, 1000.0);
    expect(product.isLowStock, false);
  });

  test('Product profit calculation is correct', () {
    final product = Product(
      id: 'test3',
      name: 'Test Product 3',
      category: 'Clothing',
      quantity: 20,
      reorderLevel: 5,
      price: 300,
      cost: 150,
      barcode: '11111',
      createdAt: DateTime.now(),
      lastUpdated: DateTime.now(),
      totalSold: 10,
    );
    expect(product.profit, 1500.0);
  });
}
