import 'package:coffee_masters/dataManager.dart';
import 'package:coffee_masters/pages/menu_page.dart';
import 'package:coffee_masters/pages/offerspage.dart';
import 'package:coffee_masters/pages/orders_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Masters',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      
        primarySwatch: Colors.brown,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0 ;
  var dataManager = DataManager();
  @override
  Widget build(BuildContext context) {

    Widget currentPage = Text("data");
    switch (selectedIndex) {
      case 0 : currentPage = MenuPage(dataManager: dataManager,); break ;
      case 1 : currentPage = OffersPage(); break ;
      case 2 : currentPage = OrdersPage(dataManager: dataManager,); break ;

    }


    return Scaffold(
      appBar: AppBar(
        title: Center(child: Image.asset("images/logo.png")),
      ),
      body: currentPage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (newIndex){
          setState((){
            selectedIndex = newIndex ; //change the state
          });
        },
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.yellow.shade400,
        unselectedItemColor: Colors.brown.shade50,
        items: [
          BottomNavigationBarItem(label: "Menu", icon: Icon(Icons.coffee)),
          BottomNavigationBarItem(label: "Offers", icon: Icon(Icons.local_offer)),
          BottomNavigationBarItem(label: "Orders", icon: Icon(Icons.shopping_cart_checkout_outlined))
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
