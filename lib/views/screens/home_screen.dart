import 'package:flutter/material.dart';
import 'package:p_five_ecommerce/models/category_model.dart';
import 'package:p_five_ecommerce/models/product_model.dart';
import 'package:p_five_ecommerce/services/api_handler.dart';
import 'package:p_five_ecommerce/views/screens/search_screen.dart';
// import 'package:p_five_ecommerce/views/screens/search_screen.dart';

import 'package:p_five_ecommerce/views/widgets/category_card.dart';
import 'package:p_five_ecommerce/views/widgets/loading_widget.dart';
import 'package:p_five_ecommerce/views/widgets/product_card.dart';
import 'package:p_five_ecommerce/views/widgets/sale_banner.dart';
import 'package:p_five_ecommerce/views/widgets/search_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          SearchField(
            searchTextController: _searchText,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchScreen(
                    searchText: _searchText.text,
                  ),
                ),
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: SizedBox(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SaleBanner(),
                    FutureBuilder(
                      future: APIHandler.getAllCategories(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Container();
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text('Error ${snapshot.error}'),
                          );
                        } else if (snapshot.data == null) {
                          return Center(
                            child:
                                Image.asset('images/empty_shopping_cart.png'),
                          );
                        }
                        return SizedBox(
                          height: 30,
                          width: double.infinity,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              CategoryModel category = snapshot.data![index];
                              return CategoryCard(
                                category: category,
                              );
                            },
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FutureBuilder(
                      future: APIHandler.getAllProducts(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const LoadingWidget();
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text('Error ${snapshot.error}'),
                          );
                        } else if (snapshot.data == null) {
                          return Center(
                            child:
                                Image.asset('images/empty_shopping_cart.png'),
                          );
                        }
                        return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 9,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 3,
                            mainAxisSpacing: 3,
                            childAspectRatio: 0.6,
                          ),
                          itemBuilder: (context, index) {
                            ProductModel product = snapshot.data![index];
                            return ProductCard(
                              product: product,
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
