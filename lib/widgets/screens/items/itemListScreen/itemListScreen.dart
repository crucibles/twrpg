import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twrpg/data/item.data.dart';
import 'package:twrpg/provider/itemFilter.provider.dart';
import 'package:twrpg/widgets/navDrawer/navDrawer.dart';
import 'package:twrpg/widgets/screens/items/itemListScreen/search/searchButton.dart';
import 'package:twrpg/widgets/screens/items/itemListScreen/sort/sortButton.dart';

import 'filter/filterButton.dart';
import 'itemList.dart';

class ItemListScreen extends StatefulWidget {
  final String screenTitle;
  final List<String> itemTypeFilter;
  final List<ItemData> itemDataList;
  ItemListScreen({@required this.screenTitle, @required this.itemTypeFilter, @required this.itemDataList});
  State createState() => ItemListScreenState();
}

class ItemListScreenState extends State<ItemListScreen> {
  
  List<String> itemTypeFilter;
  List<ItemData> itemDataList;
  var itemFilterProvider;

  @override
  void didChangeDependencies() {
    itemTypeFilter =  widget.itemTypeFilter;
    itemDataList = widget.itemDataList;
    itemFilterProvider = Provider.of<ItemFilterProvider>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    

    // DEBUG
    print('\n\nEQUIPMENT SCREEN [RE]BUILD');

    
    itemFilterProvider.setItemTypeFilterFromStringListWithoutNotifier(itemTypeFilter);
    Map<String,bool> itemTypeMap = itemFilterProvider.itemTypeFilter;
    itemTypeMap.forEach((key, value) {print(key + ' ' + value.toString());});

    return Scaffold(
      drawer: NavDrawer(itemData: itemDataList),
      appBar: AppBar(
        title: Text(widget.screenTitle),
        actions: [
          ItemSortButton(),
          ItemFilterButton(),
          ItemSearchButton(),
          Container(width: 20,),
        ],
      ),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return ItemList(itemDataList: itemDataList, itemTypeFilter: itemTypeMap, constraints: constraints,);
            },
          ),
        )
    );
  }


}
