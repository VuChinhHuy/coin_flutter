import 'package:coin/utils/dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

Widget builLoading(){
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

Widget buildError(String error){
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Error: $error' )
      ],
    ),
  );

}


