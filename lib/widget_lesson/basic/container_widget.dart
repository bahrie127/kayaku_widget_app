import 'package:flutter/material.dart';

class ContainerWidget extends StatefulWidget {
  const ContainerWidget({super.key});

  @override
  State<ContainerWidget> createState() => _ContainerWidgetState();
}

class _ContainerWidgetState extends State<ContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Code with Bahri'),
        elevation: 10,
        centerTitle: true,
        leading: Icon(Icons.menu),
        actions: [
          IconButton(
            onPressed: () {
              print('Search button pressed');
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              print('Search button pressed');
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Text(
              'Banner Text',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                letterSpacing: 3,
                wordSpacing: 5,
                // color: Colors.red,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(onPressed: () {}, child: Text('Click Me')),
          SizedBox(height: 20),
          Icon(Icons.favorite, size: 50, color: Colors.red),

          SizedBox(height: 20),
          Image.network('https://petrokayaku.com/images/logo.png', width: 200),
          SizedBox(height: 20),
          Image.asset('assets/images/obat.png', height: 200),
          SizedBox(height: 20),
          CircleAvatar(
            radius: 55,
            backgroundColor: Colors.red,
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/obat.png'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
