import 'package:flutter/material.dart';
import '../models/bookModels.dart';

class DetailPage extends StatelessWidget {
  final BookModel book;
  const DetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  book.imageUrl,
                  height: 250,
                ),
              ),
              SizedBox(height: 16),
              Text(
                book.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text("Penulis: ${book.author}"),
              Text("Tahun Terbit: ${book.year}"),
              Text("Genre: ${book.genre}"),
              Text("Penerbit: ${book.publisher}"),
              Text("Jumlah Halaman: ${book.pages}"),
              Text("Rating: ${book.rating}"),
              SizedBox(height: 12),
              Text(
                "Sinopsis:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(book.description),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Kembali ke Home"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
