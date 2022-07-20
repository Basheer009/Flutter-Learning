// container = Center(
//   child: Container(
//     color: Colors.teal,
//     child: TextButton(
//       child: const Text(
//         'BMI CALCULATOR',
//         style: TextStyle(
//           color: Colors.black,
//           fontSize: 20.0,
//         ),
//       ),
//       onPressed: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => const BMIPage(),
//           ),
//         );
//       },
//     ),
//   ),
// );
// container = const BMIPage();
// title = const Text("BMI CALCULATOR");
// appBarColor = const Color(0xFF0A0E21);
// centerTitle = true;

// container = const AboutListTile(
//   icon: Icon(
//     Icons.info,
//   ),
//   child: Text('About app'),
//   applicationIcon: Icon(
//     Icons.local_play,
//   ),
//   applicationName: 'Basheer App',
//   applicationVersion: '1.0.0',
//   applicationLegalese: '© 2022 Basheer Inc.',
//   aboutBoxChildren: [
//     ///Content goes here...
//     Text('Hallo'),
//   ],
// );
// title = const Text("About");

// title: const Text("Basheer App"),
// leading: IconButton(
//   onPressed: () {},
//   icon: const Icon(Icons.list),
// ),

// actions: [
//   IconButton(
//     icon: const Icon(Icons.settings),
//     onPressed: () {},
//   ),
//   // add more IconButton
// ],


// void showResultsPage({
//   required BuildContext context,
//   required String bmiResult,
//   required String resultText,
//   required String interpretation,
//   String? applicationLegalese,
//   bool useRootNavigator = false,
// }) {
//   assert(context != null);
//   assert(useRootNavigator != null);
//   Navigator.of(context, rootNavigator: useRootNavigator).push(MaterialPageRoute<void>(
//     builder: (BuildContext context) => ResultsPage(
//       bmiResult: bmiResult,
//       resultText: resultText,
//       interpretation: interpretation,
//     ),
//   ));
// }

// showResultsPage(
//   context: context,
//   bmiResult: calc.calculateBMI(),
//   resultText: calc.getResult(),
//   interpretation: calc.getInterpretation(),
//   // useRootNavigator: true
// );

// Navigator.of(context, rootNavigator: true)
//     .push(MaterialPageRoute<void>(
//   builder: (context) => const BMIPage(),
// ));
// Navigator.push(
//   context,
//   MaterialPageRoute(
//     builder: (context) => const BMIPage(),
//   ),
// );


// print(la.toStringAsFixed(3));
// print(num.parse(_locationService.latitude.toStringAsFixed(2)));
// print(lo.toStringAsFixed(3));