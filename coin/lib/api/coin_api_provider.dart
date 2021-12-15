import 'package:coin/api/chartrespones.dart';
import 'package:coin/api/response.dart';
import 'package:coin/model/chart_model.dart';
import 'package:dio/dio.dart';

class CoinApiProvider{
  final String _endpoint = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=vnd&order=market_cap_desc&per_page=100&page=1&sparkline=false";
  final Dio _dio = Dio();
  Future<DataResponse> getCoin() async{
    try{
      Response response = await _dio.get(_endpoint);
      return DataResponse.fromJson(response.data);
    }catch (error,stacktrace){
      print("Exception occured: $error stackTrace: $stacktrace");
      return DataResponse.withError("$error");
    }
  }
  // Future<PriceChart> getChart(String id) async{
  //   try{
  //     String from = (DateTime.now().microsecondsSinceEpoch/1000).toString();
  //     String to =(DateTime.now().microsecondsSinceEpoch/1000).toString();
  //     Response response = await _dio.get('https://api.coingecko.com/api/v3/coins/$id/market_chart/range?vs_currency=vnd&from=1392577232&to=1422577232');
  //     return PriceChart.fromJson(response.data);
  //   }catch (error,stacktrace){
  //     print("Exception occured: $error stackTrace: $stacktrace");
  //
  //   }
  // }
  Future<ChartResponse> getOHLC(String id,String day) async{
    try{
      Response response = await _dio.get('https://api.coingecko.com/api/v3/coins/$id/ohlc?vs_currency=vnd&days=$day');
      return ChartResponse.fromJson(response.data);
    }
    catch (error,stacktrace){
      print("Exception occured: $error stackTrace: $stacktrace");
      return ChartResponse.withError("$error");
    }

  }
  Future<PriceChart> getPriceMarket(String id, String day) async{
    Response response = await _dio.get('https://api.coingecko.com/api/v3/coins/$id/market_chart?vs_currency=vnd&days=$day');
    return PriceChart.fromJson(response.data);
  }
}