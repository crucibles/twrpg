import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twrpg/provider/itemList.provider.dart';

class ItemSortButton extends StatelessWidget {
  const ItemSortButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var itemListProvider = Provider.of<ItemListProvider>(context);

    return Container(
      child: InkWell(
            onTap: () { 
              // itemListProvider.toggleSearchBarWithoutNotifier();
              // itemListProvider.setItemListSearchStringWithoutNotifier('');
              // itemListProvider.clearItemListSearchBarControllerWithNotifier();
              print('Sort button tapped.');
            },
                      child: Container(
              width: 50,
              // color: Colors.amber,
              child: Icon(Icons.sort,color: Colors.green[700],),
            ),
          ),
    );
  }
}