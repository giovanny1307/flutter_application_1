int addNumbers(int num1, int num2) {
  print(num1 + num2);
  print("hello");
  return num1 + num2;
}

class Person {
  // {} Named arguments// no importa el orden!
  // los named arguments son opcionales
  String name;
  int age;
  // puede vincular de una los valores de las
  // propiedades
  Person({this.name, this.age});
}

void main() {
  // loop basico
  var firstResult = addNumbers(100, 200);
  for (int i = 0; i < 5; i++) {}
}
