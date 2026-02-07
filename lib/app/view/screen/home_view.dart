
import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_text_styles.dart';
import '../../core/utils/image_path.dart';

import '../widget/food_card.dart';

class HomeView extends StatelessWidget{
  HomeView({super.key});

  final TextEditingController _searchTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildCustomLocationRow(),
                const SizedBox(height: 8),
                _buildSearchBar(),
                const SizedBox(height: 20),
                _buildContainer(context),
                const SizedBox(height: 10),
                const SizedBox(height: 2),
                _buildProduct(),

                const SizedBox(height: 10),
                _buildPopularGridView(),
                const SizedBox(height: 10),
                const SizedBox(height: 5),
              //  Text("Delivery fee included!", style: TextStyle(fontSize: 16)),
                const SizedBox(height: 5),
                _buildMealForOneGridView(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPopularGridView() {

    return GridView.builder(
          itemCount: 4,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.72,
          ),
          itemBuilder: (context, index) {

            return GestureDetector(
              onTap: () {
                /*Get.to(
                  () => ProductDetailsScreen(
                    imageUrl: data.food.foodImageUrl,
                    title: data.food.name,
                    rating: data.averageRating,
                    price: data.food.price,
                    description: data.food.description,
                    foodId: data.foodId,
                    variations: data.food.variations,
                  ),
                );*/
              },
              child: FoodCard(imageUrl: '', title: '',
                // imageUrl: data.food.foodImageUrl,
                // title: data.food.name,
                // rating: data.averageRating,
                // price: data.food.price,
                // onAdd: () {},
               // cardHeight: 127,
              ),
            );
          },
        );

  }

  Widget _buildMealForOneGridView() {

     return GridView.builder(
      itemCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 12,
        mainAxisSpacing: 8,
        childAspectRatio: 0.72,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            /*Get.to(
                    () => ProductDetailsScreen(
                      imageUrl: data.foodImageUrl,
                      title: data.name,
                      rating: data.foodRatings.averageRating,
                      price: data.price,
                      description: data.description,
                      foodId: data.id,
                      variations: data.variations,
                    ),
                  );*/
          },
          child: FoodCard(imageUrl: '', title: '',
            // imageUrl: data.foodImageUrl,
            // title: data.name,
            // rating: data.foodRatings.averageRating,
            // price: data.price,
            // onAdd: () {},
            // cardHeight: 135,
          ),
        );
      },
    );
       // }

  }

  Widget _buildProduct() {
    return  SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 2,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 160,
                  child: GestureDetector(
                    onTap: () {

                    },
                    child: FoodCard(
                      showRating: false,
                      showAddButton: false,
                      imageUrl:'',
                      title: 'menuData.name',
                      rating: 5.8,
                      onAdd: () {},
                      cardHeight: 140,
                    ),
                  ),
                ),
              );
            },
          ),
    );
  }

  Widget _buildContainer(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenWidth < 400 ? 160 : 200,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Share the love",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth < 400 ? 12 : 14,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Enjoy \n30% off",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth < 400 ? 20 : 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      "Code : Developer",
                      style: TextStyle(
                        fontSize: screenWidth < 400 ? 14 : 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  ImagePath.footItem,
                  height: screenWidth < 400 ? 250 : 200,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomLocationRow() {
    return Row(
      children: [
        Icon(Icons.location_on_outlined),
        Text("Shaistaganj", style: AppTextStyles.medium18),
        Spacer(),
        IconButton(
          onPressed: () {
          },
          icon: Icon(Icons.notifications),
        ),
      ],
    );
  }
  Widget _buildSearchBar() {
    return  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBar(
              backgroundColor: WidgetStateProperty.all(AppColors.greyLightColor),
              controller: _searchTEController,
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              elevation: WidgetStateProperty.all(0.0),
              leading: IconButton(
                onPressed: () async {
                  if (_searchTEController.text.isNotEmpty) {

                  }
                },
                icon: const Icon(
                  Icons.search,
                  size: 28,
                  color: AppColors.darkBlackColor,
                ),
              ),
              hintText: "Search for food",
              hintStyle: WidgetStateProperty.all(
                const TextStyle(
                  color: AppColors.darkBlackColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              onChanged: (value) {
                if (value.isNotEmpty) {
                } else {

                }
              },

              onSubmitted: (value) async {
                if (value.isNotEmpty) {
                }
              },
            ),
          ],

    );
  }

}
