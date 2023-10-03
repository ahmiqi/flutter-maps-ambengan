import 'package:flutter/material.dart';

class Beranda extends StatefulWidget {
  const Beranda({Key? key}) : super(key: key);

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 280,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/map.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              child: GridView.count(
                crossAxisCount: 4,
                shrinkWrap: true,
                children: [
                  MenuWidget(
                    icon: Icons.image_outlined,
                    text: "Dam",
                  ),
                  MenuWidget(
                    icon: Icons.image_outlined,
                    text: "Crops",
                  ),
                  MenuWidget(
                    icon: Icons.image_outlined,
                    text: "Destination",
                  ),
                  MenuWidget(
                    icon: Icons.image_outlined,
                    text: "Water",
                  ),
                ],
              ),
            ),
            DataAnalyticsWidget(),
          ],
        ),
      ),
    );
  }
}

class MenuWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  const MenuWidget({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 50,
          color: Colors.blueAccent,
        ),
        SizedBox(height: 10),
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

class DataAnalyticsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 75),
          SizedBox(height: 75),
          ElevatedButton(
            onPressed: () {
              // Tambahkan aksi yang sesuai di sini
            },
            child: Text("Lihat Detail Cuaca"),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Beranda(),
  ));
}
