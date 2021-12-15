// database.dart

// required package imports
import 'dart:async';
import 'package:coin/data/entity/coin_favorite_dao.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'coin_favorite_enity.dart';


part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [CoinFavorite])
abstract class AppDatabase extends FloorDatabase {
  CoinFavoriteDao get coinDao;
}