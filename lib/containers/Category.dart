import 'package:flutter/material.dart';
import 'package:medic_book/widgets/Category/CategoryContent.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book category"),
        centerTitle: true,
        elevation: 0,
      ),
      body: CategoryContent(),
    );
  }
}
