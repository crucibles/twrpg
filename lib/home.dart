import 'package:flutter/material.dart';
import 'package:twrpg/data/item.data.dart';
import 'package:twrpg/widgets/navDrawer/navDrawer.dart';

class Home extends StatefulWidget {
  State createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: getItemDataList(),
      builder: (BuildContext context, AsyncSnapshot snap){
        

        if(snap.hasData) {

            List<ItemData> itemData = snap.data as List<ItemData>;

           return Scaffold(
             drawer: NavDrawer(itemData: itemData),
             appBar: AppBar(
               title: Text("Home Page"),
             ),
              body: SafeArea(
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return Container(
                      width: constraints.maxWidth,
                      height: constraints.maxHeight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("ADS    ADS    ADS    ADS    ADS    ADS    ADS    ADS    ADS    ADS    ADS    "),
                          Container(height: 20,),
                          Text("ADS    ADS    ADS    ADS    ADS    ADS    ADS    ADS    ADS    ADS    ADS    "),
                          Container(height: 20,),
                          Text("ADS    ADS    ADS    ADS    ADS    ADS    ADS    ADS    ADS    ADS    ADS    "),
                          Container(height: 20,),
                          Text("ADS    ADS    ADS    ADS    ADS    ADS    ADS    ADS    ADS    ADS    ADS    "),
                          Container(height: 20,),
                          Text("ADS    ADS    ADS    ADS    ADS    ADS    ADS    ADS    ADS    ADS    ADS    "),
                          Container(height: 20,),
                          Text("ADS    ADS    ADS    ADS    ADS    ADS    ADS    ADS    ADS    ADS    ADS    "),
                          Container(height: 20,),
                          Text("ADS    ADS    ADS    ADS    ADS    ADS    ADS    ADS    ADS    ADS    ADS    "),
                          Container(height: 20,),
                          Text("ADS    ADS    ADS    ADS    ADS    ADS    ADS    ADS    ADS    ADS    ADS    "),
                          Container(height: 20,),
                          Text("ADS    ADS    ADS    ADS    ADS    ADS    ADS    ADS    ADS    ADS    ADS    "),
                          Container(height: 20,),
                          Text("ADS    ADS    ADS    ADS    ADS    ADS    ADS    ADS    ADS    ADS    ADS    "),
                          Container(height: 20,),
                          Text("CHAR LANG HAHAHAHHAAHHA"),
                        ],
                      )
                    );
                  },
                ),
              )
          );
        } else return Scaffold(body: Center(child: CircularProgressIndicator()));

      }
    );
   
  }

  
  Future<List<ItemData>> getItemDataList() async {
    
    // DEBUG
    // await DefaultAssetBundle
    //   .of(context)
    //   .loadString("assets/items.json")
    //   .then((value) => print('\n\n    VALUEEEEE: ' + value.toString() + '\n\n'));
    
    return itemDataFromMap(await DefaultAssetBundle.of(context).loadString("assets/items.json"));
  }

}
