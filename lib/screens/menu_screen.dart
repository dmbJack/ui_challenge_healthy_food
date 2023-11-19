import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_healthy_food/models/product_model.dart';
import 'package:ui_healthy_food/widgets/custom_choice.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../utils/constants.dart';
import '../widgets/custom_paint_design.dart';
import 'product_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(children: [
            CustomPaintDesign(
              height: MediaQuery.of(context).size.height / 3,
            ),
            Positioned(
              left: 20,
              top: 40,
              child: Text(
                "Let's feed\nhealthy food",
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
                right: 20,
                top: 50,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.5)),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.my_library_books,
                        size: 30,
                      )),
                )),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.09),
              child: Center(
                child: Image.asset(
                  AssetConstant.cuisinierImg,
                  width: MediaQuery.of(context).size.width / 2.2,
                ),
              ),
            ),
          ]),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CustomChoice(
                  label: "BreakFast",
                  func: () {},
                  isSelected: true,
                ),
                CustomChoice(label: "Lunch", func: () {}),
                CustomChoice(label: "Dinner", func: () {}),
                CustomChoice(label: "Drinks", func: () {}),
              ],
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: MasonryGridView.builder(
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                itemCount: ProductModel.products.length,
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductScreen(
                                  product: ProductModel.products[index])));
                    },
                    child: SizedBox(
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(clipBehavior: Clip.none, children: [
                              Hero(
                                tag: ProductModel.products[index].name +
                                    ProductModel.products[index].price
                                        .toString(),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    ProductModel.products[index].image,
                                    fit: BoxFit.cover,
                                    width: MediaQuery.of(context).size.width *
                                        0.42,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: -10,
                                bottom: -10,
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: ColorsPallete.primaryColor,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.add)),
                                ),
                              )
                            ]),
                            Text(
                              ProductModel.products[index].name,
                              style: GoogleFonts.poppins(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${ProductModel.products[index].price} €",
                              style: GoogleFonts.poppins(
                                  color: Colors.red,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ))
        ],
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavigationButton(icon: Icons.home, isSelected: true),
            NavigationButton(icon: Icons.search, isSelected: false),
            NavigationButton(icon: Icons.notifications, isSelected: false),
            NavigationButton(icon: Icons.person, isSelected: false),
          ],
        ),
      ),
    );
  }
}

class NavigationButton extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final void Function()? onTap;
  const NavigationButton({
    super.key,
    required this.icon,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(right: 10, left: 10, top: 20),
        height: 70,
        decoration: BoxDecoration(
          color: isSelected ? ColorsPallete.primaryColor : Colors.transparent,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 33,
              color: Colors.black.withOpacity(0.6),
            ),
            Container(
              width: 20,
              height: 5,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
            )
          ],
        ),
      ),
    );
  }
}
