
import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String task2Result = await task2();
  task3(task2Result);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future<String> task2() async {
  Duration duration = Duration(seconds: 5);
  String result = "";
  await Future.delayed(duration, () {
    result = 'task 2 data';
    print('Task 2 complete');
  });
  // sleep(duration);
  // String result = 'task 2 data';
  // print('Task 2 complete');
  return result;
}

void task3(String task2Data) {
  String result = 'task 3 data';
  print('Task 3 complete with $task2Data');
}




// void performTasks()  {
//   task1();
//   task2();
//   task3();
// }
//
// void task1() {
//   String result = 'task 1 data';
//   print('Task 1 complete');
// }
//
// void task2()  {
//   Duration duration = Duration(seconds: 5);
//   Future.delayed(duration, () {
//     String result = 'task 2 data';
//     print('Task 2 complete');
//   });
//   // sleep(duration);
//   // String result = 'task 2 data';
//   // print('Task 2 complete');
// }
//
// void task3() {
//   String result = 'task 3 data';
//   print('Task 3 complete');
// }