import 'package:coin/api/data_bloc.dart';
import 'package:coin/api/response.dart';
import 'package:coin/model/coin_model.dart';
import 'package:coin/utils/dimens.dart';
import 'package:coin/widget/bulid_list_view.dart';
import 'package:coin/widget/item_coin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Top5Coin extends StatefulWidget {
  const Top5Coin({Key? key}) : super(key: key);

  @override
  _Top5CoinState createState() => _Top5CoinState();
}

class _Top5CoinState extends State<Top5Coin> {

  List<CoinModel> top = List.empty();
  List<CoinModel> listAll = [];

  @override
  initState(){
    super.initState();

  }
  @override
  void dispose(){
    super.dispose();
    bloc.dispose();
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
            listAll.addAll(snapshot.data!.listCoin);
            listAll.sort((a,b) => (b.marketCapChangePercentage24h ?? 0).compareTo(a.marketCapChangePercentage24h ?? 0 ));
            top = listAll.take(10).toList();
            // return buildListCoin();
            return Container(
              padding: EdgeInsets.only(left: 8.w,right: 8.w,top: 10.w),
              child: buildListCoin(top),
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
