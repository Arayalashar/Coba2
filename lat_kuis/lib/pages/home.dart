import 'package:flutter/material.dart';
import '../models/bookModels.dart';
import 'detail.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Set<int> favoriteIndexes = {};

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: bookList.length,
        itemBuilder: (context, index) {
          bool isFav = favoriteIndexes.contains(index);
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
                    icon: Icon(
                      isFav ? Icons.favorite : Icons.favorite, 
                      color: isFav ? Colors.red : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        if (isFav) {
                          favoriteIndexes.remove(index);
                        } else {
                          favoriteIndexes.add(index);
                        }
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(isFav 
                              ? '${bookList[index].title} dihapus dari Wishlist' 
                              : '${bookList[index].title} ditambahkan ke Wishlist'),
                        ),
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
