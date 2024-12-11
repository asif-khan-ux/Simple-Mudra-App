import 'package:flutter/material.dart';
import 'package:mudra/login_page.dart';
import 'package:http/http.dart' as http;
import 'package:mudra/profile.dart';
import 'package:mudra/wallettxn.dart';

import 'Report.dart';
import 'mudra.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: const DashboardPage(),

    );
  }
}
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});
  @override
  _DashboardPageState createState() => _DashboardPageState();
}
class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => const HomePage()),
      // );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const UserProfileScreen()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MudraTransferScreen()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const UserProfileScreen()),
        );
        break;
    }
  }
  void _restartApp() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MyApp()),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          Container(
            child: Center(
              child: IconButton(
                icon: Center(child: const Icon(Icons.restart_alt_outlined)),
                onPressed: _restartApp,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: TextButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Wallet Txn tapped')),
                    );
                  },
                  icon: const Icon(
                    Icons.account_balance_wallet,
                    size: 28,
                    color: Colors.blue,
                  ),
                  label:InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Wallet Txn',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('vivek singh'),
              accountEmail: Text('8292857341vivek@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, color: Colors.redAccent),
              ),
            ),
            _buildDrawerSection(
              title: 'General',
              items: [
                _buildDrawerItem(
                  icon: Icons.home,
                  label: 'Home',
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.real_estate_agent_rounded,
                  label: 'Mudra Request',
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.real_estate_agent_rounded,
                  label: 'Mudra Request Report',
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.home_work_rounded,
                  label: 'Simple Mudra',
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            _buildDrawerSection(
              title: 'Reports',
              items: [
                _buildDrawerItem(
                  icon: Icons.receipt_long_outlined,
                  label: 'Recharge Request',
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.receipt_long_outlined,
                  label: 'Mudra Report',
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.receipt_long_outlined,
                  label: 'AePS Report',
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.receipt_long_outlined,
                  label: 'BBPS Report',
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.receipt_long_outlined,
                  label: 'Credit Report',
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            _buildDrawerSection(
              title: 'Account',
              items: [
                _buildDrawerItem(
                  icon: Icons.person,
                  label: 'Profile',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const UserProfileScreen()),
                    );
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.currency_rupee_outlined,
                  label: 'Mudra',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AllReportsScreen()),
                    );
                  },
                ),
              ],
            ),
            _buildDrawerSection(
              title: 'Support',
              items: [
                _buildDrawerItem(
                  icon: Icons.help,
                  label: 'Help',
                  onTap: () {},
                ),
                _buildDrawerItem(
                  icon: Icons.logout_outlined,
                  label: 'Log Out',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _buildDashboardCards(context),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.greenAccent,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.pink[200],
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.currency_rupee_outlined),
            label: 'Mudra',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined),
            label: 'Report',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
        ],
      ),
    );
  }
  Widget _buildIconItem(IconData icon, String label, String pageName) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, pageName);
      },
      child: Column(
        children: [
          Icon(icon, size: 30),
          Text(label),
        ],
      ),
    );
  }
  Widget _buildDashboardCards(BuildContext context) {
    return Column(
      children: [
        Card(
          color: Colors.blueGrey,
          elevation: 5,
          child: Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Logo and Text Row
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children:[
                                      Column(
                                          children:[
                                            Text(
                                              'SM ID',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey[700],
                                              ),

                                            ),
                                            Text(
                                              'SMA10705',
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ]),
                                      SizedBox(width: 100,),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.network(
                                          'https://media.licdn.com/dms/image/v2/D560BAQFQdflTKEIq6g/company-logo_200_200/company-logo_200_200/0/1700975597244?e=2147483647&v=beta&t=6qzLKUGJjU1Mx4x1sdFVlI8uR8QBpMJEwaw4AXDgSCE',
                                          height: 150, // Increased height
                                          width: 150, // Increased width
                                          errorBuilder: (context, error, stackTrace) {
                                            return Icon(
                                              Icons.error,
                                              color: Colors.red,
                                              size: 100,
                                            );
                                          },
                                        ),
                                      ),
                                    ]  ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // Wallet One
                          Column(
                            children: const [
                              Text(
                                'Wallet One',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '₹ 0.72',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: const [
                              Text(
                                'Wallet Two',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '₹ 0.0',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

        const SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            color: Colors.blueGrey,
            elevation: 5,
            child: Container(
              child: Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.blueAccent,Colors.purpleAccent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Builder(
                      builder: (context) {
                        return Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 250.0,
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    _buildIconItem(Icons.currency_rupee_outlined,'Mudra', 'MudraPage'),
                                    _buildIconItem(Icons.fingerprint_outlined, 'AePS', 'AEPSPage'),
                                    _buildIconItem(Icons.credit_card, 'M_ATM', 'M_ATMPage'),
                                    _buildIconItem(Icons.fingerprint, 'AEPS Sett', 'AEPSSettPage'),

                                  ],
                                ),
                              ),

                              const SizedBox(height: 50),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  _buildIconItem(Icons.wallet_giftcard_outlined, 'CMS', 'CMSPage'),
                                  _buildIconItem(Icons.fingerprint, 'Cash Dep..', 'CashDepPage'),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        Card(
          color: Colors.blueGrey,
          elevation: 5,
          child: Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.white,
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.blueAccent,Colors.purpleAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Builder(
                  builder: (context) {
                    return Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 200.0,
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [

                              _buildIconItem(Icons.mobile_off_outlined, 'Mobile', 'MobilePage'),
                              _buildIconItem(Icons.electrical_services_outlined, 'Electricity', 'ElectricityPage'),
                              _buildIconItem(Icons.broken_image_outlined, 'LIC', 'LICPage'),
                              _buildIconItem(Icons.tapas_rounded, 'Account Opening', 'Account OpeningPage'),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [

                              _buildIconItem(Icons.lightbulb_outline, 'BBPS', 'BBPSPage'),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDrawerSection({required String title, required List<Widget> items}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Column(
          children: items,
        ),
      ],
    );
  }
  Widget _buildDrawerItem({required IconData icon, required String label, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      onTap: onTap,
    );
  }
}
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: const Center(child: Text('Welcome to Home')),
    );
  }
}
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Page')),
      body: const Center(child: Text('Profile Page')),
    );
  }
}
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Report')),
      body: const Center(child: Text('Profile ')),
    );
  }
}
class Report extends StatelessWidget {
  const Report({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mudra ')),
      body: const Center(child: Text('Mudra content')),
    );
  }
}
class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          },
          child: const Text("Go to Profile"),
        ),
      ),
    );
  }
}























// import 'package:flutter/material.dart';
// import 'package:mudra/login_page.dart';
// import 'package:http/http.dart' as http;
// import 'package:mudra/profile.dart';
// import 'package:mudra/wallettxn.dart';
//
// import 'Report.dart';
// import 'mudra.dart';
// void main() {
//   runApp(const MyApp());
// }
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//
//       home: const DashboardPage(),
//
//     );
//   }
// }
// class DashboardPage extends StatefulWidget {
//   const DashboardPage({super.key});
//   @override
//   _DashboardPageState createState() => _DashboardPageState();
// }
// class _DashboardPageState extends State<DashboardPage> {
//   int _selectedIndex = 0;
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//
//     switch (index) {
//       case 0:
//       // Navigator.push(
//       //   context,
//       //   MaterialPageRoute(builder: (context) => const HomePage()),
//       // );
//         break;
//       case 1:
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => const UserProfileScreen()),
//         );
//         break;
//       case 2:
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => const MudraTransferScreen()),
//         );
//         break;
//       case 2:
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => const UserProfileScreen()),
//         );
//         break;
//     }
//   }
//   void _restartApp() {
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => const MyApp()),
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       appBar: AppBar(
//         title: const Text('Home'),
//         actions: [
//           Container(
//             child: Center(
//               child: IconButton(
//                 icon: Center(child: const Icon(Icons.restart_alt_outlined)),
//                 onPressed: _restartApp,
//               ),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: Colors.black,
//                     width: 2.0,
//                   ),
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//                 child: TextButton.icon(
//                   onPressed: () {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text('Wallet Txn tapped')),
//                     );
//                   },
//                   icon: const Icon(
//                     Icons.account_balance_wallet,
//                     size: 28,
//                     color: Colors.blue,
//                   ),
//                   label:InkWell(
//                     onTap: (){
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => PaymentScreen(),
//                         ),
//                       );
//                     },
//                     child: const Text(
//                       'Wallet Txn',
//                       style: TextStyle(
//                         color: Colors.blue,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: const EdgeInsets.all(0),
//           children: [
//             const UserAccountsDrawerHeader(
//               accountName: Text('vivek singh'),
//               accountEmail: Text('8292857341vivek@gmail.com'),
//               currentAccountPicture: CircleAvatar(
//                 backgroundColor: Colors.white,
//                 child: Icon(Icons.person, color: Colors.redAccent),
//               ),
//             ),
//             _buildDrawerSection(
//               title: 'General',
//               items: [
//                 _buildDrawerItem(
//                   icon: Icons.home,
//                   label: 'Home',
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                 ),
//                 _buildDrawerItem(
//                   icon: Icons.real_estate_agent_rounded,
//                   label: 'Mudra Request',
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                 ),
//                 _buildDrawerItem(
//                   icon: Icons.real_estate_agent_rounded,
//                   label: 'Mudra Request Report',
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                 ),
//                 _buildDrawerItem(
//                   icon: Icons.home_work_rounded,
//                   label: 'Simple Mudra',
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                 ),
//               ],
//             ),
//             _buildDrawerSection(
//               title: 'Reports',
//               items: [
//                 _buildDrawerItem(
//                   icon: Icons.receipt_long_outlined,
//                   label: 'Recharge Request',
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                 ),
//                 _buildDrawerItem(
//                   icon: Icons.receipt_long_outlined,
//                   label: 'Mudra Report',
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                 ),
//                 _buildDrawerItem(
//                   icon: Icons.receipt_long_outlined,
//                   label: 'AePS Report',
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                 ),
//                 _buildDrawerItem(
//                   icon: Icons.receipt_long_outlined,
//                   label: 'BBPS Report',
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                 ),
//                 _buildDrawerItem(
//                   icon: Icons.receipt_long_outlined,
//                   label: 'Credit Report',
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                 ),
//               ],
//             ),
//             _buildDrawerSection(
//               title: 'Account',
//               items: [
//                 _buildDrawerItem(
//                   icon: Icons.person,
//                   label: 'Profile',
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => const UserProfileScreen()),
//                     );
//                   },
//                 ),
//                 _buildDrawerItem(
//                   icon: Icons.currency_rupee_outlined,
//                   label: 'Mudra',
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => const AllReportsScreen()),
//                     );
//                   },
//                 ),
//               ],
//             ),
//             _buildDrawerSection(
//               title: 'Support',
//               items: [
//                 _buildDrawerItem(
//                   icon: Icons.help,
//                   label: 'Help',
//                   onTap: () {},
//                 ),
//                 _buildDrawerItem(
//                   icon: Icons.logout_outlined,
//                   label: 'Log Out',
//                   onTap: () {
//                     Navigator.pop(context);
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(builder: (context) => LoginPage()),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             _buildDashboardCards(context),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         backgroundColor: Colors.greenAccent,
//         selectedItemColor: Colors.blue,
//         unselectedItemColor: Colors.pink[200],
//         showUnselectedLabels: true,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.currency_rupee_outlined),
//             label: 'Mudra',
//
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person_2_outlined),
//             label: 'Profile',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.receipt_long_outlined),
//             label: 'Report',
//           ),
//
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//         ],
//       ),
//     );
//   }
//   Widget _buildIconItem(IconData icon, String label, String pageName) {
//     return InkWell(
//       onTap: () {
//         Navigator.pushNamed(context, pageName);
//       },
//       child: Column(
//         children: [
//           Icon(icon, size: 30),
//           Text(label),
//         ],
//       ),
//     );
//   }
//   Widget _buildDashboardCards(BuildContext context) {
//     return Column(
//       children: [
//         Card(
//           color: Colors.blueGrey,
//           elevation: 5,
//           child: Card(
//             elevation: 5.0,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(15.0),
//             ),
//             color: Colors.white,
//             child: Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   // Logo and Text Row
//                   Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Column(
//                             children: [
//                               ClipRRect(
//                                 borderRadius: BorderRadius.circular(12.0),
//                                 child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     children:[
//                                       Column(
//                                           children:[
//                                             Text(
//                                               'SM ID',
//                                               style: TextStyle(
//                                                 fontSize: 20,
//                                                 fontWeight: FontWeight.bold,
//                                                 color: Colors.grey[700],
//                                               ),
//
//                                             ),
//                                             Text(
//                                               'SMA10705',
//                                               style: const TextStyle(
//                                                 fontSize: 20,
//                                                 fontWeight: FontWeight.bold,
//                                                 color: Colors.blue,
//                                               ),
//                                             ),
//                                           ]),
//                                       SizedBox(width: 100,),
//                                       Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Image.network(
//                                           'https://media.licdn.com/dms/image/v2/D560BAQFQdflTKEIq6g/company-logo_200_200/company-logo_200_200/0/1700975597244?e=2147483647&v=beta&t=6qzLKUGJjU1Mx4x1sdFVlI8uR8QBpMJEwaw4AXDgSCE',
//                                           height: 150, // Increased height
//                                           width: 150, // Increased width
//                                           errorBuilder: (context, error, stackTrace) {
//                                             return Icon(
//                                               Icons.error,
//                                               color: Colors.red,
//                                               size: 100,
//                                             );
//                                           },
//                                         ),
//                                       ),
//                                     ]  ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 12),
//                       const SizedBox(height: 16),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           // Wallet One
//                           Column(
//                             children: const [
//                               Text(
//                                 'Wallet One',
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.blue,
//                                 ),
//                               ),
//                               SizedBox(height: 4),
//                               Text(
//                                 '₹ 0.72',
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Column(
//                             children: const [
//                               Text(
//                                 'Wallet Two',
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.blue,
//                                 ),
//                               ),
//                               SizedBox(height: 4),
//                               Text(
//                                 '₹ 0.0',
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//
//         const SizedBox(height: 25),
//         Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Card(
//             color: Colors.blueGrey,
//             elevation: 5,
//             child: Container(
//               child: Card(
//                 elevation: 5.0,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15.0),
//                 ),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     gradient: const LinearGradient(
//                       colors: [Colors.blueAccent,Colors.purpleAccent],
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                     ),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(15.0),
//                     child: Builder(
//                       builder: (context) {
//                         return Container(
//                           width: MediaQuery.of(context).size.width * 0.9,
//                           height: 250.0,
//                           padding: const EdgeInsets.all(10.0),
//                           child: Column(
//                             children: [
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   _buildIconItem(Icons.currency_rupee_outlined, 'Mudra', 'MudraPage'),
//
//                                   _buildIconItem(Icons.fingerprint_outlined, 'AePS', 'AEPSPage'),
//                                   _buildIconItem(Icons.credit_card, 'M_ATM', 'M_ATMPage'),
//                                   _buildIconItem(Icons.fingerprint, 'AEPS Sett', 'AEPSSettPage'),
//
//                                 ],
//                               ),
//
//                               const SizedBox(height: 50),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   _buildIconItem(Icons.wallet_giftcard_outlined, 'CMS', 'CMSPage'),
//                                   _buildIconItem(Icons.fingerprint, 'Cash Dep..', 'CashDepPage'),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(height: 30),
//         Card(
//           color: Colors.blueGrey,
//           elevation: 5,
//           child: Card(
//             elevation: 5.0,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(15.0),
//             ),
//             color: Colors.white,
//             child: Container(
//               decoration: BoxDecoration(
//                 gradient: const LinearGradient(
//                   colors: [Colors.blueAccent,Colors.purpleAccent],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: Builder(
//                   builder: (context) {
//                     return Container(
//                       width: MediaQuery.of(context).size.width * 0.9,
//                       height: 200.0,
//                       padding: const EdgeInsets.all(10.0),
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//
//                               _buildIconItem(Icons.mobile_off_outlined, 'Mobile', 'MobilePage'),
//                               _buildIconItem(Icons.electrical_services_outlined, 'Electricity', 'ElectricityPage'),
//                               _buildIconItem(Icons.broken_image_outlined, 'LIC', 'LICPage'),
//                               _buildIconItem(Icons.tapas_rounded, 'Account Opening', 'Account OpeningPage'),
//                             ],
//                           ),
//                           const SizedBox(height: 20),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//
//                               _buildIconItem(Icons.lightbulb_outline, 'BBPS', 'BBPSPage'),
//                             ],
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildDrawerSection({required String title, required List<Widget> items}) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//           child: Align(
//             alignment: Alignment.centerLeft,
//             child: Text(
//               title,
//               style: const TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//         Column(
//           children: items,
//         ),
//       ],
//     );
//   }
//   Widget _buildDrawerItem({required IconData icon, required String label, required VoidCallback onTap}) {
//     return ListTile(
//       leading: Icon(icon),
//       title: Text(label),
//       onTap: onTap,
//     );
//   }
// }
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Home Page')),
//       body: const Center(child: Text('Welcome to Home')),
//     );
//   }
// }
// class SearchPage extends StatelessWidget {
//   const SearchPage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Profile Page')),
//       body: const Center(child: Text('Profile Page')),
//     );
//   }
// }
// class ProfilePage extends StatelessWidget {
//   const ProfilePage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Report')),
//       body: const Center(child: Text('Profile ')),
//     );
//   }
// }
// class Report extends StatelessWidget {
//   const Report({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Mudra ')),
//       body: const Center(child: Text('Mudra content')),
//     );
//   }
// }
// class Dashboard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Home Page"),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => ProfilePage()),
//             );
//           },
//           child: const Text("Go to Profile"),
//         ),
//       ),
//     );
//   }
// }
