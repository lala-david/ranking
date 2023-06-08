// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class RankingSystemPage extends StatefulWidget {
//   const RankingSystemPage({Key? key}) : super(key: key);
//
//   @override
//   _RankingSystemPageState createState() => _RankingSystemPageState();
// }
//
// class _RankingSystemPageState extends State<RankingSystemPage> {
//   final FirebaseFirestore db = FirebaseFirestore.instance;
//   final String collectionName = 'rank'; // 컬렉션 이름 설정
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Ranking System'),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: db.collection(collectionName).orderBy('score', descending: true).snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//             return Center(child: Text('No data available'));
//           } else {
//             final users = snapshot.data!.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
//             return ListView.builder(
//               itemCount: users.length,
//               itemBuilder: (context, index) {
//                 final user = users[index];
//                 final name = user['name'] as String? ?? '';
//                 final score = user['score'] is int ? user['score'] as int : int.tryParse(user['score'] as String? ?? '0') ?? 0;
//                 final rank = index + 1;
//
//                 return ListTile(
//                   title: Text('$rank. $name'),
//                   subtitle: Text('Score: $score'),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
