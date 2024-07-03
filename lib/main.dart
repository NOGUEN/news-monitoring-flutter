import 'package:flutter/material.dart';
import 'package:news_monitoring/core/constants/app_constants.dart';
import 'package:news_monitoring/provider_setup.dart';
import 'package:news_monitoring/ui/design_system/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:news_monitoring/ui/router.dart' as router;

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Dillema Cafe',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.blue,
          scaffoldBackgroundColor: AppColors.background,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.background,
            iconTheme: IconThemeData(
              color: Colors.blue,
            ),
            actionsIconTheme: IconThemeData(
              color: AppColors.white,
            ),
          ),
        ),
        initialRoute: RoutePaths.Home,
        onGenerateRoute: router.Router.generateRoute,
      ),
    );
  }
}
