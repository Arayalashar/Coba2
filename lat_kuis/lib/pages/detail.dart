import 'package:flutter/material.dart';
import '../models/bookModels.dart';

class DetailPage extends StatefulWidget {
  final BookModel book;
  const DetailPage({super.key, required this.book});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book.title),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite, 
              color: isFavorite ? Colors.red : Colors.grey,
            ),
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(isFavorite 
                      ? '${widget.book.title} ditambahkan ke Wishlist' 
                      : '${widget.book.title} dihapus dari Wishlist'),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  widget.book.imageUrl,
                  height: 250,
                ),
              ),
              SizedBox(height: 16),
              Text(
                widget.book.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text("Penulis: ${widget.book.author}"),
              Text("Tahun Terbit: ${widget.book.year}"),
              Text("Genre: ${widget.book.genre}"),
              Text("Penerbit: ${widget.book.publisher}"),
              Text("Jumlah Halaman: ${widget.book.pages}"),
              Text("Rating: ${widget.book.rating}"),
              SizedBox(height: 12),
              Text(
                "Sinopsis:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(widget.book.description),
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
