void main() {
  // Map of pizza prices
  const pizzaPrices = {
    'margherita': 5.5,
    'pepperoni': 7.5,
    'vegetarian': 6.5,
  };

  List<String> order = ['margherita', 'pepperoni', 'pepperoni'];
  double total = 0;
  for (String num in order) {
    if (pizzaPrices.containsKey(num)) {
      total += pizzaPrices[num]!;
    } else {
      print("\" $num \" is not on the menu");
    }
  }
  print("Total: \$$total");
}
