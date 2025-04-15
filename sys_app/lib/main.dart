import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sys_app/features/presentation/bloc/posts/posts_bloc.dart';
import 'package:sys_app/features/presentation/pages/posts_page.dart';
import 'package:sys_app/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<PostsBloc>()..add(GetAllPostsEvent()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        //theme: appTheme,
        title: 'Posts App',
        home: PostsPage(),
      ),
    );
  }
}
