import 'dart:core';

class OHLC{
  final double open;
  final double hight;
  final double low;
  final double close;
  final int time;

  OHLC(this.time, this.open, this.hight, this.low,this.close);

  OHLC.fromJson(List<dynamic> json):
        time = json[0],
        open = json[1],
        hight = json[2],
        low = json[3], close = json[4];

}

class PriceChart {
  final double price;
  PriceChart(this.price);

  PriceChart.fromJson(Map<String,dynamic> json) : price = json["total_volumes"];
}

class ChartData {
  final List<OHLC> ohlc;
  final List<PriceChart> total_volumn;

  ChartData.data(List<OHLC> ohlc, List<PriceChart> total_volumn) : ohlc = ohlc, total_volumn = total_volumn;

}
