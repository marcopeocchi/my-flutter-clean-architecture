import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:my_flutter_clean_architecture/core/error_handling/failure.dart';
import 'package:my_flutter_clean_architecture/core/widgets/failure_widget.dart';
import 'package:my_flutter_clean_architecture/features/posts/domain/entities/post_entity.dart';
import 'package:my_flutter_clean_architecture/features/posts/presentation/store/posts_store.dart';
import 'package:provider/provider.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  late PostsStore store;
  late List<ReactionDisposer> disposers;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    store = Provider.of<PostsStore>(context);
    store.getAllPosts();

    disposers = [
      reaction(
        (functor) => store.posts,
        (List<Post>? posts) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Retrieved ${posts!.length.toString()} posts!'),
            ),
          );
        },
      ),
      reaction((functor) => store.error, (Failure? error) {})
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Observer(
          builder: ((context) {
            if (store.error != null) {
              return FailureWidget(failure: store.error!);
            }
            if (store.state == StoreState.initial) {
              return const Text('initial');
            }
            if (store.state == StoreState.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (store.state == StoreState.loaded) {
              return ListView(
                children: store.posts!
                    .map((post) => Card(
                          child: ListTile(
                            title: Text(post.title),
                            subtitle: Text(post.body),
                          ),
                        ))
                    .toList(),
              );
            }
            return const Text('Something went terribily wrong');
          }),
        ),
      ),
    );
  }
}
