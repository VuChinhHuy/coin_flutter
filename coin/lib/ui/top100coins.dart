

import 'package:coin/api/data_bloc.dart';
import 'package:coin/api/response.dart';
import 'package:coin/model/coin_model.dart';
import 'package:coin/widget/bulid_list_view.dart';
import 'package:coin/widget/item_coin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coin/utils/dimens.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Top100Coin extends StatefulWidget {
  const Top100Coin({Key? key}) : super(key: key);

  @override
  _Top100CoinState createState() => _Top100CoinState();
}

class _Top100CoinState extends State<Top100Coin> {

  List<CoinModel> listCoin = List.empty();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(!bloc.subject.isClosed){
      bloc.getCoin();
    }
    setState(() {

    });
  }



  @override
  void dispose(){
    bloc.dispose();
    super.dispose();
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
            listCoin = snapshot.data!.listCoin;
            // return buildListCoin();
            return Container(
              padding: EdgeInsets.only(left: 8.w,right: 8.w,top: 10.w),
              child: buildListCoin(snapshot.data!.listCoin),
            );

          }
          else if (snapshot.hasError){
            return _buildError(snapshot.error.toString());
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

  Widget _buildError(String error){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Error: $error' )
        ],
      ),
    );

  }
}
