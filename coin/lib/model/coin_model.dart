/// id : "bitcoin"
/// symbol : "btc"
/// name : "Bitcoin"
/// image : "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579"
/// current_price : 56963
/// market_cap : 1075030261229
/// market_cap_rank : 1
/// fully_diluted_valuation : 1195238530642
/// total_volume : 34749944375
/// high_24h : 59184
/// low_24h : 56245
/// price_change_24h : -692.475870063398
/// price_change_percentage_24h : -1.20107
/// market_cap_change_24h : -8252281530.490845
/// market_cap_change_percentage_24h : -0.76178
/// circulating_supply : 18887975.0
/// total_supply : 21000000.0
/// max_supply : 21000000.0
/// ath : 69045
/// ath_change_percentage : -17.58885
/// ath_date : "2021-11-10T14:24:11.849Z"
/// atl : 67.81
/// atl_change_percentage : 83813.03101
/// atl_date : "2013-07-06T00:00:00.000Z"
/// roi : null
/// last_updated : "2021-12-01T11:48:43.973Z"

class CoinModel {
  CoinModel({
      String? id, 
      String? symbol, 
      String? name, 
      String? image,
    dynamic currentPrice,
    dynamic marketCap,
    dynamic marketCapRank,
    dynamic fullyDilutedValuation,
    dynamic totalVolume,
    dynamic high24h,
    dynamic low24h,
    dynamic priceChange24h,
    dynamic priceChangePercentage24h,
    dynamic marketCapChange24h,
    dynamic marketCapChangePercentage24h,
    dynamic circulatingSupply,
    dynamic totalSupply,
    dynamic maxSupply,
    dynamic ath,
    dynamic athChangePercentage,
      String? athDate,
    dynamic atl,
    dynamic atlChangePercentage,
      String? atlDate, 
      dynamic roi, 
      String? lastUpdated,}){
    _id = id;
    _symbol = symbol;
    _name = name;
    _image = image;
    _currentPrice = currentPrice;
    _marketCap = marketCap;
    _marketCapRank = marketCapRank;
    _fullyDilutedValuation = fullyDilutedValuation;
    _totalVolume = totalVolume;
    _high24h = high24h;
    _low24h = low24h;
    _priceChange24h = priceChange24h;
    _priceChangePercentage24h = priceChangePercentage24h;
    _marketCapChange24h = marketCapChange24h;
    _marketCapChangePercentage24h = marketCapChangePercentage24h;
    _circulatingSupply = circulatingSupply;
    _totalSupply = totalSupply;
    _maxSupply = maxSupply;
    _ath = ath;
    _athChangePercentage = athChangePercentage;
    _athDate = athDate;
    _atl = atl;
    _atlChangePercentage = atlChangePercentage;
    _atlDate = atlDate;
    _roi = roi;
    _lastUpdated = lastUpdated;
}

  CoinModel.fromJson(dynamic json) {
    _id = json['id'];
    _symbol = json['symbol'];
    _name = json['name'];
    _image = json['image'];
    _currentPrice = json['current_price'];
    _marketCap = json['market_cap'];
    _marketCapRank = json['market_cap_rank'];
    _fullyDilutedValuation = json['fully_diluted_valuation'];
    _totalVolume = json['total_volume'];
    _high24h = json['high_24h'];
    _low24h = json['low_24h'];
    _priceChange24h = json['price_change_24h'];
    _priceChangePercentage24h = json['price_change_percentage_24h'];
    _marketCapChange24h = json['market_cap_change_24h'];
    _marketCapChangePercentage24h = json['market_cap_change_percentage_24h'];
    _circulatingSupply = json['circulating_supply'];
    _totalSupply = json['total_supply'];
    _maxSupply = json['max_supply'];
    _ath = json['ath'];
    _athChangePercentage = json['ath_change_percentage'];
    _athDate = json['ath_date'];
    _atl = json['atl'];
    _atlChangePercentage = json['atl_change_percentage'];
    _atlDate = json['atl_date'];
    _roi = json['roi'];
    _lastUpdated = json['last_updated'];
  }
  String? _id;
  String? _symbol;
  String? _name;
  String? _image;
  dynamic _currentPrice;
  dynamic _marketCap;
  dynamic _marketCapRank;
  dynamic _fullyDilutedValuation;
  dynamic _totalVolume;
  dynamic _high24h;
  dynamic _low24h;
  dynamic _priceChange24h;
  dynamic _priceChangePercentage24h;
  dynamic _marketCapChange24h;
  dynamic _marketCapChangePercentage24h;
  dynamic _circulatingSupply;
  dynamic _totalSupply;
  dynamic _maxSupply;
  dynamic _ath;
  dynamic _athChangePercentage;
  String? _athDate;
  dynamic _atl;
  dynamic _atlChangePercentage;
  String? _atlDate;
  dynamic _roi;
  String? _lastUpdated;

  String? get id => _id;
  String? get symbol => _symbol;
  String? get name => _name;
  String? get image => _image;
  dynamic get currentPrice => _currentPrice;
  dynamic get marketCap => _marketCap;
  dynamic get marketCapRank => _marketCapRank;
  dynamic get fullyDilutedValuation => _fullyDilutedValuation;
  dynamic get totalVolume => _totalVolume;
  dynamic get high24h => _high24h;
  dynamic get low24h => _low24h;
  dynamic get priceChange24h => _priceChange24h;
  dynamic get priceChangePercentage24h => _priceChangePercentage24h;
  dynamic get marketCapChange24h => _marketCapChange24h;
  dynamic get marketCapChangePercentage24h => _marketCapChangePercentage24h;
  dynamic get circulatingSupply => _circulatingSupply;
  dynamic get totalSupply => _totalSupply;
  dynamic get maxSupply => _maxSupply;
  dynamic get ath => _ath;
  dynamic get athChangePercentage => _athChangePercentage;
  String? get athDate => _athDate;
  dynamic get atl => _atl;
  dynamic get atlChangePercentage => _atlChangePercentage;
  String? get atlDate => _atlDate;
  dynamic get roi => _roi;
  String? get lastUpdated => _lastUpdated;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['symbol'] = _symbol;
    map['name'] = _name;
    map['image'] = _image;
    map['current_price'] = _currentPrice;
    map['market_cap'] = _marketCap;
    map['market_cap_rank'] = _marketCapRank;
    map['fully_diluted_valuation'] = _fullyDilutedValuation;
    map['total_volume'] = _totalVolume;
    map['high_24h'] = _high24h;
    map['low_24h'] = _low24h;
    map['price_change_24h'] = _priceChange24h;
    map['price_change_percentage_24h'] = _priceChangePercentage24h;
    map['market_cap_change_24h'] = _marketCapChange24h;
    map['market_cap_change_percentage_24h'] = _marketCapChangePercentage24h;
    map['circulating_supply'] = _circulatingSupply;
    map['total_supply'] = _totalSupply;
    map['max_supply'] = _maxSupply;
    map['ath'] = _ath;
    map['ath_change_percentage'] = _athChangePercentage;
    map['ath_date'] = _athDate;
    map['atl'] = _atl;
    map['atl_change_percentage'] = _atlChangePercentage;
    map['atl_date'] = _atlDate;
    map['roi'] = _roi;
    map['last_updated'] = _lastUpdated;
    return map;
  }

}