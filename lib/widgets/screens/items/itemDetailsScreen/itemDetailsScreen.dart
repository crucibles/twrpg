import 'package:flutter/material.dart';
import 'package:twrpg/data/item.data.dart';

class ItemDetailsScreen extends StatefulWidget {
  final ItemData itemData;
  ItemDetailsScreen({@required this.itemData});
  State createState() => ItemDetailsScreenState();
}

class ItemDetailsScreenState extends State<ItemDetailsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    ItemData itemData = widget.itemData;

    return Scaffold(
        appBar: AppBar(
          title: Text(itemData.name)
        ),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        child: SingleChildScrollView(
                            child: Column(
                              children: [
                                title(itemData.name, constraints.maxWidth),
                                itemData.description==null ? Container() : description(itemData.description, constraints.maxWidth),
                                Container(height:20),
                                details(itemData, constraints.maxWidth),
                              ],
                            ),
                        ),
                      ),
                    ),
                  ],
                )
              );
            },
          ),
        )
    );
  }

  title(String itemName, double w) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 15, 0),
      width: w,
      child: Text(
        itemName,
        style: titleStyle(),
      ),
    );
  }

  titleStyle() {
    return TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
    );
  }

  description(String desc, double w) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 15, 0),
      width: w,
      child: Text(
        desc,
        style: descriptionStyle(),
      ),
    );
  }
  

  descriptionStyle() {
    return TextStyle(
      fontSize: 16,
      fontStyle: FontStyle.italic,
      color: Colors.grey
      // fontWeight: FontWeight.bold,
    );
  }

  details(ItemData itemData, double w) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        itemData.stats==null?Container():stats(itemData.stats, w),
        itemData.stats==null?Container():Container(height:20),
        itemData.stats.passive==null ? Container() : statList("Passive", itemData.stats.passive),
        itemData.stats.passive==null ? Container() : Container(height:20),
        itemData.stats.active==null ? Container() : statList("Active", itemData.stats.active),
        itemData.stats.active==null?Container():Container(height:20),
        itemData.stats.spec==null ? Container() :  statList("Specialty", itemData.stats.spec),
        itemData.stats.spec==null?Container():Container(height:20),
        itemData.requiredBy==null?Container():statList('Required by: ', itemData.requiredBy),
        itemData.requiredBy==null?Container():Container(height:20),
        itemData.droppedBy==null?Container():statList('Dropped by: ', itemData.droppedBy),
        itemData.droppedBy==null?Container():Container(height:20),
        // itemData.recipe==null ? Container() : Text('recipe: ' + itemData.recipe.toString()),
        itemData.recipe==null?Container():recipe(w,itemData.recipe),
      ],
    );
  }

  statList(String statName, List<String> list) {
    List<Widget> l = List();
    for(int x=0;x<list.length;x++) {
      l.add(Container(padding: EdgeInsets.only(left:15),child: Text('◦ ' + list[x])),);
    }
    return Container(
      margin: EdgeInsets.only(top:5),
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(statName),
          Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
            children: l
          ),
        ],
      ),
    );
  }

  recipe(double width, List<Map> recipeList) {
    List<Widget> recipeWidgetList = List();
    recipeWidgetList.add(Container(margin:EdgeInsets.only(top:0, bottom: 7),child: Text('Recipe'),));
    for(int x=0;x<recipeList.length;x++) {
        int or= recipeList[x].length-1;
        recipeList[x].forEach((key, value) {
          recipeWidgetList.add(recipeItem(key, value));
          if(or>0) { recipeWidgetList.add(Text("or")); or--; }
        });
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: recipeWidgetList
    );
  }

  recipeItem(String recipeName, int quantity) {
    return Container(
      child: Text(recipeName + (quantity==1?'':' x' + quantity.toString())),
    );
  }

  statDetail(double width, String statName, String statDetails) {
    return Container(
      margin: EdgeInsets.only(top:5),
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: Text(statName + ': ' + statDetails),
    );
  }

  stats(Stats s, double width) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        s.affinityearthpercent==null ? Container() : statDetail(width, 'Earth Affinity', s.affinityearthpercent.toString()+'%'),
        s.affinityflamepercent==null ? Container() : statDetail(width, 'Flame Affinity', s.affinityflamepercent.toString()+'%'),
        s.affinitywlpercent==null ? Container() : statDetail(width, 'WL Affinity', s.affinitywlpercent.toString()),
        s.damage==null ? Container() : statDetail(width, 'Damage', s.damage.toString()),
        s.skilldamagepercent==null ? Container() : statDetail(width, 'Skill Damage', s.skilldamagepercent.toString()),
        s.strength==null ? Container() : statDetail(width, 'Strength', s.strength.toString()),
        s.agility==null ? Container() : statDetail(width, 'Agility', s.agility.toString()),
        s.intelligence==null ? Container() : statDetail(width, 'Intelligence', s.intelligence.toString()),
        s.allstat==null ? Container() : statDetail(width, 'All Stat', s.allstat.toString()),
        s.mainstat==null ? Container() : statDetail(width, 'Main Stat', s.mainstat.toString()),
        s.armor==null ? Container() : statDetail(width, 'Armor', s.armor.toString()),
        s.dt==null ? Container() : statDetail(width, 'Damage Taken', s.dt.toString()),
        s.dtpercent==null ? Container() : statDetail(width, 'Damage Taken Percent', s.dtpercent.toString()),
        s.mdpercent==null ? Container() : statDetail(width, 'Magic Defense', s.mdpercent.toString()),
        s.hp==null ? Container() : statDetail(width, 'HP', s.hp.toString()),
        s.hpregen==null ? Container() : statDetail(width, 'HP Regen', s.hpregen.toString()),
        s.mp==null ? Container() : statDetail(width, 'MP', s.mp.toString()),
        s.mpregen==null ? Container() : statDetail(width, 'MP Regen', s.mpregen.toString()),
        s.attackspeedpercent==null ? Container() : statDetail(width, 'Attack Speed', s.attackspeedpercent.toString()),
        s.critchancepercent==null ? Container() : statDetail(width, 'Crit Chance', s.critchancepercent.toString()),
        s.critmultiplier==null ? Container() : statDetail(width, 'Crit Chance (%)', s.critmultiplier.toString()+'%'),
        s.damagedealtpercent==null ? Container() : statDetail(width, 'Damage Dealt', s.damagedealtpercent.toString()),
        s.dodgechancepercent==null ? Container() : statDetail(width, 'Dodge Chance', s.dodgechancepercent.toString()),
        s.drpercent==null ? Container() : statDetail(width, 'drpercent', s.drpercent.toString()),
        s.expreceivedpercent==null ? Container() : statDetail(width, 'expreceivedpercent', s.expreceivedpercent.toString()),
        s.healingpercent==null ? Container() : statDetail(width, 'healingpercent', s.healingpercent.toString()),
        s.healreceivedpercent==null ? Container() : statDetail(width, 'healreceivedpercent', s.healreceivedpercent.toString()),
        s.movespeed==null ? Container() : statDetail(width, 'movespeed', s.movespeed.toString()),
        s.movespeedpercent==null ? Container() : statDetail(width, 'movespeedpercent', s.movespeedpercent.toString()),
        s.periodicdamagepercent==null ? Container() : statDetail(width, 'periodicdamagepercent', s.periodicdamagepercent.toString()),
        s.revivaltimepercent==null ? Container() : statDetail(width, 'revival time', s.revivaltimepercent.toString()),
      ],
    );
  }

}
