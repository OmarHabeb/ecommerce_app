import 'package:ecommerce_app/controllers/auth/auth_cubit.dart';
import 'package:ecommerce_app/view/screens/start/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: Color(0xFF1A2530),
            appBarTheme: AppBarTheme(color: Color(0xFF1A2530)),
            iconTheme: IconThemeData(color: Colors.white),
          ),
          debugShowCheckedModeBanner: false,
          home: OnboardingScreen(),
        ),
      ),
    );
  }
}
