import 'package:coin/api/data_bloc.dart';
import 'package:coin/api/response.dart';
import 'package:coin/model/coin_model.dart';
import 'package:coin/utils/dimens.dart';
import 'package:coin/widget/bulid_list_view.dart';
import 'package:coin/widget/item_coin.dart';
import 'package:flutter/material.dart';

class SearchCoin extends StatefulWidget {
  const SearchCoin({Key? key}) : super(key: key);

  @override
  _SearchCoinState createState() => _SearchCoinState();
}

class _SearchCoinState extends State<SearchCoin> {

  List<CoinModel> listSearch = List.empty();
  List<CoinModel> listAll = [];

  @override
  initState(){
    super.initState();
  }
  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.w,right: 10.w,top: 5.w),
      child: Column(
        children: [
          Container(
            height: 44.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.blue,
                  blurRadius: 25,
                  offset: Offset(2,3),
                )],
            ),
            child: TextField(
              onChanged: (text){
                listSearch = listAll.where((element) => element.name?.toLowerCase().contains(text)==true).toList();
                setState(() {

                });
              },
              decoration: InputDecoration(
                  icon: Padding(
                    padding: EdgeInsets.only(left: 16.w),
                    child: const Icon(Icons.search),
                  ),
                  hintText: 'Search ...',
                  enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(20.0),
                      borderSide: const BorderSide(color: Colors.white, width: 0.0)),
                  contentPadding: const EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
                  focusedBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(20.0),
                      borderSide: const BorderSide(color: Colors.white, width: 0.0))

              ),
            ),
          ),
          Expanded(child: StreamBuilder<DataResponse>(
              stream: bloc.subject.stream,
              builder: (context, AsyncSnapshot<DataResponse> snapshot){
                if(snapshot.hasData){
                  if (snapshot.data!.error.isNotEmpty){
                    print("Error has data");
                  }
                  listAll = snapshot.data!.listCoin;
                  // return buildListCoin();
                  return Container(
                    padding: EdgeInsets.only(left: 8.w,right: 8.w,top: 10.w),
                    child: _buildListView(),
                  );

                }
                return builLoading();
                // else if (snapshot.hasError){
                //   return _buildError(snapshot.error.toString());
                // }
                // else{
                //   return _buildLoading();
                // }
              }
          ))
        ],
      ),
    );
  }
  _buildListView() => ListView.separated(
        separatorBuilder: (BuildContext context, index)=> const Divider(),
        itemCount: listSearch.length,
        itemBuilder: (BuildContext context, index){
          return ItemCoin(listSearch[index]);
        },
  );

}
