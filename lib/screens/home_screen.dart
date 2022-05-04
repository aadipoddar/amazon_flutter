import 'package:amazon_flutter/model/user_details_model.dart';
import 'package:amazon_flutter/utils/constants.dart';
import 'package:amazon_flutter/widgets/banner_add_widget.dart';
import 'package:amazon_flutter/widgets/categories_horizontal_list_view_bar.dart';
import 'package:amazon_flutter/widgets/products_showcase_list_view.dart';
import 'package:amazon_flutter/widgets/search_bar_widget.dart';
import 'package:amazon_flutter/widgets/user_details_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        offset = controller.offset;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(
        isReadOnly: true,
        hasBackButton: false,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: controller,
            child: Column(
              children: [
                const SizedBox(height: kAppBarHeight / 3),
                const CategoriesHorizontalListViewBar(),
                const AdBannerWidget(),
                ProductsShowcaseListView(
                  title: "Upto 70% Off",
                  children: testChildren,
                ),
                ProductsShowcaseListView(
                  title: "Upto 60% Off",
                  children: testChildren,
                ),
                ProductsShowcaseListView(
                  title: "Upto 50% Off",
                  children: testChildren,
                ),
                ProductsShowcaseListView(
                  title: "Explore More",
                  children: testChildren,
                ),
              ],
            ),
          ),
          UserDetailsBar(offset: offset),
        ],
      ),
    );
  }
}
