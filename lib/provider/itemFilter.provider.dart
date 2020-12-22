import 'package:flutter/cupertino.dart';

class ItemFilterProvider extends ChangeNotifier {

  void resetAllValues() {
    showCraftItems = true;
    showDropItems = true;
    t = true;
    itemTypeFilter = Map();
    obtainByCrafting = true;
    obtainByDrop = true;
    showFilterPanel = false;
  }

  bool showFilterPanel = false;

  void toggleFilterButtonVisibility() {
    showFilterPanel = !showFilterPanel;
    notifyListeners();
  }

  bool t = true;
  Map<String,bool> itemTypeFilter = Map<String,bool>();

  void setItemTypeFilterWithoutNotifier(Map<String,bool> newValue) {
    itemTypeFilter = newValue;
  }

  void setItemTypeFilterWithNotifier(Map<String,bool> newValue) {
    itemTypeFilter = newValue;
    notifyListeners();
  }

  void setItemTypeFilterFromStringListWithoutNotifier(List<String> stringList) {
    if(t) {
    itemTypeFilter = Map();
    for(int x=0;x<stringList.length;x++) {
      print('initMap - ${stringList[x]} - true');
      itemTypeFilter[stringList[x]] = true;
    }
    t=false;
    }
  }

  void setItemTypeFilterFromStringListWithNotifier(List<String> stringList) {
    itemTypeFilter = Map();
    for(int x=0;x<stringList.length;x++) itemTypeFilter[stringList[x]] = true;
    notifyListeners();
  }

  void toggleItemTypeFilterFromStringListWithNotifier(String toggleKey) {
    itemTypeFilter[toggleKey] = !itemTypeFilter[toggleKey];
    notifyListeners();
  }

  // List<bool> itemTypeFilterValues = [];

  // void setItemTypeFilterWithoutNotifier(List<String> newValue) {
  //   itemTypeFilter = newValue;
  // }

  // void setItemTypeFilterWithNotifier(List<String> newValue) {
  //   itemTypeFilter = newValue;
  //   notifyListeners();
  // }



  bool showDropItems = true;

  void toggleShowDropItemsWithNotifier() {
    showDropItems = !showDropItems;
    notifyListeners();
  }

  void toggleShowDropItemsWithoutNotifier() {
    showDropItems = !showDropItems;
  }


  bool showCraftItems = true;

  void toggleShowCraftItemsWithNotifier() {
    showCraftItems = !showCraftItems;
    notifyListeners();
  }

  void toggleShowCraftItemsWithoutNotifier() {
    showCraftItems = !showCraftItems;
  }

  
  bool obtainByCrafting = true;
  bool obtainByDrop = true;

  

  void toggleObtainByCraftWithoutNotifier() {
    obtainByCrafting = !obtainByCrafting;
  }

  void toggleObtainByCraftWithNotifier() {
    obtainByCrafting = !obtainByCrafting;
    notifyListeners();
  }

  
  void toggleObtainByDropWithoutNotifier() {
    obtainByDrop = !obtainByDrop;
  }
  
  void toggleObtainByDropWithNotifier() {
    obtainByDrop = !obtainByDrop;
    notifyListeners();
  }


}