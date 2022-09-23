const String mw_apiKey = '32937a90-4ee0-447f-a32f-086748f57c69';


// if (snapshot.hasData) {
//   //return Text(snapshot.data!.shortdef!.first.toString()); // Should give the first definition in the list
//   return Text(snapshot.data!.shortdef![1]);
// }
// if (snapshot.hasData) {
//   children = <Widget>[
//     const Icon (
//       Icons.check_circle_outline,
//       color: Colors.indigo,
//       size: 60,
//     ),
//     Padding(
//         padding: const EdgeInsets.only(top: 16),
//         child: Text(snapshot.data!.shortdef!.first.toString()),
//     ),
//   ];
//   //return Text(snapshot.data!.shortdef!.first.toString()); // Should give the first definition in the list
//   //return Text(snapshot.data!.shortdef![1]);
// } else if (snapshot.hasError) {
//   return Text('${snapshot.error}');
// }