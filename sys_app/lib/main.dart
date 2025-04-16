import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sys_app/core/app_theme.dart';
import 'package:sys_app/features/presentation/bloc/posts/posts_bloc.dart';
import 'package:sys_app/features/presentation/pages/posts_page.dart';
import 'package:sys_app/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Инициализация фреймворка Flutter
  await di.init(); // Регистрация зависимостей
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (_) =>
                  di.sl<PostsBloc>()..add(
                    GetAllPostsEvent(),
                  ), // Создание PostsBloc и добавление события для получения постов
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: darkAppTheme,
        title: 'Posts App',
        home: PostsPage(),
      ),
    );
  }
}
