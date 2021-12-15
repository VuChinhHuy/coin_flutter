import 'package:coin/model/coin_model.dart';

class DataResponse{
    final List<CoinModel> listCoin;
    final String error;

    DataResponse(this.listCoin, this.error);

    DataResponse.fromJson( List json)
        : listCoin =
            //(json as List).map((i) => CoinModel.fromJson(i)).toList(),
            json.map((i) => CoinModel.fromJson(i)).toList(),
            error = "";

    DataResponse.withError(String errorValue) : listCoin = [], error = errorValue;


}

