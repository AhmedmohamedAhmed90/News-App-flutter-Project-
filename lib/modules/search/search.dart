import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/states.dart';

class Search_Screen extends StatelessWidget {


var search_controller= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,States>(listener:(context,state){


    },builder:(context,state){
      return Scaffold(
          appBar:AppBar(),
          body: Padding(
            padding: EdgeInsets.all(20),
            child: Column(

                children:[

                  TextFormField(
                    controller:search_controller ,
                    onChanged: (value){
                      NewsCubit.get(context).getsearch(value);
                    },

                  ),

      Expanded(
        child: ListView.separated(itemBuilder: (context, index) {
        return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
        children: [
        Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(image: NetworkImage('${NewsCubit.get(context).search[index]['urlToImage']}'),fit: BoxFit.cover),

        ),
        ),
        SizedBox(width: 20,),
        Expanded(
        child: Container(
        height: 120,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        Expanded(child: Text('${NewsCubit.get(context).search[index]['title']}',style: TextStyle(fontSize: 18,),maxLines: 3,overflow:TextOverflow.ellipsis ,)),
        Text('${NewsCubit.get(context).search[index]['publishedAt']}',style: TextStyle(fontSize: 18),),
        ],
        ),
        ),
        )

        ],
        ),
        );
        }, separatorBuilder: (context, index) {
          return SizedBox(height: 20,);
        }, itemCount: NewsCubit.get(context).search.length ),
      )




             /* Expanded(
                 child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
              children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      //image: DecorationImage(image: NetworkImage('${SearchList['urlToImage']}'),fit: BoxFit.cover),

                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: Container(
                      height: 120,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(child: Text('${NewsCubit.get(context).search[]['title']}',style: TextStyle(fontSize: 18,),maxLines: 3,overflow:TextOverflow.ellipsis ,)),
                          Text('${SearchList?['publishedAt']}',style: TextStyle(fontSize: 18),),
                        ],
                      ),
                    ),
                  )

              ],
        ),
      ),
               ),*/
              ],
            ),
          )
      );
    },
    );
  }
}
