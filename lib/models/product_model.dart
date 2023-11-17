class ProductModel {
  final String name;
  final String image;
  final String description;
  final double price;
  final List<VitamineModel> compo;
  ProductModel({
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.compo,
  });

  static List<ProductModel> products = [
    ProductModel(
        name: 'Hamburger',
        image: 'assets/images/meals/hamburger.jpg',
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled",
        price: 30.2,
        compo: [
          VitamineModel(
            name: 'Cal',
            value: 210,
          ),
          VitamineModel(name: 'PROT', value: 7.1, unit: "g"),
          VitamineModel(name: 'CHO', value: 27.2, unit: "g"),
          VitamineModel(name: 'HDL', value: 65, unit: "Mg"),
        ]),
    ProductModel(
        name: 'Pizza',
        image: 'assets/images/meals/pizza.jpg',
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled",
        price: 11.23,
        compo: [
          VitamineModel(
            name: 'Vitamine C',
            value: 100,
          ),
        ]),
    ProductModel(
        name: 'Salade',
        image: 'assets/images/meals/salade.jpeg',
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled",
        price: 13.33,
        compo: [
          VitamineModel(name: 'PROT', value: 7.1, unit: "g"),
          VitamineModel(name: 'CHO', value: 27.2, unit: "g"),
          VitamineModel(name: 'HDL', value: 65, unit: "Mg"),
        ]),
    ProductModel(
        name: 'Viande',
        image: 'assets/images/meals/viande.jpg',
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled",
        price: 18.36,
        compo: [
          VitamineModel(name: 'PROT', value: 7.1, unit: "g"),
          VitamineModel(name: 'CHO', value: 27.2, unit: "g"),
          VitamineModel(name: 'HDL', value: 65, unit: "Mg"),
        ]),
  ];
}

class VitamineModel {
  final String name;
  final double value;
  final String unit;
  VitamineModel({
    required this.name,
    required this.value,
    this.unit = 'mg',
  });
}
