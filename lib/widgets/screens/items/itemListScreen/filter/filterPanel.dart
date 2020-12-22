import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twrpg/provider/itemFilter.provider.dart';

class FilterPanel extends StatefulWidget {
  final List<String> itemTypeFilter;
  const FilterPanel({@required this.itemTypeFilter});

  @override
  _FilterPanelState createState() => _FilterPanelState();
}


class _FilterPanelState extends State<FilterPanel> {

  
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    

    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
              obtainMethodFilter(),
              filterTypes(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  obtainMethodFilter() {
    
    var itemFilterProvider = Provider.of<ItemFilterProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Obtain method filter:'),
        Row(
          children: [
            Expanded(child: InkWell(onTap: () { itemFilterProvider.toggleObtainByCraftWithNotifier();}, child: Container(child: Row(children: [Checkbox(value: itemFilterProvider.obtainByCrafting , onChanged: (v){ itemFilterProvider.toggleObtainByCraftWithNotifier(); }), Text('Crafting Items'),],),)),),
            Expanded(child: InkWell (onTap: (){ itemFilterProvider.toggleObtainByDropWithNotifier(); }, child: Container(child: Row(children: [Checkbox(value: itemFilterProvider.obtainByDrop, onChanged: (v){ itemFilterProvider.toggleObtainByDropWithNotifier(); }), Text('Drop Items'),],),)),)
          ],
        ),
      ],
    );
  }

  filterTypes() {
    
    var itemFilterProvider = Provider.of<ItemFilterProvider>(context);

    return itemFilterProvider.itemTypeFilter.length<=1? Container() :
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(height:15),
        Text('Filter Types:'),
        getTypes(),
      ],
    );
  }

  getTypes() {

    
    var itemFilterProvider = Provider.of<ItemFilterProvider>(context);
    // Map<String,bool> m = itemFilterProvider.itemTypeFilter;

    List<Widget> x = List();
    itemFilterProvider.itemTypeFilter.forEach((key, value) {
      x.add(InkWell(
        onTap: (){
              itemFilterProvider.toggleItemTypeFilterFromStringListWithNotifier(key);},
              child: Row(
          children: [
            Expanded(child: Container(child: Row(children: [Checkbox(value: itemFilterProvider.itemTypeFilter[key],
            onChanged: (v){
              itemFilterProvider.toggleItemTypeFilterFromStringListWithNotifier(key);
            }
            ), Text(key),],),),),
          ],
        ),
      ));
    });
    return Column(children:x);
  }

}