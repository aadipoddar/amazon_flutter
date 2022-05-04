import 'package:amazon_flutter/model/product_model.dart';
import 'package:amazon_flutter/model/review_model.dart';
import 'package:amazon_flutter/utils/color_themes.dart';
import 'package:amazon_flutter/utils/constants.dart';
import 'package:amazon_flutter/utils/utils.dart';
import 'package:amazon_flutter/widgets/cost_widget.dart';
import 'package:amazon_flutter/widgets/custom_main_button.dart';
import 'package:amazon_flutter/widgets/custom_simple_rounded_button.dart';
import 'package:amazon_flutter/widgets/rating_star_widget.dart';
import 'package:amazon_flutter/widgets/review_dialog.dart';
import 'package:amazon_flutter/widgets/review_widget.dart';
import 'package:amazon_flutter/widgets/search_bar_widget.dart';
import 'package:amazon_flutter/widgets/user_details_bar.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  final ProductModel productModel;
  const ProductScreen({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Expanded spaceThingy = Expanded(child: Container());
  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return SafeArea(
      child: Scaffold(
        appBar: SearchBarWidget(isReadOnly: true, hasBackButton: true),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: screenSize.height -
                          (kAppBarHeight + (kAppBarHeight / 2)),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: kAppBarHeight / 2,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 5),
                                      child: Text(
                                        widget.productModel.sellerName,
                                        style: const TextStyle(
                                            color: activeCyanColor,
                                            fontSize: 16),
                                      ),
                                    ),
                                    Text(widget.productModel.productName),
                                  ],
                                ),
                                RatingStatWidget(
                                    rating: widget.productModel.rating),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Container(
                              height: screenSize.height / 3,
                              constraints: BoxConstraints(
                                maxHeight: screenSize.height / 3,
                              ),
                              child: Image.network(widget.productModel.url),
                            ),
                          ),
                          spaceThingy,
                          CostWidget(
                            color: Colors.black,
                            cost: widget.productModel.cost,
                          ),
                          spaceThingy,
                          CustomMainButton(
                            child: const Text(
                              "Buy Now",
                              style: TextStyle(color: Colors.black),
                            ),
                            color: Colors.orange,
                            isLoading: false,
                            onPressed: () {},
                          ),
                          spaceThingy,
                          CustomMainButton(
                            child: const Text(
                              "Add to cart",
                              style: TextStyle(color: Colors.black),
                            ),
                            color: yellowColor,
                            isLoading: false,
                            onPressed: () {},
                          ),
                          spaceThingy,
                          CustomSimpleRoundedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => const ReviewDialog(),
                              );
                            },
                            text: "Add a review for this product",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height,
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return const ReviewWidget(
                            review: ReviewModel(
                              senderName: "Rick",
                              description: "Very Good Product",
                              rating: 3,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const UserDetailsBar(offset: 0)
          ],
        ),
      ),
    );
  }
}
