import 'package:test/test.dart';

import 'package:text_drawable_widget/text_drawable_widget.dart';

void main() {
  test('adds one to input values', () {
    final calculator = new Calculator();
    expect(calculator.addOne(2), 3);
    expect(calculator.addOne(-7), -6);
    expect(calculator.addOne(0), 1);
    expect(() => calculator.addOne(null), throwsNoSuchMethodError);
  });
}
