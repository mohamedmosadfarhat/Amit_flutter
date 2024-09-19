import 'package:amit_flutter/features/home_page/presentation/manager/cubit/product_cubit.dart';
import 'package:amit_flutter/features/home_page/presentation/views/home_page.dart';
import 'package:amit_flutter/features/home_page/presentation/views/homw_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit()..getProduct(),
      child: MaterialApp(
        home: HomePage(),

        routes: {
         HomeDetails.id:(context)=>HomeDetails()
        },
      ),
    );
  }
}
