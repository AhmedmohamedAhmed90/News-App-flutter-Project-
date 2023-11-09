import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/Components.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class Sports_Screen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {



    return BlocConsumer<NewsCubit, States>(listener: (context, state) {


    }, builder: (context, state) {
      //NewsCubit cubit = NewsCubit.get(context);
      var sportslist= NewsCubit.get(context).sports;
      if (state is! Loading_state) {
        return ListView.separated(itemBuilder: (context, index) {
          return newsbuilder(sportslist[index]);
        }, separatorBuilder: (context, index) {
          return SizedBox(height: 20,);
        }, itemCount: sportslist.length );
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