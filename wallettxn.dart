import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: PaymentScreen(),
  ));
}

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
        backgroundColor: Colors.purple.shade400,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Mobile Number / User code',
                prefixIcon: Icon(Icons.phone),
                suffixIcon: Container(
                  margin: EdgeInsets.only(right: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      },
                    child: Text('Search'),
                     style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                     ),
                  ),
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
                prefixIcon: Icon(Icons.currency_rupee),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Remark',
                prefixIcon: Icon(Icons.text_snippet),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            StatefulBuilder(
              builder: (context, setState) {
                bool _isObscured = true;
                return TextField(
                  obscureText: _isObscured,
                  decoration: InputDecoration(
                    labelText: 'Enter T-Pin',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscured ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscured = !_isObscured;
                        });
                      },
                    ),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                );
              },
            ),
            SizedBox(height: 32.0),
            Center(
              child: ElevatedButton(
                onPressed: () {

                },
                child: Text('Payment'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                  textStyle: TextStyle(fontSize: 20,color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}










// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MaterialApp());
// }
//
// class Wallettxn extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Payment'),
//         backgroundColor: Colors.purple,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'Mobile Number / User code',
//                 prefixIcon: Icon(Icons.phone),
//                 suffixIcon: ElevatedButton(
//                   onPressed: () {
//                     // Add search functionality
//                   },
//                   child: Text('Search'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.purple,
//                   ),
//                 ),
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 16.0),
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'Amount',
//                 prefixIcon: Icon(Icons.currency_rupee),
//                 border: OutlineInputBorder(),
//               ),
//               keyboardType: TextInputType.number,
//             ),
//             SizedBox(height: 16.0),
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'Remark',
//                 prefixIcon: Icon(Icons.text_snippet),
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 16.0),
//             StatefulBuilder(
//               builder: (context, setState) {
//                 bool _isObscured = true;
//                 return TextField(
//                   obscureText: _isObscured,
//                   decoration: InputDecoration(
//                     labelText: 'Enter T-Pin',
//                     prefixIcon: Icon(Icons.lock),
//                     suffixIcon: IconButton(
//                       icon: Icon(
//                         _isObscured ? Icons.visibility : Icons.visibility_off,
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           _isObscured = !_isObscured;
//                         });
//                       },
//                     ),
//                     border: OutlineInputBorder(),
//                   ),
//                   keyboardType: TextInputType.number,
//                 );
//               },
//             ),
//             SizedBox(height: 32.0),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   // Add payment functionality
//                 },
//                 child: Text('Payment'),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.purple,
//                   padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
//                   textStyle: TextStyle(fontSize: 16),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }