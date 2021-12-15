import 'package:coin/data/entity/coin_responstory_enity.dart';
import 'package:coin/ui/favorite_coin.dart';
import 'package:coin/ui/searchcoin.dart';
import 'package:coin/ui/top100coins.dart';
import 'package:coin/ui/top5coin.dart';
import 'package:flutter/material.dart';

// @dart=2.9
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  List listHomePage =[const Top100Coin(),const Top5Coin(),const FavoriteCoin(),const SearchCoin()];
  List listTitle = ['List 100 coin','Top 10 coin market change','Favorite Coin','Seach Coin'];
  void _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CoinFavoriteRespons().initDatabase();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(listTitle[_selectedIndex]),
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(icon: Icon(
            Icons.trip_origin,
          ),
              label: 'Coin'),
        BottomNavigationBarItem(icon:Icon(Icons.timeline),
            label: 'Top 10'),
        BottomNavigationBarItem(icon:Icon(Icons.favorite_border),
            label: 'Favorite'),
        BottomNavigationBarItem(icon:Icon(Icons.search),
            label: 'Search'),
        ],
        unselectedItemColor: Colors.black54,
        selectedItemColor: Colors.deepOrange,
        currentIndex: _selectedIndex,
        onTap: _onItemSelected,
      ),
      body: listHomePage[_selectedIndex]// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
