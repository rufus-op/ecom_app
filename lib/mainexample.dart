// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter API Demo',
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('API Demo'),
//         ),
//         body: Center(
//           child: FutureBuilder<List<dynamic>>(
//             future: fetchData(),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return ListView.builder(
//                   itemCount: snapshot.data!.length,
//                   itemBuilder: (context, index) {
//                     final item = snapshot.data![index];
//                     return ListTile(
//                       leading: CircleAvatar(
//                         backgroundImage: NetworkImage(item['thumbnail']),
//                       ),
//                       title: Text('${item['title']} '),
//                       subtitle: Text(item['description']),
//                     );
//                   },
//                 );
//               } else if (snapshot.hasError) {
//                 return Text('${snapshot.error}');
//               }
//               return const  CircularProgressIndicator();
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// Future<List<dynamic>> fetchData() async {
//   final response = await http.get(Uri.parse('https://dummyjson.com/products'));
//   if (response.statusCode == 200) {
//     final jsonResponse = json.decode(response.body);
//     return jsonResponse['products'];
//   } else {
//     throw Exception('Failed to load data');
//   }
// }
