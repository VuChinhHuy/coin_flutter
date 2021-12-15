import 'package:coin/data/entity/coin_favorite_dao.dart';
import 'package:coin/data/entity/coin_favorite_enity.dart';

import 'database.dart';

class CoinFavoriteRespons{
  static List<CoinFavorite> listCoinFavorite = List.empty();
  static CoinFavoriteDao? favoriteDao;

  Future<void> initDatabase() async{
    final database = await $FloorAppDatabase.databaseBuilder('coin_database.db').build();
    favoriteDao = database.coinDao;
    print(database.coinDao);
  }
  Future<bool> checkFavorite(CoinFavorite? coin) async{
    CoinFavorite? coinFavorite = await favoriteDao?.findCoinnById(coin!.id);
    if(coinFavorite != null){
      return Future.value(true);
    }
    else {
      return Future.value(false);
    }
  }
  Future<void> addCoinFavorite(CoinFavorite? coin) async{
    favoriteDao?.insertCoin(coin!);
  }
  Future<void> removeCoinFavorite(CoinFavorite? coin) async{
    favoriteDao?.deleteCoin(coin!);
  }
}