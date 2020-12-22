import 'package:flutter/cupertino.dart';

class ItemListProvider extends ChangeNotifier {

  void resetAllValues() {
    showSearchBar = false;
    itemListSearchBarController = TextEditingController();
    itemListScrollController = ScrollController();
    itemListSearchString = '';
    // notifyListeners();
  }

  bool showSearchBar = false;

  void toggleSearchBarWithNotifier() {
    showSearchBar = !showSearchBar;
    notifyListeners();
  }

  void toggleSearchBarWithoutNotifier() {
    showSearchBar = !showSearchBar;
  }

  
  TextEditingController itemListSearchBarController = TextEditingController();

  void clearItemListSearchBarControllerWithNotifier() {
    itemListSearchBarController.clear();
    notifyListeners();
  }


  String itemListSearchString = '';

  void setItemListSearchStringWithNotifier(String newValue) {
    itemListSearchString=newValue;
    notifyListeners();
  }

  void setItemListSearchStringWithoutNotifier(String newValue) {
    itemListSearchString=newValue;
  }

  
  ScrollController itemListScrollController = ScrollController();

  void itemListScrollControllerScrollToTopWithoutNotifier() {
    itemListScrollController.animateTo(0, duration: Duration(milliseconds: 10), curve: Curves.ease);
    notifyListeners();
  }
  void itemListScrollControllerScrollToTopWithNotifier() {
    itemListScrollController.animateTo(0, duration: Duration(milliseconds: 10), curve: Curves.ease);
    notifyListeners();
  }
  



}