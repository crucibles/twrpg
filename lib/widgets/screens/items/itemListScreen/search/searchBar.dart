import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twrpg/provider/itemList.provider.dart';

class ItemSearchBar extends StatefulWidget {
  ItemSearchBar({Key key}) : super(key: key);

  @override
  _ItemSearchBarState createState() => _ItemSearchBarState();
}

class _ItemSearchBarState extends State<ItemSearchBar> {
  @override
  Widget build(BuildContext context) {

    var itemListProvider = Provider.of<ItemListProvider>(context);

    return !itemListProvider.showSearchBar ? Container() :searchBar();
    ;
  }

  searchBar() {
    var itemListProvider = Provider.of<ItemListProvider>(context);

    return Row(
      children: [
        Expanded(
          child: Container(
          child: TextFormField(
            controller: itemListProvider.itemListSearchBarController,
            onChanged: (searchKey) {
                itemListProvider.itemListScrollControllerScrollToTopWithoutNotifier();
                itemListProvider.setItemListSearchStringWithNotifier(searchKey);
            },
            style: TextStyle( fontSize: 20, ),
            decoration: searchBarDecoration(),
          ),
        ),
      ),
      InkWell(
        onTap: () => clearSearchBar(itemListProvider),
        child: clearSearchBarButton(),
      ),
      InkWell(
        onTap: () => clearAndCloseSearchBar(itemListProvider),
        child: clearAndCloseSearchBarButton(),
      ),
      ],
    );
  }

  clearSearchBarButton() {
    return Container(padding:EdgeInsets.only(left:7,right:7), width: 50, height: 48, child: Center(child: Text('Clear'),));
  }

  clearAndCloseSearchBarButton() {
    return Container(width: 50, height: 48, child: Center(child: Icon(Icons.close)),);
  }



  void clearSearchBar(ItemListProvider itemListProvider) {
    itemListProvider.itemListScrollControllerScrollToTopWithoutNotifier();
    itemListProvider.setItemListSearchStringWithoutNotifier('');
    itemListProvider.clearItemListSearchBarControllerWithNotifier();
  }

  void clearAndCloseSearchBar(ItemListProvider itemListProvider) {
    itemListProvider.toggleSearchBarWithoutNotifier();
    itemListProvider.itemListScrollControllerScrollToTopWithoutNotifier();
    itemListProvider.setItemListSearchStringWithoutNotifier('');
    itemListProvider.clearItemListSearchBarControllerWithNotifier();
  }

  InputDecoration searchBarDecoration() {
    return InputDecoration(
      contentPadding: EdgeInsets.only(left:15, right:15),
      border: OutlineInputBorder(borderSide: BorderSide(width:0, color: Colors.white)),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(width:0, color: Colors.white)),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(width:0, color: Colors.white)),
      disabledBorder: OutlineInputBorder(borderSide: BorderSide(width:0, color: Colors.white)),
      hintText: 'Search items here...'
    );
  }



}