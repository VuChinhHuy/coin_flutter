import 'package:coin/api/chartrespones.dart';
import 'package:coin/api/coin_responstory.dart';
import 'package:coin/api/response.dart';
import 'package:rxdart/rxdart.dart';


class DataBloc {
  final CoinResponstory _repository = CoinResponstory();
  final BehaviorSubject<DataResponse> _subject = BehaviorSubject<DataResponse>();
  final BehaviorSubject<ChartResponse> _subjectChart = BehaviorSubject<ChartResponse>();

  getCoin() async {
    DataResponse response = await _repository.getCoin();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }
  BehaviorSubject<DataResponse> get subject => _subject;
  BehaviorSubject<ChartResponse> get subjectChart => _subjectChart;

  getChart(String id, String day) async{
        ChartResponse response = await _repository.getOHLC(id, day);
        _subjectChart.sink.add(response);
  }
  disposeChart(){
    _subjectChart.close();
  }


}
final bloc = new DataBloc();

