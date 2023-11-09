import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/cubit/states.dart';
import 'package:newsapp/shared/network/remote/dio_hilper.dart';

import '../../modules/business/business.dart';
import '../../modules/science/science.dart';
import '../../modules/sports/sports.dart';

class NewsCubit extends Cubit<States> {


  NewsCubit() : super(initialstate());

  static NewsCubit get(context) => BlocProvider.of(context);

  var scaffoldkey=GlobalKey<ScaffoldState>();

  var currenindex=0;
  List<dynamic> business=[];
  List<dynamic> sports=[];
  List<dynamic> science=[];
  List<dynamic> search=[];

  List<Widget> screens=[
    Buisness_Screen(),
    Sports_Screen(),
    Science_Screen(),
  ];


  List<BottomNavigationBarItem> BottomItems=[

  BottomNavigationBarItem(icon:Icon(Icons.business),label:'Business'),
  BottomNavigationBarItem(icon:Icon(Icons.sports),label:'Sports'),
  BottomNavigationBarItem(icon:Icon(Icons.science),label:'Science'),

  ];

  void ChangeBottom(){
    emit(changebottom_state());
  }

  
  void getBusiness(){
    //business=[];
    emit(Loading_state());
    
    DioHelper.getData(url:'v2/top-headlines', query:{
      'country':'eg',
      'category':'business',
      'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
    },).then((value){

      business=value?.data['articles'];
      print(business[0]['title']);
        emit(getbusiness_state());

    }).catchError((error){
      print( 'feeeeee erooooooooooooooooooooooooooooooooooooooooor buisness'+error.toString());
    }
    );

    
  }


  void getSports(){
    //sports=[];
    emit(Loading_state());

    DioHelper.getData(url:'v2/top-headlines', query:{
      'country':'eg',
      'category':'sports',
      'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
    },).then((value){

      sports=value?.data['articles'];
      print(sports[0]['title']);
      emit(getsports_state());

    }).catchError((error){
      print( 'feeeeee erooooooooooooooooooooooooooooooooooooooooor sports'+error.toString());
    }
    );

  }


  void getscience(){
    //science=[];
    emit(Loading_state());

    DioHelper.getData(url:'v2/top-headlines', query:{
      'country':'eg',
      'category':'science',
      'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
    },).then((value){

      science=value?.data['articles'];
      print(science[0]['title']);
      emit(getscience_state());

    }).catchError((error){
      print( 'feeeeee erooooooooooooooooooooooooooooooooooooooooor  science'+error.toString());
    }
    );

  }


  void getsearch(String searchvalue){
    emit(Loading_state());

    DioHelper.getData(url:'v2/everything', query:{
      'q':'$searchvalue',
      'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
    },).then((value){

      search=value?.data['articles'];
      print(search[0]['title']);
      emit(getscience_state());

    }).catchError((error){
      print( 'feeeeee erooooooooooooooooooooooooooooooooooooooooor  search'+error.toString());
    }
    );

  }
  
}