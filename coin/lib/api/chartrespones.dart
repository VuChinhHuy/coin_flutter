
import 'package:coin/model/chart_model.dart';
import 'package:interactive_chart/interactive_chart.dart';

class ChartResponse {

  final List<OHLC> candle;
  final String error;

  ChartResponse(this.candle,this.error);

  ChartResponse.fromJson(List json) : candle = json.map(
      (i) => OHLC.fromJson(i)
  ).toList(),
  error=""
  ;
  ChartResponse.withError(String errorValue) : candle = [], error = errorValue;




  // static List<CandleData> get candle => jsonDecode(Dio().get('https://api.coingecko.com/api/v3/coins/bitcoin/ohlc?vs_currency=vnd&days=1').toString())
  //     .map((row) => CandleData(
  //   timestamp: row[0] * 1000,
  //   open: row[1]?.toDouble(),
  //   high: row[2]?.toDouble(),
  //   low: row[3]?.toDouble(),
  //   close: row[4]?.toDouble(),
  //   volume: row[5]?.toDouble(),
  // ))
  //     .toList();
}