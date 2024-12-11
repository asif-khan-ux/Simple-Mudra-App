import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'ForgotPasswordPage.dart';
import 'SignUpPage.dart';
import 'dashboard.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void loginApi() async {
    var headers = {
      'aksom': 'bebdc5f462e19958af91dd728d97a0c8',
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var request = http.Request(
        'POST',
        Uri.parse('http://api.v1.simplemudra.co.in/recApiFinal/service.aspx'));
    request.bodyFields = {
      "method": "webloginba",
      'loginid': _emailController.text,
      'password': _passwordController.text,
      'pid': '1'
    };
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    var serverResponse = await response.stream.bytesToString();
    var data = jsonDecode(serverResponse);
    if (data['Id'] != 'N') {
      _showMessage('Login Successful', onDismiss: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DashboardPage()),
        );
      });
    } else {
      _showMessage(' Incorrect email or password.');
    }
    debugPrint("server response $serverResponse");
  }
  void _showMessage(String message, {VoidCallback? onDismiss}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(message),
          actions: [
            TextButton(
              child: Center(child: const Text('OK')),
              onPressed: () {
                Navigator.of(context).pop();
                if (onDismiss != null) onDismiss();
              },
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Center(child: const Text('Login')),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(

                image: DecorationImage(
                  image: NetworkImage(
                      'https://designimages.appypie.com/appbackground/appbackground-22-homedecor-plant.jpg'), // Your image URL
                  fit: BoxFit.cover,
                ),
              ),
              width: double.infinity,
              height: double.infinity,
            ),

          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Stack(
                      children: [
                        Center(
                          child: Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.topCenter,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 50.0),
                                child: SizedBox(
                                  height: 600,
                                  width: MediaQuery.of(context).size.width * 0.95,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      gradient: const LinearGradient(
                                        colors: [Colors.blueAccent,Colors.purpleAccent],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                    ),
                                    child: Card(
                                      elevation: 8,
                                      shadowColor: Colors.pinkAccent,
                                      margin: const EdgeInsets.all(16.0),
                                      clipBehavior: Clip.antiAlias,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const SizedBox(height: 20),
                                            TextField(
                                              controller: _emailController,
                                              decoration: const InputDecoration(
                                                hintText: 'Enter your login id here',
                                                prefixIcon: Icon(Icons.email),
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            TextField(
                                              controller: _passwordController,
                                              obscureText: true,
                                              decoration: const InputDecoration(
                                                hintText: 'Enter your Password here',
                                                prefixIcon: Icon(Icons.lock),
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            GestureDetector(
                                              onTap: () {
                                                loginApi();
                                              },
                                              child: Container(
                                                height: 50,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  gradient: const LinearGradient(
                                                    colors: [Colors.blueAccent,Colors.purpleAccent],
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                  ),
                                                ),
                                                child: const Center(
                                                  child: Text(
                                                    'Log In',
                                                    style: TextStyle(color: Colors.white, fontSize: 26),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 15),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                                                );
                                              },
                                              child: const Text(
                                                'Forgot Password?',
                                                style: TextStyle(color: Colors.blue, fontSize: 16),
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => SignUpPage()),
                                                );
                                              },
                                              child: const Text(
                                                'Sign Up',
                                                style: TextStyle(color: Colors.blue, fontSize: 16),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: -40,
                                child: SizedBox(
                                  height: 150,
                                  width: 350,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      gradient: const LinearGradient(
                                        colors: [Colors.blueAccent,Colors.purpleAccent],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                    ),
                                    child: Card(
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50.0),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20.0),
                                        child: Image.network(
                                          'https://media.licdn.com/dms/image/v2/D560BAQFQdflTKEIq6g/company-logo_200_200/company-logo_200_200/0/1700975597244?e=2147483647&v=beta&t=6qzLKUGJjU1Mx4x1sdFVlI8uR8QBpMJEwaw4AXDgSCE',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}





















// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'ForgotPasswordPage.dart';
// import 'SignUpPage.dart';
// import 'dashboard.dart';
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});
//
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//
//   void loginApi() async {
//     var headers = {
//       'aksom': 'bebdc5f462e19958af91dd728d97a0c8',
//       'Content-Type': 'application/x-www-form-urlencoded'
//     };
//     var request = http.Request(
//         'POST',
//         Uri.parse('http://api.v1.simplemudra.co.in/recApiFinal/service.aspx'));
//     request.bodyFields = {
//       "method": "webloginba",
//       'loginid': _emailController.text,
//       'password': _passwordController.text,
//       'pid': '1'
//     };
//     request.headers.addAll(headers);
//     http.StreamedResponse response = await request.send();
//     var serverResponse = await response.stream.bytesToString();
//     var data = jsonDecode(serverResponse);
//     if (data['Id'] != 'N') {
//       _showMessage('Login Successful', onDismiss: () {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => DashboardPage()),
//         );
//       });
//     } else {
//       _showMessage(' Incorrect email or password.');
//     }
//     debugPrint("server response $serverResponse");
//   }
//
//   void _showMessage(String message, {VoidCallback? onDismiss}) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           content: Text(message),
//           actions: [
//             TextButton(
//               child: Center(child: const Text('OK')),
//               onPressed: () {
//                 Navigator.of(context).pop();
//                 if (onDismiss != null) onDismiss();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // title: Center(child: const Text('Login')),
//       ),
//       body: Stack(
//         children: [
//           Positioned.fill(
//             child: Container(
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: NetworkImage(
//                       'https://designimages.appypie.com/appbackground/appbackground-22-homedecor-plant.jpg'), // Your image URL
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               width: double.infinity,
//               height: double.infinity,
//             ),
//
//           ),
//           Center(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: SingleChildScrollView(
//                 child: Center(
//                   child: Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: Stack(
//                       children: [
//                         Center(
//                           child: Stack(
//                             clipBehavior: Clip.none,
//                             alignment: Alignment.topCenter,
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 50.0),
//                                 child: SizedBox(
//                                   height: 500,
//                                   width: MediaQuery.of(context).size.width * 0.95,
//                                   child: Card(
//                                     elevation: 8,
//                                     shadowColor: Colors.pinkAccent,
//                                     margin: const EdgeInsets.all(16.0),
//                                     clipBehavior: Clip.antiAlias,
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(30.0),
//                                     ),
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(20.0),
//                                       child: Column(
//                                         crossAxisAlignment: CrossAxisAlignment.center,
//                                         mainAxisAlignment: MainAxisAlignment.center,
//                                         mainAxisSize: MainAxisSize.min,
//                                         children: [
//                                           const SizedBox(height: 20),
//                                           TextField(
//                                             controller: _emailController,
//                                             decoration: const InputDecoration(
//                                               hintText: 'Enter your login id here',
//                                               prefixIcon: Icon(Icons.email),
//                                             ),
//                                           ),
//                                           const SizedBox(height: 20),
//                                           TextField(
//                                             controller: _passwordController,
//                                             obscureText: true,
//                                             decoration: const InputDecoration(
//                                               hintText: 'Enter your Password here',
//                                               prefixIcon: Icon(Icons.lock),
//                                             ),
//                                           ),
//                                           const SizedBox(height: 20),
//                                           GestureDetector(
//                                             onTap: () {
//                                               loginApi();
//                                             },
//                                             child: Container(
//                                               height: 50,
//                                               width: double.infinity,
//                                               decoration: BoxDecoration(
//                                                 color: Colors.blue[500],
//                                                 borderRadius: BorderRadius.circular(10),
//                                               ),
//                                               child: const Center(
//                                                 child: Text(
//                                                   'Log In',
//                                                   style: TextStyle(color: Colors.white, fontSize: 26),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                           const SizedBox(height: 15),
//                                           GestureDetector(
//                                             onTap: () {
//                                               Navigator.push(
//                                                 context,
//                                                 MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
//                                               );
//                                             },
//                                             child: const Text(
//                                               'Forgot Password?',
//                                               style: TextStyle(color: Colors.blue, fontSize: 16),
//                                             ),
//                                           ),
//                                           const SizedBox(height: 10),
//                                           GestureDetector(
//                                             onTap: () {
//                                               Navigator.push(
//                                                 context,
//                                                 MaterialPageRoute(builder: (context) => SignUpPage()),
//                                               );
//                                             },
//                                             child: const Text(
//                                               'Sign Up',
//                                               style: TextStyle(color: Colors.blue, fontSize: 16),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Positioned(
//                                 top: -40,
//                                 child: SizedBox(
//                                   height: 150,
//                                   width: 350,
//                                   child: Card(
//                                     elevation: 20,
//                                     shadowColor: Colors.blueGrey,
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(50.0),
//                                     ),
//                                     child: ClipRRect(
//                                       borderRadius: BorderRadius.circular(20.0),
//                                       child: Image.network(
//                                         'https://media.licdn.com/dms/image/v2/D560BAQFQdflTKEIq6g/company-logo_200_200/company-logo_200_200/0/1700975597244?e=2147483647&v=beta&t=6qzLKUGJjU1Mx4x1sdFVlI8uR8QBpMJEwaw4AXDgSCE',
//                                         fit: BoxFit.cover,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }







