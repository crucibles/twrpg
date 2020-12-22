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
  @override
  void initState() {
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
              padding: EdgeInsets.fromLTRB(20, 7, 5, 7),
              decoration: decoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  itemData.name==null ? Text("null", style: titleStyle(),) : Text(itemData.name, style: titleStyle(),),
                  itemData1(itemData),
                ],
              ),
            ),
          ),
        ],
      ),
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
