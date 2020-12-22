import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twrpg/provider/itemFilter.provider.dart';
import 'package:twrpg/provider/itemList.provider.dart';

class ItemFilterButton extends StatelessWidget {
  const ItemFilterButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var itemFilterProvider = Provider.of<ItemFilterProvider>(context);

    return Container(
      child: InkWell(
            onTap: () { 
              itemFilterProvider.toggleFilterButtonVisibility();
              print('Filter button tapped.');
            },
            child: Container(
              width: 50,
              // color: Colors.pink,
              child: Icon(Icons.filter_alt),
            ),
          ),
    );
  }
}