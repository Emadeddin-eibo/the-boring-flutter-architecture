import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FakeImageUploader extends StatefulWidget {
  final Function(String) onImageSelected;

  const FakeImageUploader({super.key, required this.onImageSelected});

  @override
  FakeImageUploaderState createState() => FakeImageUploaderState();
}

class FakeImageUploaderState extends State<FakeImageUploader> {
  Future<List<String>> _fetchImages() async {
    List<String> urls = [];
    try {
      for (int i = 0; i < 5; i++) {
        final response = await http.get(
          Uri.parse(
            "https://picsum.photos/200?random=${Random().nextInt(10000)}",
          ),
        );
        if (response.statusCode == 200) {
          urls.add(response.request!.url.toString());
        }
      }
    } catch (e) {
      print("Error fetching images: $e");
    }
    return urls;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 20),
        const Text(
          "Fake Gallery...",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(16),
          height: 400,
          child: FutureBuilder<List<String>>(
            future: _fetchImages(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError ||
                  !snapshot.hasData ||
                  snapshot.data!.isEmpty) {
                return const Center(child: Text("Failed to load images"));
              }
              final images = snapshot.data!;
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemCount: images.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            widget.onImageSelected(images[index]);
                            Navigator.pop(context);
                          },
                          child: Image.network(
                            images[index],
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
