import 'package:flutter/material.dart';
import 'dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const UserProfileScreen(),
    );
  }
}

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Image and Details
            Container(
              color: Colors.blueAccent.shade100,
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey.shade300,
                    child: const Icon(
                      Icons.person,
                      size: 60,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'SMA10705',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'vivek shop',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                  const Text(
                    '8292857341vivek@gmail.com',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            // Tabs (Personal Details / Bank Details)
            DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  TabBar(
                    labelColor: Colors.blue,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.blue,
                    tabs: const [
                      Tab(text: "Personal Details"),
                      Tab(text: "Bank Details"),
                    ],
                  ),
                  SizedBox(
                    height: 300, // Adjust height as needed
                    child: TabBarView(
                      children: [
                        // Personal Details Tab
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Personal Details',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              DetailRow(label: 'Name', value: 'vivek shop'),
                              DetailRow(
                                  label: 'Email',
                                  value: '8292857341vivek@gmail.com'),
                              DetailRow(label: 'Phone', value: '8292857341'),
                              DetailRow(label: 'Aadhar', value: 'XXXXXXXX1986'),
                              DetailRow(label: 'Pan', value: 'BJJPV0441H'),
                            ],
                          ),
                        ),
                        // Bank Details Tab
                        Center(
                          child: const Text(
                            "Bank Details Coming Soon!",
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Settings Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Text(
                'Settings',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SettingOption(
              icon: Icons.lock_outline,
              label: 'Change Password',
              onTap: () {},
            ),
            SettingOption(
              icon: Icons.pin_outlined,
              label: 'Change M-Pin',
              onTap: () {},
            ),
            SettingOption(
              icon: Icons.lock_reset,
              label: 'Change T-Pin',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

// Detail Row Widget
class DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const DetailRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, color: Colors.black54),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

// Setting Option Widget
class SettingOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const SettingOption({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(label),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}

















// import 'dart:convert'; // For JSON encoding
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// // Step 1: Define the Data Model
// class User {
//   final String name;
//   final int age;
//
//   User({required this.name, required this.age});
//
//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'age': age,
//     };
//   }
// }
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: UserScreen(),
//     );
//   }
// }
//
// class UserScreen extends StatefulWidget {
//   @override
//   _UserScreenState createState() => _UserScreenState();
// }
//
// class _UserScreenState extends State<UserScreen> {
//   final List<User> users = []; // Step 2: Initialize a List
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController ageController = TextEditingController();
//
//   // Step 3: Add Data to the List
//   void addUser(String name, int age) {
//     setState(() {
//       users.add(User(name: name, age: age));
//     });
//   }
//
//   // Step 4 & 5: Convert List to JSON and Send Data to API
//   Future<void> sendData() async {
//     final url = Uri.parse('https://example.com/api/users'); // Replace with your API endpoint
//     final jsonList = users.map((user) => user.toJson()).toList();
//
//     try {
//       final response = await http.post(
//         url,
//         headers: {
//           'Content-Type': 'application/json',
//         },
//         body: jsonEncode(jsonList),
//       );
//
//       if (response.statusCode == 200) {
//         showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: Text('Success'),
//             content: Text('Data sent successfully!'),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.pop(context),
//                 child: Text('OK'),
//               ),
//             ],
//           ),
//         );
//       } else {
//         print('Failed to send data: ${response.statusCode}');
//       }
//     } catch (error) {
//       print('Error sending data: $error');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Users'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: nameController,
//               decoration: InputDecoration(labelText: 'Name'),
//             ),
//             TextField(
//               controller: ageController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(labelText: 'Age'),
//             ),
//             SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: () {
//                 if (nameController.text.isNotEmpty &&
//                     ageController.text.isNotEmpty) {
//                   addUser(nameController.text, int.parse(ageController.text));
//                   nameController.clear();
//                   ageController.clear();
//                 }
//               },
//               child: Text('Add User'),
//             ),
//             SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: sendData,
//               child: Text('Send Data to API'),
//             ),
//             SizedBox(height: 20),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: users.length,
//                 itemBuilder: (context, index) {
//                   final user = users[index];
//                   return ListTile(
//                     title: Text(user.name),
//                     subtitle: Text('Age: ${user.age}'),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//  }
