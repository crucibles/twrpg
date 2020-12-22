import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twrpg/home.dart';
import 'package:twrpg/provider/itemFilter.provider.dart';
import 'package:twrpg/provider/itemList.provider.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ItemListProvider>(create: (context) => ItemListProvider()),
        ChangeNotifierProvider<ItemFilterProvider>(create: (context) => ItemFilterProvider()),
      ],
      child: MyApp(),
    )
  );

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: DoubleBackToCloseApp(
          snackBar: SnackBar(content: Text('Sige pa, pindota pa para ma-ex ang app!'),),
          child: Home()
        )
      ),
    );
  }
}