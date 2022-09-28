import 'package:flutter/material.dart';
import 'package:my_flutter_clean_architecture/features/posts/presentation/pages/posts_page.dart';
import 'package:my_flutter_clean_architecture/features/posts/presentation/store/posts_store.dart';
import 'package:my_flutter_clean_architecture/injector.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjector.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Provider(
        create: (context) => DependencyInjector.sl<PostsStore>(),
        child: const PostsPage(),
      ),
    );
  }
}
