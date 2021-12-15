

import 'package:coin/model/coin_model.dart';
import 'package:coin/ui/detail_coin.dart';
import 'package:coin/utils/dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemCoin extends StatelessWidget {
   late CoinModel coinModel ;
  
  ItemCoin(CoinModel coinModel, {Key? key}) : super(key: key){
    this.coinModel = coinModel;
  }



  @override
  Widget build(BuildContext context) {
    return
    CupertinoButton(
      padding: const EdgeInsets.all(10.0),
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        color: const Color.fromRGBO(50, 60, 70, 0.9),
      child: Row(
      children: [
        Image.network('${coinModel.image}',width: 50,height: 50,),
        Container(
          padding: EdgeInsets.only(left: 5.w),
          child: Text('${coinModel.name}',style: GoogleFonts.balooBhaijaan(fontSize: 18.t),),
        ),
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('${coinModel.currentPrice} VND',style: GoogleFonts.montserrat(fontSize: 18.t)),
            Text('${coinModel.marketCapChangePercentage24h}',style: TextStyle(color: ( coinModel.marketCapChangePercentage24h !=null && coinModel.marketCapChangePercentage24h  > 0 ? Colors.green : Colors.red)),)
            // Text('${coinModel.priceChangePercentage24h}')
          ],
        ))
      ],
    ),
        onPressed: () => Navigator.push(
        context,
      MaterialPageRoute(builder: (context) =>  DetailsCoin(coinModel: coinModel),
      )
    ));

  }

}

