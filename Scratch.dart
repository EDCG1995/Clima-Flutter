import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String task2data = await task2();
  task3(task2data);
}

void task1() {
  String result = 'task 1 data';
  print(result + ' complete');
}

Future task2() async {
  String result;
  await Future.delayed(Duration(seconds: 4), () {
    result = 'task 2 data';
    print(result + ' complete');
  });
  return result;
}

void task3(String task2data) {
  String result = 'task 3 data';
  print(result + ' complete with $task2data');
}
