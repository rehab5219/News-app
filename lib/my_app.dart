import 'package:cubit_data/view/screens/bmi/bmi_screen.dart';
import 'package:cubit_data/view/screens/news/news_screen.dart';
import 'package:cubit_data/view_model/cubit/bmi_cubit/bmi_cubit.dart';
import 'package:cubit_data/view_model/cubit/news_cubit/news_cubit.dart';
import 'package:cubit_data/view_model/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
        ),
        home: BlocProvider(
          create: (context) => NewsCubit()..getNews(),
            child: NewsScreen()
            // child: BmiScreen()
        ),
      ),
    );
  }
}
