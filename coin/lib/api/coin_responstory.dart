import 'package:coin/api/chartrespones.dart';
import 'package:coin/api/coin_api_provider.dart';
import 'package:coin/api/response.dart';
import 'package:coin/model/chart_model.dart';

class CoinResponstory{
  CoinApiProvider _apiProvider = CoinApiProvider();
  Future<DataResponse> getCoin(){
    return _apiProvider.getCoin();
  }
  Future<ChartResponse> getOHLC(String id, String day){
    return _apiProvider.getOHLC(id,day);
  }
  Future<PriceChart> getPrice(String id, String day){
    return _apiProvider.getPriceMarket(id, day);
  }


}