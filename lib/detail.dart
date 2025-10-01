import 'package:flutter/material.dart';
import 'vehicle_data.dart';

class DetailPage extends StatelessWidget {
  final Vehicle vehicle;
  const DetailPage({super.key, required this.vehicle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          vehicle.name,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 62, 31, 106),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8), 
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16), 
                child: Image.network(
                  vehicle.imageUrls.first,
                ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Deskripsi",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    vehicle.description,
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.black, height: 1.5),
                  ),
                  const SizedBox(height: 24),

                  Text(
                    "Detail Kendaraan",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  _buildDetailRow(label: "Tipe", value: vehicle.type),
                  _buildDetailRow(label: "Harga", value: vehicle.price),
                  _buildDetailRow(label: "Bahan Bakar", value: vehicle.fuelType),
                  _buildDetailRow(label: "Mesin", value: vehicle.engine),
                  const SizedBox(height: 24),

                  Text(
                    "Galeri",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 120, 
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: vehicle.imageUrls.length,
                      itemBuilder: (context, index) {
                        final imageUrl = vehicle.imageUrls[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0), 
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              imageUrl,
                              width: 200, 
                              height: 120, 
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow({
    required String label, 
    required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          const SizedBox(width: 12),
          Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
          const Spacer(),
          Text(value),
        ],
      ),
    );
  }
}