import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_healthy_food/models/product_model.dart';
import 'package:ui_healthy_food/utils/constants.dart';

class ProductScreen extends StatelessWidget {
  final ProductModel product;
  const ProductScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 15, left: 15, top: 60),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                Hero(
                  tag: product.name + product.price.toString(),
                  child: Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width / 10),
                      image: DecorationImage(
                          image: AssetImage(product.image), fit: BoxFit.cover),
                    ),
                  ),
                ),
                Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.adaptive.arrow_back,
                              size: 30,
                              color: Colors.black,
                            )),
                      ),
                    )),
                Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite_outline,
                              size: 30,
                              color: Colors.black,
                            )),
                      ),
                    )),
              ]),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    product.name,
                    style: GoogleFonts.poppins(
                        fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.grey.withOpacity(0.2)),
                          child: const Center(
                            child: Text(
                              "-",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                          )),
                      Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.transparent),
                          child: const Center(
                            child: Text(
                              "1",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          )),
                      Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: ColorsPallete.primaryColor),
                          child: const Center(
                            child: Text(
                              "+",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          )),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              Text(
                "Description",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600, fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                product.description,
                style: GoogleFonts.poppins(fontSize: 16, color: Colors.black45),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Nutrition Facts",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600, fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...product.compo.map((e) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          padding: const EdgeInsets.all(5),
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                e.name,
                                style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w800),
                              ),
                              Text(
                                "${e.value} ${e.unit}",
                                style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          //TODO: Add to cart
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(171, 139, 10, 0.5),
                  blurRadius: 20,
                  offset: Offset(0, 10),
                  spreadRadius: 5,
                )
              ],
              color: ColorsPallete.primaryColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.shopping_basket,
                color: Colors.white,
                size: 30,
              ),
              Text(
                "Add to cart",
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                height: 44,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(171, 139, 10, 0.3)),
                child: Column(
                  children: [
                    Text(
                      "price",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 12),
                    ),
                    Text(
                      "\$ ${product.price}",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 12),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
