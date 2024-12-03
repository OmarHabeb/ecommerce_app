import 'package:ecommerce_app/controllers/auth/forget_password_cubit/cubit/forget_password_cubit.dart';
import 'package:ecommerce_app/controllers/auth/login_cubit/cubit/login_cubit.dart';
import 'package:ecommerce_app/controllers/auth/signup_cubit/cubit/signup_cubit.dart';
import 'package:ecommerce_app/controllers/data/products/products_cubit.dart';
import 'package:ecommerce_app/controllers/features/profile_cubit/cubit/profile_cubit.dart';
import 'package:ecommerce_app/core/helpers/shared_preference_helper.dart';
import 'package:ecommerce_app/view/screens/app/navigatorBar.dart';
import 'package:ecommerce_app/view/screens/start/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://yrbsbxbmzjkyzrxxillg.supabase.co/',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlyYnNieGJtempreXpyeHhpbGxnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzI4MjM5MjYsImV4cCI6MjA0ODM5OTkyNn0.c2HlDfegiIC74qCef8hwrQUwvHsV680Bm5sYWa1qgSE', // Use the anon public key from your Supabase project
  );
  // await CacheHelper.cachIntialization();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignupCubit(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => ForgetPasswordCubit(),
        ),
        BlocProvider(
          create: (context) => ProductsCubit(),
        ),
        BlocProvider(
          create: (context) => ProfileCubit(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        child: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            var cubit = LoginCubit.get(context);
            return MaterialApp(
              theme: ThemeData(
                primaryIconTheme: IconThemeData(color: Color(0xFFF2F2F2)),
                scaffoldBackgroundColor: Color(0xFF1A1A1A),
                iconTheme: IconThemeData(color: Colors.white),
              ),
              debugShowCheckedModeBanner: false,
              // home:  cubit.cacheHelper.getData(key: "userToken") == null ? OnboardingScreen() : navigator(),
              home: navigator(),
            );
          },
        ),
      ),
    );
  }
}
