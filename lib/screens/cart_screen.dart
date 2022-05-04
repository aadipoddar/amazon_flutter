import 'package:amazon_flutter/model/product_model.dart';
import 'package:amazon_flutter/model/user_details_model.dart';
import 'package:amazon_flutter/utils/color_themes.dart';
import 'package:amazon_flutter/utils/constants.dart';
import 'package:amazon_flutter/widgets/cart_item_widget.dart';
import 'package:amazon_flutter/widgets/custom_main_button.dart';
import 'package:amazon_flutter/widgets/search_bar_widget.dart';
import 'package:amazon_flutter/widgets/user_details_bar.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(
        hasBackButton: false,
        isReadOnly: true,
      ),
      body: Center(
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: kAppBarHeight / 2,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomMainButton(
                    child: const Text(
                      "Proceed to buy (n) items",
                      style: TextStyle(color: Colors.black),
                    ),
                    color: yellowColor,
                    isLoading: false,
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return CartItemWidget(
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
            const UserDetailsBar(offset: 0),
          ],
        ),
      ),
    );
  }
}
