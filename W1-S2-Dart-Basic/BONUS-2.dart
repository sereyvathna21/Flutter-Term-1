void main() {
  String text = "[{(text)}]";

  print(areBracketsBalanced(text)
      ? "Brackets are balanced."
      : "Brackets are not balanced.");
}

bool areBracketsBalanced(String text) {
  Map<String, String> matchingBrackets = {'(': ')', '{': '}', '[': ']'};
  List<String> stack = [];

  for (var char in text.split('')) {
    if (matchingBrackets.containsKey(char)) {
      stack.add(char);
    } else if (matchingBrackets.containsValue(char)) {
      if (stack.isEmpty || matchingBrackets[stack.removeLast()] != char) {
        return false;
      }
    }
  }
  return stack.isEmpty;
}
