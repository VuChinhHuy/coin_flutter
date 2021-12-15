import 'dart:math';

import 'package:coin/api/data_bloc.dart';
import 'package:coin/api/response.dart';
import 'package:coin/data/entity/coin_favorite_enity.dart';
import 'package:coin/data/entity/coin_responstory_enity.dart';
import 'package:coin/model/coin_model.dart';
import 'package:coin/utils/dimens.dart';
import 'package:coin/widget/bulid_list_view.dart';
import 'package:coin/widget/item_coin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoriteCoin extends StatefulWidget {
  const FavoriteCoin({Key? key}) : super(key: key);

  @override
  _FavoriteCoinState createState() => _FavoriteCoinState();
}

class _FavoriteCoinState extends State<FavoriteCoin> {

  List<CoinFavorite> list = [];
  List<CoinModel> listCoinFavorite = [];
  List<CoinModel> listAll = List.empty();
  void getListFavorite() async{
    list = await CoinFavoriteRespons.favoriteDao?.findAllCoin() ?? [];
    print(list.toString());

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getListFavorite();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DataResponse>(
        stream: bloc.subject.stream,
        builder: (context, AsyncSnapshot<DataResponse> snapshot){
          if(snapshot.hasData){
            if (snapshot.data!.error.isNotEmpty){
              print("Error has data");
            }
            if(list.isEmpty){
              return const Center(child: Text('NO COIN IS FAVORITE'),);
            }
            listAll = snapshot.data!.listCoin;
            for (var e in list) {
              listCoinFavorite = listAll.where((element) => element.id! == e.id).toList();
            };
            return Container(
              padding: EdgeInsets.only(left: 8.w,right: 8.w,top: 10.w),
              child: buildListCoin(listCoinFavorite),
            );
          }
          else if (snapshot.hasError){
            return buildError(snapshot.error.toString());
          }
          else{
            return builLoading();
          }
        }
    );
  }
  Widget buildListCoin(List<CoinModel> list)=>ListView.separated(
    separatorBuilder: (BuildContext context, index)=> const Divider(),
    itemCount: list.length,
    itemBuilder: (BuildContext context, index){
      return ItemCoin(list[index]);
    },);
}
