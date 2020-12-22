import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twrpg/data/item.data.dart';
import 'package:twrpg/provider/itemFilter.provider.dart';
import 'package:twrpg/provider/itemList.provider.dart';
import 'package:twrpg/widgets/screens/items/itemCard/itemCard.dart';
import 'package:twrpg/widgets/screens/items/itemListScreen/filter/filterPanel.dart';
import 'package:twrpg/widgets/screens/items/itemListScreen/search/searchBar.dart';

class ItemList extends StatefulWidget {
  final List<ItemData> itemDataList;
  final Map<String,bool> itemTypeFilter;
  final BoxConstraints constraints;
  ItemList({@required this.itemDataList, @required this.itemTypeFilter, @required this.constraints});
  State createState() => ItemListState();
}

class ItemListState extends State<ItemList> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    print('\n\nEQUIPMENT LIST [RE]BUILD');
    
    var itemListProvider = Provider.of<ItemListProvider>(context);
    var itemFilterProvider = Provider.of<ItemFilterProvider>(context);

    BoxConstraints constraints = widget.constraints;

    return Container(
      width: constraints.maxWidth,
      height: constraints.maxHeight,
      child: Column(
        children: [
          ItemSearchBar(),
          itemFilterProvider.showFilterPanel ? FilterPanel(itemTypeFilter: [],):Container(),
          Expanded(
            child: Container(
              child: Scrollbar(
                child: SingleChildScrollView(
                  controller: itemListProvider.itemListScrollController,
                  child: Column(
                    children: [
                      Column(
                        children: getItemList(widget.itemDataList, widget.itemTypeFilter, constraints, itemListProvider.itemListSearchString , itemListProvider.itemListSearchString.length>=0?true:false),
                      ),
                      Container(height:20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
  
  List<ItemCard> getItemList(List<ItemData> itemDataList, Map itemTypeFilter, BoxConstraints constraints, String searchSubString, bool searching) {

    var itemFilterProvider = Provider.of<ItemFilterProvider>(context);

    List<ItemCard> itemCardList = List();
    for(int x=0;x<itemDataList.length;x++) {
      // filter searchbar results
      if(searching && itemDataList[x].name.contains(RegExp(searchSubString, caseSensitive: false)))
        // filter filter
        if((itemDataList[x].recipe!=null && itemFilterProvider.obtainByCrafting) || (itemDataList[x].recipe==null && itemFilterProvider.obtainByDrop) )
          // filter selected item type from navigation
          if(itemTypeFilter[itemDataList[x].type]!=null && itemTypeFilter[itemDataList[x].type])
              itemCardList.add(ItemCard(itemData: itemDataList[x], constraints: constraints));
    }

    // debug
    print("There are " + itemCardList.length.toString() + ' items in this screen.');

    return itemCardList;
  }

  bool isFiltered(String type, List<String> itemTypeFilter) {
    for(int x=0;x<itemTypeFilter.length;x++) {
      if(type==itemTypeFilter[x]) return true;
    } return false;
  }

}
