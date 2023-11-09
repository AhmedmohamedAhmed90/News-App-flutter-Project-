import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/Components.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class Science_Screen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {



    return BlocConsumer<NewsCubit, States>(listener: (context, state) {


    }, builder: (context, state) {
      //NewsCubit cubit = NewsCubit.get(context);
      var sciencelist= NewsCubit.get(context).science;
      if (state is! Loading_state) {
        return ListView.separated(itemBuilder: (context, index) {
          return newsbuilder(sciencelist[index]);
        }, separatorBuilder: (context, index) {
          return SizedBox(height: 20,);
        }, itemCount: sciencelist.length );
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