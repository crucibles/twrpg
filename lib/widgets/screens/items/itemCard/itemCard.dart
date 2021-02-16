import 'package:flutter/material.dart';
import 'package:twrpg/data/item.data.dart';
import 'package:twrpg/widgets/screens/items/itemDetailsScreen/itemDetailsScreen.dart';

class ItemCard extends StatefulWidget {
  final ItemData itemData;
  final BoxConstraints constraints;
  ItemCard({@required this.itemData, @required this.constraints});
  State createState() => ItemCardState();
}

class ItemCardState extends State<ItemCard> {

  bool showMoreDetails;

  @override
  void initState() {
    showMoreDetails = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    ItemData itemData = widget.itemData;
    BoxConstraints constraints = widget.constraints;

    double fullWidth = constraints.maxWidth;
    double horizontalMargin = 20;
    double cardWidth = fullWidth - horizontalMargin;

    return InkWell(
      onTap: () {
        Navigator.push( context, MaterialPageRoute( builder: (BuildContext context)=>ItemDetailsScreen(itemData: itemData,)));
      },
          child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: cardWidth,
              // margin: EdgeInsets.fromLTRB(10, 15, 10, 0),
              padding: EdgeInsets.fromLTRB(20, 7, 0, 7),
              decoration: decoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          itemData.name==null ? Text("null", style: titleStyle(),) : Text(itemData.name, style: titleStyle(),),
                          itemData1(itemData),
                        ],
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          print("tapped!");
                          setState(() { showMoreDetails=!showMoreDetails; });},
                        child: Container(
                          padding: EdgeInsets.fromLTRB(13,10,13,10),
                          // color: Colors.yellow,
                          child: Icon(showMoreDetails?Icons.arrow_drop_up : Icons.arrow_drop_down, size: 25),),
                      )
                    ],
                  ),
                  itemData==null ? Container() : showMoreDetails ? stats(itemData):Container(),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

  stats(ItemData itemData) {
    return Row(
      children: [
        Expanded(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height:13),
                itemData.stats.mainstat == null ?  Container() : Text("MAIN STAT: " + itemData.stats.mainstat.toString()),
                itemData.stats.allstat!= null ? Text("ALL STAT: " + itemData.stats.allstat.toString()) : Container(),
                itemData.stats.strength != null ? Text("STR: " + itemData.stats.strength.toString()) : Container(),
                itemData.stats.agility != null ? Text("AGI: " + itemData.stats.agility.toString()) : Container(),
                itemData.stats.intelligence != null ? Text("INT: " + itemData.stats.intelligence.toString()) : Container(),
                itemData.stats.armor != null ? Text("ARMOR: " + itemData.stats.armor.toString()) : Container(),
                itemData.stats.damage != null ? Text("DAMAGE: " + itemData.stats.damage.toString()) : Container(),
                itemData.stats.hp != null ? Text("HP: " + itemData.stats.hp.toString()) : Container(),
                itemData.stats.hpregen != null ? Text("HP REGEN: " + itemData.stats.hpregen.toString()) : Container(),
                itemData.stats.mp != null ? Text("MP: " + itemData.stats.mp.toString()) : Container(),
                itemData.stats.mpregen != null ? Text("MP REGEN: " + itemData.stats.mpregen.toString()) : Container(),
                Container(height:13),
              ],
            ),
          ),
        ),
      ],
    );
  }

  decoration() {
    return BoxDecoration(
      color: Colors.grey[300],
      border: Border(
        bottom: BorderSide(width: 1, color: Colors.grey)
      )
    );
  }

  itemData1(ItemData i) {
    return Container(
      margin: EdgeInsets.only(top:5, bottom:5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // i.level==null ? Text("No Level Requirement", style: descStyle(),) : Text('Level: ' + i.level.toString(), style: descStyle(),),
          i.type==null ? Text("[No type specified]", style: descStyle(),) : Text(i.type, style: descStyle(),),
          Container(width: 5,),
          craftOrDrop(i),
        ],
      ),
    );
  }

  craftOrDrop(ItemData i) {
    return i.recipe==null ? Text("Drop") : Text("Crafting", style: descStyle(),);
  }
    
  titleStyle() {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 17,
    );
  }

  descStyle() {
    return TextStyle(
      fontSize: 14,
    );
  }


}
