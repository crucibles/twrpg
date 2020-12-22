import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twrpg/provider/itemList.provider.dart';

class ItemSearchButton extends StatelessWidget {
  const ItemSearchButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var itemListProvider = Provider.of<ItemListProvider>(context);

    return Container(
      child: InkWell(
            onTap: () { 
              itemListProvider.toggleSearchBarWithoutNotifier();
              itemListProvider.setItemListSearchStringWithoutNotifier('');
              itemListProvider.clearItemListSearchBarControllerWithNotifier();
              print('Search icon tapped. New Value: ' + itemListProvider.showSearchBar.toString());
            },
            child: Container(
              width: 50,
              child: Icon(Icons.search),
            ),
          ),
    );
  }
}