
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/components/Components.dart';

import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class Buisness_Screen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {



        return BlocConsumer<NewsCubit, States>(listener: (context, state) {


        }, builder: (context, state) {
          //NewsCubit cubit = NewsCubit.get(context);
          var buisnesslist= NewsCubit.get(context).business;

          if (state is! Loading_state) {

            return ListView.separated(itemBuilder: (context, index) {

              return newsbuilder(buisnesslist[index]);
              //NewsCubit.get(context).ChangeBottom();

            }, separatorBuilder: (context, index) {
              return SizedBox(height: 20,);
            }, itemCount: buisnesslist.length );
          }
          else {
            // Handle the loading state here
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }

        );

  }
}
