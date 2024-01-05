import 'package:get/get.dart';

class ContestController extends GetxController {
  List<String> listCategories = [
    "Menyanyi",
    "Band",
    "Dance",
    "Acting",
    "Kicau",
    "Pidato",
    "Lainnya"
  ];
  RxList<String> selectedCategory = <String>[].obs;
}
