import 'package:flutter/material.dart';
import '../models/bookModels.dart';
import 'detail.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: bookList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(book: bookList[index]),
                ),
              );
            },
            child: ListTile(
              title: Text(
                bookList[index].title,
                style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(bookList[index].author),
              leading: Image.network(bookList[index].imageUrl, width: 50, height: 50, fit: BoxFit.cover),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.favorite_border, color: Colors.red),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${bookList[index].title} ditambahkan ke Wishlist')),
                      );
                    },
                  ),
                  const Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
          );
        });
  }
}
