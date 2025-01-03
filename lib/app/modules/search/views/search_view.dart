import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../routes/app_pages.dart';
import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchControllers> {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchControllers>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () => Get.back(),
            ),
            title: Text(
              "Search Food",
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              // حقل البحث
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: controller.search_Controller,
                  decoration: InputDecoration(
                    hintText: "Search for food...",
                    hintStyle: GoogleFonts.inter(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) => controller.searchCall(value),
                ),
              ),
              // النتائج أو النص الافتراضي
              Expanded(
                child: controller.isLoading
                    ? Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                )
                    : controller.productResults.isEmpty && controller.restaurantResults.isEmpty
                    ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search_off,
                        size: 60,
                        color: Colors.grey[400],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "No results found",
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                )
                    : ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    if (controller.productResults.isNotEmpty) ...[
                      Text(
                        "Products",
                        style: GoogleFonts.inter(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ...controller.productResults.map((product) => Card(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: InkWell(
                          onTap: (){
                            Get.toNamed(
                              Routes.PRODUCT_DETAILS,
                              arguments: {
                                "product_id": int.parse(
                                    product.id.toString()),
                              },
                            );
                          },
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.orange[50],
                              child: const Icon(
                                Icons.fastfood,
                                color: Colors.orange,
                              ),
                            ),
                            title: Text(
                              product.enName ?? "Unnamed",
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                            subtitle: Text(
                              product.description ?? "No description available",
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 18,
                              color: Colors.grey,
                            ),
                            onTap: () {
                              Get.toNamed(
                                Routes.PRODUCT_DETAILS,
                                arguments: {
                                  "product_id": int.parse(
                                      product.id.toString()),
                                },
                              );
                            },
                          ),
                        ),
                      )),
                    ],
                    if (controller.restaurantResults.isNotEmpty) ...[
                      const SizedBox(height: 16),
                      Text(
                        "Restaurants",
                        style: GoogleFonts.inter(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ...controller.restaurantResults.map((restaurant) => Card(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: InkWell(
                          onTap: (){
                            Get.toNamed(Routes.RESTAURANT_DETAILS,
                                arguments: {"res_id": restaurant.id});
                          },
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: restaurant.photo != null
                                  ? NetworkImage(restaurant.photo!)
                                  : null,
                              backgroundColor: Colors.grey[200],
                              child: restaurant.photo == null
                                  ? const Icon(
                                Icons.restaurant,
                                color: Colors.orange,
                              )
                                  : null,
                            ),
                            title: Text(
                              restaurant.enName ?? "Unnamed",
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                            subtitle: Text(
                              restaurant.address ?? "No address available",
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 18,
                              color: Colors.grey,
                            ),
                            onTap: () {
                              Get.toNamed(Routes.RESTAURANT_DETAILS,
                                  arguments: {"res_id": restaurant.id});
                            },
                          ),
                        ),
                      )),
                    ],
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}