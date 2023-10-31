import 'dart:io';
import 'dart:math';

void main(List<String> args) {
  // int chislo1 = Random().nextInt(100);
  // print("randomnoe chislo v diapazone[0:100) - $chislo1");
  // func_1();
  // zadacha2_1(chislo1);
  // zadacha2_2(chislo1);
  zadacha3();
}

int func_1() {
  int counter = 0;
  int min = 0;
  int max = 100;
  int a;
  String userAnswer = "";
  while (userAnswer != "=") {
    counter++;
    print("popytka-$counter");
    a = min + Random().nextInt(max - min);
    print("vashe chislo - $a?");
    userAnswer = stdin.readLineSync()!;
    if (userAnswer == "+") {
      min = a + 1;
    } else {
      max = a;
    }
  }
  // print("kolichestvo popytok=$counter");
  return counter;
}

int zadacha2_1(int chislo) {
  int counter = 1;
  int min = 0;
  int max = 100;
  int a = -1;
  while (chislo != a) {
    counter++;
    a = min + Random().nextInt(max - min);
    if (a < chislo) {
      min = a + 1;
    } else {
      max = a;
    }
  }
  // print("kolichestvo popytok(rondom_search)=$counter");
  return counter;
}

int zadacha2_2(int chislo) {
  int count = 1;
  int min = 0;
  int max = 100;
  int mid = (min + max) ~/ 2;
  while (chislo != mid) {
    if (chislo > mid) {
      min = mid;
    } else {
      max = mid;
    }
    mid = (min + max) ~/ 2;
    count++;
  }
  // print("kolichestvo popytok(binary_search)=$count");
  return count;
}

void zadacha3() {
  int summa1 = 0;
  int summa2 = 0;
  List array = List.generate(100, (index) => Random().nextInt(100));
  for (int i = 0; i < array.length; i++) {
    summa1 += zadacha2_1(array[i]);
    summa2 += zadacha2_2(array[i]);
  }
  print(
      "Среднее количество шагов, которое потребовалось алгоритму Binary_search на одно число = ${summa1 / 100}");
  print(
      "Среднее количество шагов, которое потребовалось алгоритму Rondom_search на одно число = ${summa2 / 100}");
}
