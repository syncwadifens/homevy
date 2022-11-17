import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homevy/controllers/product_controller.dart';
import 'package:homevy/theme/styles.dart';
import 'package:homevy/ui/pages/cart_page.dart';
import 'package:homevy/ui/pages/profile_page.dart';
import 'package:homevy/ui/pages/wishlist_page.dart';
import 'package:homevy/ui/widgets/home_category_item.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final productController = Get.put(ProductController());
    return Scaffold(
      backgroundColor: bgColor,
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  Get.to(() => const HomePage());
                },
                icon: Icon(Icons.home, color: blackColor)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  Get.to(() => const WishlistPage());
                },
                icon: Icon(Icons.favorite, color: blackColor)),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  Get.to(() => const CartPage());
                },
                icon: Icon(Icons.shopping_cart, color: blackColor)),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  Get.to(() => const ProfilePage());
                },
                icon: Icon(Icons.person, color: blackColor)),
            label: 'Profile',
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 20,
                      left: 24,
                      right: 24,
                    ),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: whiteColor,
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.search,
                          size: 17.5,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Try “Sofa”, “Chair”, “Table”',
                          style: greyTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 24,
                right: 24,
              ),
              child: Text(
                'Category',
                style: blackTextStyle.copyWith(
                  fontSize: 23,
                  fontWeight: bold,
                ),
              ),
            ),
            CarouselSlider(
              items: const [
                HomeCategoryItem(
                  title: 'Chair',
                  subtitle: 'Sahaja, Kiya Dinning...',
                  imageUrl: 'assets/chair.png',
                ),
                HomeCategoryItem(
                  title: 'Table',
                  subtitle: 'Sahaja, Kiya Dinning...',
                  imageUrl: 'assets/table.png',
                ),
                HomeCategoryItem(
                  title: 'Chair',
                  subtitle: 'Sahaja, Kiya Dinning...',
                  imageUrl: 'assets/chair.png',
                ),
                HomeCategoryItem(
                  title: 'Table',
                  subtitle: 'Sahaja, Kiya Dinning...',
                  imageUrl: 'assets/table.png',
                ),
              ],
              options: CarouselOptions(
                height: 148,
                enableInfiniteScroll: false,
                viewportFraction: 1,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 20,
                left: 24,
                right: 24,
              ),
              child: Text(
                'Product For You',
                style: blackTextStyle.copyWith(
                  fontSize: 22,
                  fontWeight: bold,
                ),
              ),
            ),
            Obx(() => productController.isLoading.value
                ? const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: GridView.builder(
                        itemCount:
                            productController.productData!.data.products.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                                mainAxisExtent: 200),
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: whiteColor,
                                  boxShadow: [
                                    BoxShadow(
                                        offset: const Offset(0, 5),
                                        spreadRadius: 1,
                                        blurRadius: 3,
                                        color: greyColor),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Image.network(productController
                                            .productData!
                                            .data
                                            .products[index]
                                            .image),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  productController
                                                      .productData!
                                                      .data
                                                      .products[index]
                                                      .name,
                                                  style: subtitleStyle.copyWith(
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5),
                                                  child: Text(
                                                    NumberFormat.currency(
                                                            locale: 'id',
                                                            symbol: 'Rp',
                                                            decimalDigits: 2)
                                                        .format(
                                                            productController
                                                                .productData!
                                                                .data
                                                                .products[index]
                                                                .harga),
                                                    style:
                                                        subtitleStyle.copyWith(
                                                            color: primaryColor,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  )),
          ],
        ),
      ),
    );
  }
}
