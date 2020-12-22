import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twrpg/data/item.data.dart';
import 'package:twrpg/provider/itemFilter.provider.dart';
import 'package:twrpg/provider/itemList.provider.dart';
import 'package:twrpg/widgets/screens/items/itemListScreen/itemListScreen.dart';

class NavDrawer extends StatefulWidget {
  final List<ItemData> itemData;
  NavDrawer({@required this.itemData});
  State createState() => NavDrawerState();
}

class NavDrawerState extends State<NavDrawer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    List<ItemData> itemDataList = widget.itemData;

    return SafeArea(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Drawer(
          child: Column(
            children: [
              header(),
              Expanded(
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [

                        separator('Equip Items'),
                        navDrawerLink("Armors & Robes", itemDataList, ['[Armor]', '[Robe]', '[Armor/Robe]',]),
                        navDrawerLink("Helmets & Hoods", itemDataList, ['[Hood]', '[Helm/Hood]', '[Helm]',]),
                        navDrawerLink("Pickaxes", itemDataList, ['[Pickaxe]']),
                        navDrawerLink("Rings", itemDataList, ['[Ring]']),
                        navDrawerLink("Wings", itemDataList, ['[Wings]']),
                        navDrawerLink("Weapons", itemDataList, ['[Longsword]', '[Weapon all classes]', '[Greatsword]', '[Gloves]', '[Bow]', '[Staff]', '[Gun]', '[Bastard Sword]', '[Weapon non-bow/gun classes]', '[Bag]',]),
                        
                        separator('Materials'),
                        navDrawerLink("Essences", itemDataList, ['[Essence of Elemental]',]),
                        navDrawerLink("Materials", itemDataList, ['[Material]',]),
                        navDrawerLink("Ore Deposits", itemDataList, ['[Ore Deposit]',]),
                        navDrawerLink("Powders", itemDataList, ['[Powder]',]),

                        separator('Closet Items'),
                        navDrawerLink("Collectibles", itemDataList, ['[Collectible]',]),
                        navDrawerLink("Frames", itemDataList, ['[Frame]',]),
                        navDrawerLink("Icons", itemDataList, ['[Icon]',]),
                        navDrawerLink("Tokens", itemDataList, ['[Token]',]),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }

  separator(String title) {
    return Container(
      margin: EdgeInsets.only(top:15),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left:10, right:10),
            child: Text(title),
          ),
          Expanded(
            child: Container(
              height: 2,
              color: Colors.grey[300],
            ),
          )
        ],
      ),
    );
  }

  header() {
    return Row(
      children: [
        Expanded(
          child: Container(
          height:90, 
          color: Colors.blueGrey, 
          child: Center(
            child: Text("Imong mama TWRPG", style: TextStyle( color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30)))))
      ],
    );
  }

  navDrawerLink(String screenTitle, List<ItemData> itemDataList, List<String> itemTypeFilter) {
    
    var itemListProvider = Provider.of<ItemListProvider>(context);
    var itemFilterProvider = Provider.of<ItemFilterProvider>(context);
    
    return InkWell(
      onTap: () {
        itemListProvider.resetAllValues();
        itemFilterProvider.resetAllValues();
        Navigator.of(context).pop();
        Navigator.of(context).popUntil((route) => route.isFirst);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context)=>ItemListScreen(itemDataList: itemDataList, itemTypeFilter: itemTypeFilter, screenTitle: screenTitle)
          )
        );
      },
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top:5),
                color: Colors.white,
                padding: EdgeInsets.only(left:15),
                height: 45,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(screenTitle))
              )
            ),
          ],
        ),
      ),
    );
  }

}