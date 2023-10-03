import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:map/Page/Line_cart.dart';
import 'package:map/Page/beranada_page.dart';
import 'package:map/Page/list.dart';
import 'package:map/Page/setting_page.dart';
import 'package:map/pages/slidingUP.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required Type String}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  final screens = [
    Beranda(),
    SettingPage(),
    SlidingUP(),
    SlidingUP(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time Series'),
        elevation: 10,
        backgroundColor: Colors.black,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.line_axis),
              title: Text('LineChart'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => line()));
              },
            ),
            ListTile(
              leading: Icon(Icons.perm_device_information),
              title: Text('Information'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LocationList()));
              },
            ),
          ],
        ),
      ),
      body: screens[index],
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: GNav(
            backgroundColor: Colors.black12,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.cyan,
            gap: 5,
            selectedIndex: index,
            onTabChange: (index) {
              print(index);
              switch (index) {
                case 0:
                  // Navigator.push untuk halaman pertama jika diperlukan
                  break;
                case 1:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SlidingUP()),
                  );
                  break;
                case 2:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => line()),
                  );
                  break;
                case 3:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LocationList()),
                  );
                  break;
              }
            },
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.location_on,
                text: 'Location',
              ),
              GButton(
                icon: Icons.stacked_line_chart,
                text: 'LineChart',
              ),
              GButton(
                icon: Icons.info_outline_rounded,
                text: 'Information',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
