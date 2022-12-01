// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// // https://e-shop-74df1-default-rtdb.firebaseio.com/

// class MyWidget extends StatefulWidget {
//   const MyWidget({super.key});

//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget> {
//   late String valueresult;

//   @override
//   Widget build(BuildContext context) {
//     var _imageUrlControler;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Login your account"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(top: 70,left: 40,right: 40),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Card(
//             child: TextField(
//               controller: _imageUrlControler,
//               textInputAction: TextInputAction.done,
//               keyboardType: TextInputType.emailAddress,
//               decoration: const InputDecoration(labelText: 'Enter your username'),
//               onChanged: (value1) {
//                 setState(() {
//                   value1 = valueresult;
//                 });
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text("Username:"),
//           ),
//           Card(
//             child: TextField(
//               controller: _imageUrlControler,
//               textInputAction: TextInputAction.done,
//               keyboardType: TextInputType.emailAddress,
//               decoration: const InputDecoration(labelText: 'Enter your password'),
//               onChanged: (value1) {
//                 setState(() {
//                   value1 = valueresult;
//                 });
//               },
//             ),
//           ),
//         ],
//     ),
//       ),
//     );
//   }
// }
