import 'package:flixo_app/widget/main_appbar.dart';
import 'package:flixo_app/widget/main_bottom_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const routName = "/homepage";
  HomePage({required this.title, super.key});
  final String title;
  final List<Map> myProduct =
      List.generate(5, (index) => {"id": index, "name": "Product $index"});
  final bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: MainAppBar(),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: myProduct.length,
        itemBuilder: (BuildContext context, int categoryIndex) {
          return CategoryColumn(
              myProduct: myProduct, categoryIndex: categoryIndex);
        },
      ),
      bottomNavigationBar: const MainBottomBar(
        isVisible: true,
        isElevated: true,
      ),
      floatingActionButton: isVisible
          ? FloatingActionButton(
              onPressed: () {},
              tooltip: 'Add New Item',
              elevation: true ? 10.0 : null,
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}

class CategoryColumn extends StatelessWidget {
  const CategoryColumn(
      {required this.myProduct, required this.categoryIndex, super.key});
  final List<Map<dynamic, dynamic>> myProduct;
  final int categoryIndex;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 15, bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Kategoria $categoryIndex"),
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: myProduct.length,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 250,
                  child: Card(
                    color: Colors.black,
                    child: ListTile(
                      title: Text('Entry ${myProduct[index][index]}',
                          style: const TextStyle(color: Colors.white)),
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
