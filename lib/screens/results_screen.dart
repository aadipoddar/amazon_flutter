import 'package:amazon_flutter/model/product_model.dart';
import 'package:amazon_flutter/widgets/results_widget.dart';
import 'package:amazon_flutter/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  final String query;
  const ResultsScreen({
    Key? key,
    required this.query,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(isReadOnly: false, hasBackButton: true),
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "Showing results for ",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    TextSpan(
                      text: query,
                      style: const TextStyle(
                        fontSize: 17,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2 / 3,
              ),
              itemBuilder: (context, index) {
                return ResultsWidget(
                  product: ProductModel(
                    url:
                        "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png",
                    productName: "Mobile Phone - Apple Iphone X",
                    cost: 15000,
                    discount: 0,
                    uid: "jsbajsabh",
                    sellerName: "Rick Seller",
                    sellerUid: "665116as",
                    rating: 1,
                    noOfRating: 1,
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
