
import 'package:coin/data/entity/coin_favorite_enity.dart';
import 'package:floor/floor.dart';

@dao
abstract class CoinFavoriteDao {
  @Query('SELECT * FROM CoinFavorite')
  Future<List<CoinFavorite>> findAllCoin();

  @Query('SELECT * FROM CoinFavorite WHERE id = :id')
  Future<CoinFavorite?> findCoinnById(String id);

  @insert
  Future<void> insertCoin(CoinFavorite coin);

  @delete
  Future<void> deleteCoin(CoinFavorite coin);
}