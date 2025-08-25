import 'package:flutter/material.dart';
import 'package:kayaku_widget_app/widget_lesson/layouting/product_model.dart';
import 'package:kayaku_widget_app/widget_lesson/layouting/student_model.dart';

class LayoutingPage extends StatefulWidget {
  const LayoutingPage({super.key});

  @override
  State<LayoutingPage> createState() => _LayoutingPageState();
}

class _LayoutingPageState extends State<LayoutingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.blue,
            alignment: Alignment.center,
            child: Text(
              'Header',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: products.length,
          //     itemBuilder: (context, index) {
          //       return ListTile(
          //         title: Text(products[index].name),
          //         subtitle: Text(
          //           '${products[index].description}\nPrice: \$${products[index].price.toStringAsFixed(2)}',
          //         ),
          //         leading: CircleAvatar(
          //           backgroundImage: NetworkImage(products[index].imageUrl),
          //           radius: 35,
          //         ),

          //         trailing: Icon(Icons.arrow_forward),
          //       );
          //     },
          //   ),
          // ),
          //grid view builder
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 8 / 10, // Adjust aspect ratio as needed
              ),
              itemCount: products.length,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [
                        Image.network(
                          products[index].imageUrl,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 5),
                        Text(
                          products[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.money, size: 16),
                            SizedBox(width: 5),
                            Text(
                              products[index].price.toStringAsFixed(2),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        // SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            // Action on button press
                          },
                          child: Row(
                            children: [
                              Text('View Details'),
                              SizedBox(width: 5),
                              Icon(Icons.arrow_forward_ios, size: 16),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
