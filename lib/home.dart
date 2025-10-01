import 'package:flutter/material.dart';
import 'vehicle_data.dart';
import 'detail.dart';
import 'login.dart';

class HomePage extends StatelessWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home", 
          style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                )
          ),
        actions: <Widget>[ 
          Text(
          "Selamat datang, $username! ", 
          style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 255, 255, 255),
                )
          ),
          IconButton(
            icon: Icon(Icons.logout, color: Colors.white), 
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => LoginPage()),
                (route) => false,
              );
            },
          ), 
        ],
        backgroundColor: Color.fromARGB(255, 62, 31, 106),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1.5, crossAxisSpacing: 5, mainAxisSpacing: 5,),
        itemCount: vehicleList.length,
        itemBuilder: (context, index) {
          final vehicle = vehicleList[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => DetailPage(vehicle: vehicle)));
            },
            child: Card(
              color: Color.fromARGB(255, 222, 204, 247),
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      child: Image.network(
                        vehicle.imageUrls.first,
                        fit: BoxFit.cover,
                      ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      vehicle.name,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
