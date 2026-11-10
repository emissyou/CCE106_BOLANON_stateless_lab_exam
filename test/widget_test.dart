import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stateless_lab_exam/main.dart';

void main() {
  testWidgets('ShoppingCartPage smoke and UI rendering test', (WidgetTester tester) async {
    // Set a phone-like viewport size
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    // Build app and trigger frame
    await tester.pumpWidget(const MyApp());

    // 1. AppBar checks
    expect(find.text('My Cart'), findsOneWidget);
    expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
    expect(find.text('3'), findsWidgets); // badge and order items count

    // 2. Introduction checks
    expect(find.text('CAMPUS STORE'), findsOneWidget);
    expect(find.text('Ready for checkout'), findsOneWidget);
    expect(find.text('Review your items before placing your order.'), findsOneWidget);

    // 3. Delivery info checks
    expect(find.text('Deliver to John Mark Bolanon'), findsOneWidget);
    expect(find.text('Matina, Davao City'), findsOneWidget);
    expect(find.text('Change'), findsOneWidget);

    // 4. Order items checks
    expect(find.text('Order Items'), findsOneWidget);
    expect(find.text('3 items'), findsOneWidget);
    expect(find.text('Wireless Mouse'), findsOneWidget);
    expect(find.text('PHP 450.00'), findsOneWidget);
    expect(find.text('USB-C Hub'), findsOneWidget);
    expect(find.text('PHP 850.00'), findsOneWidget);
    expect(find.text('Laptop Stand'), findsOneWidget);
    expect(find.text('PHP 700.00'), findsOneWidget);

    // 5. Discount banner checks
    expect(find.text('STUDENT10 applied'), findsOneWidget);
    expect(find.text('10% discount on items'), findsOneWidget);
    expect(find.byIcon(Icons.local_offer_outlined), findsOneWidget);
    expect(find.byIcon(Icons.check_circle), findsOneWidget);

    // 6. Payment summary checks
    expect(find.text('Payment Summary'), findsOneWidget);
    expect(find.text('Subtotal'), findsOneWidget);
    expect(find.text('PHP 2,000.00'), findsOneWidget);
    expect(find.text('Discount (10%)'), findsOneWidget);
    expect(find.text('- PHP 200.00'), findsOneWidget);
    expect(find.text('Delivery Fee'), findsOneWidget);
    expect(find.text('PHP 50.00'), findsOneWidget);
    expect(find.text('Total'), findsOneWidget);
    expect(find.text('PHP 1,850.00'), findsOneWidget);

    // 7. Place Order button checks
    expect(find.text('Place Order'), findsOneWidget);

    // Test tapping AppBar controls
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.tap(find.byIcon(Icons.shopping_bag_outlined));

    // Test tapping delivery change
    await tester.tap(find.text('Change'));

    // Test tapping item quantity & delete controls
    await tester.tap(find.byIcon(Icons.add).first);
    await tester.tap(find.byIcon(Icons.remove).first);
    await tester.tap(find.byIcon(Icons.delete_outline_rounded).first);

    // Test tapping Place Order button
    await tester.tap(find.text('Place Order'));
    await tester.pump();
  });
}
