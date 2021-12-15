
import 'package:coin/api/chartrespones.dart';
import 'package:coin/api/data_bloc.dart';
import 'package:coin/data/entity/coin_favorite_enity.dart';
import 'package:coin/data/entity/coin_responstory_enity.dart';
import 'package:coin/model/coin_model.dart';
import 'package:coin/utils/dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interactive_chart/interactive_chart.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class DetailsCoin extends StatefulWidget {
  const DetailsCoin({Key? key,required this.coinModel}) : super(key: key);

  final CoinModel coinModel;

  @override
  _DetailsCoinState createState() => _DetailsCoinState();



}

class _DetailsCoinState extends State<DetailsCoin> {
  bool _isFavorite = false;
  @override
  void initState() {
    super.initState();

    getData();
  }
  void getData() async{
    if(!bloc.subjectChart.isClosed){
      await bloc.getChart(widget.coinModel.id.toString(), day);
    }
    setState(() {
      coinFavoriteRespons.checkFavorite(CoinFavorite(widget.coinModel.id.toString())).then((value) => {
        _isFavorite = value
      });
    });
  }
  @override
  void dispose(){
    super.dispose();
    day = "1";
  }
  List<CandleData> _data = List.empty();

  String day = "1";
  CoinFavoriteRespons coinFavoriteRespons = CoinFavoriteRespons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 20.w),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                color: Colors.tealAccent,
              child: Container(
                height: 160.w,
                padding: EdgeInsets.only(top: 44.w,right: 10.w,left: 10.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.w),
                  color: Colors.tealAccent,
                ),
                child: Row(
                  children: [
                    const BackButton(),
                    Image.network('${widget.coinModel.image}',width: 50,height: 50,),
                    SizedBox(width: 10.w),
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${widget.coinModel.name}',style: GoogleFonts.balooBhaijaan(fontSize: 27.t)),
                        Text('${widget.coinModel.currentPrice} VND',style: GoogleFonts.roboto(fontSize: 18.t,letterSpacing: 1.5))
                      ],
                    )),
                    IconButton(
                      onPressed: ()=> onCLickFavorite(),
                      iconSize: 30.w,
                      icon:  Icon(
                        _isFavorite ? Icons.favorite : Icons.favorite_border,
                      ),
                      color:  _isFavorite ? Colors.red : Colors.black,
                    ),
                  ],
                ),
              )

            ),
            Expanded(
              child: StreamBuilder<ChartResponse>(
                stream: bloc.subjectChart,
                builder: (context, AsyncSnapshot<ChartResponse> snapshot){
                  if(snapshot.hasData){
                    _data = snapshot.data!.candle.map((e) =>
                        CandleData(
                            timestamp: e.time.toInt(),
                            open: e.open.toDouble(),
                            close: e.close.toDouble(),
                            high: e.hight.toDouble(),
                            low: e.low.toDouble(),
                            volume: e.open.toDouble()))
                        .toList();
                    return _buildChart();
                  }
                  return _buildLoading();
                }
              )
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(child: Text('24H',style: TextStyle(color: day=="1"? Colors.orange: Colors.indigo),), onPressed: ()=>choseDay("1")),
                CupertinoButton(child: Text('7D',style: TextStyle(color: day=="7"? Colors.orange: Colors.indigo)), onPressed: ()=>choseDay("7")),
                CupertinoButton(child: Text('14D',style: TextStyle(color: day=="14"? Colors.orange: Colors.indigo)), onPressed: ()=>choseDay("14")),
                // CupertinoButton(child: Text('30D',style: TextStyle(color: day=="30"? Colors.orange: Colors.indigo)), onPressed: ()=>choseDay("30")),

              ],
            ),
          ],
        ),
      ),
    );
  }
  _buildChart(){
    return SafeArea(
      minimum: const EdgeInsets.all(24.0),
      bottom: false,
      child: InteractiveChart(
        /** Only [candles] is required */
        candles: _data,

      ),
    );
  }
  Widget _buildLoading(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoadingAnimationWidget.staggeredDotWave(
            color: Colors.amber,
            size: 100.w,
          ),
          const Text('Loading Data ...',style: TextStyle(fontSize: 18.0))
        ],
      ),

    );
  }
  choseDay(String day) async{
      if(!bloc.subjectChart.isClosed) {
         await bloc.getChart(widget.coinModel.id.toString(), day);
      }
      setState(() {
        this.day = day;
      });
  }

  onCLickFavorite(){
    print("click favorite");
    CoinFavorite coin = CoinFavorite(widget.coinModel.id.toString());
    coinFavoriteRespons.checkFavorite(coin).then((isFavorite){
      if(!isFavorite){
        coinFavoriteRespons.addCoinFavorite(coin);
        setState(() {
          _isFavorite = true;
        });
      }else{
        coinFavoriteRespons.removeCoinFavorite(coin);
        setState(() {
          _isFavorite = false;
        });
      }
    });
  }
}
