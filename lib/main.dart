import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/modules/home/home.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/network/remote/dio_hilper.dart';

void main() {

  DioHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(providers: [
     BlocProvider(create: (context)=>NewsCubit()..getBusiness(),) ,
    ], child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

      ),
      home: NewsApp() ,
    )
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

      ),
      home: NewsApp() ,
    );
  }
}

