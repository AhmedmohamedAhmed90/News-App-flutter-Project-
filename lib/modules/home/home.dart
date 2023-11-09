import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/modules/science/science.dart';
import 'package:newsapp/modules/search/search.dart';
import 'package:newsapp/modules/sports/sports.dart';
import 'package:newsapp/shared/components/Components.dart';

import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';
import '../business/business.dart';

class NewsApp extends StatelessWidget {



  /*var taskcontroller=TextEditingController();

  var timecontroller=TextEditingController();

  var datecontroller=TextEditingController();*/


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,States>( listener: (context,state){


    },builder:(context,state){

    NewsCubit cubit=NewsCubit.get(context);

    return Scaffold(
      key: cubit.scaffoldkey,
      appBar: AppBar(
    title: Text(''),
    leading: Text(''),
    actions: [
      Padding( padding: EdgeInsets.all(20), child: IconButton(onPressed:(){

        NavigateTo(context, Search_Screen());} , icon: Icon(Icons.search))),
    ],

      ),
      bottomNavigationBar: BottomNavigationBar(onTap:(int index){
    /*setState(() {
      currenindex=index;
    });*/


    cubit.currenindex=index;

    if(index==1){

      cubit.getSports();
      cubit.ChangeBottom();
    }
    else if(index==2){

      cubit.getscience();
      cubit.ChangeBottom();
    }
    else{

      cubit.getBusiness();
      cubit.ChangeBottom();
    }

      },currentIndex: cubit.currenindex,items: cubit.BottomItems),
      body: cubit.screens[cubit.currenindex],

    );
    }
    );

}
}
