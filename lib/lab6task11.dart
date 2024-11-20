import 'package:flutter/material.dart';

void main() {
  runApp(AimanApp());
}

class AimanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('My Images')),
        ),
        body: ResponsiveGrid(),
      ),
    );
  }
}

class ResponsiveGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int columns = 2;

        if (constraints.maxWidth > 600) {
          columns = 3;
        }
        if (constraints.maxWidth > 900) {
          columns = 4;
        }

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: 15, // Adjusted to match the number of images
          itemBuilder: (context, index) {
            return Container(
              color: const Color.fromARGB(255, 176, 174, 179),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://i.natgeofe.com/n/985f26d4-d0f2-4a52-a936-8f07f414b9a5/NationalGeographic_2791022.jpg?w=2560&h=1706',
                    height: 215,
                    width: 215,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Image ${index + 1}',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 39, 56, 53),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
