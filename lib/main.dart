import 'package:flutter/material.dart';
import 'package:post_app_with_bloc/application/core/services/theme_services.dart';
import 'package:post_app_with_bloc/application/features/post/widgets/posts_page.dart';
import 'package:post_app_with_bloc/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeServiceProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeServiceProvider>(
        builder: (context, themeServices, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode:
            themeServices.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
        title: 'Flutter Demo',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home: const PostWrapper(),
      );
    });
  }
}
