import 'category.dart';

class AppData {
  static List<Category> categoryList = [
    Category(
      id: 1,
      name: "Woman",
      image: 'assets/images/wireless headset.png',
      isSelected: true,
    ),
    Category(
      id: 2,
      name: "T-Shirt",
      image: 'assets/images/tshirt.png',
      isSelected: false,
    ),
    Category(
      id: 3,
      name: "Dress",
      image: 'assets/images/dress.png',
      isSelected: false,
    ),
  ];
}
