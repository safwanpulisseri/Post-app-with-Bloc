import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_app_with_bloc/application/core/services/theme_services.dart';
import 'package:post_app_with_bloc/application/features/post/postbloc/bloc/post_bloc.dart';
import 'package:provider/provider.dart';

class PostWrapper extends StatelessWidget {
  const PostWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc(),
      child: const PostPage(),
    );
  }
}

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themedata = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PostApp using Bloc',
          style: themedata.textTheme.titleMedium,
        ),
        actions: [
          Switch(
            activeColor: Colors.green,
            inactiveTrackColor: Colors.blueGrey,
            inactiveThumbColor: Colors.black87,
            trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
            value: Provider.of<ThemeServiceProvider>(context).isDarkModeOn,
            onChanged: (_) {
              Provider.of<ThemeServiceProvider>(context, listen: false)
                  .toggleTheme();
            },
          ),
          IconButton(
              onPressed: () {
                BlocProvider.of<PostBloc>(context).add(PostRequestedEvent());
              },
              icon: const Icon(
                Icons.refresh,
              ))
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'All Post',
                style: themedata.textTheme.displayLarge,
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: BlocBuilder<PostBloc, PostState>(
                  builder: (context, state) {
                    if (state is PostInitial) {
                      return const Text('Post are waiting to be loaded');
                    } else if (state is PostStateLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.pink,
                        ),
                      );
                    } else if (state is PostStateLoaded) {
                      return ListView.builder(
                        itemCount: state.posts.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                child: Center(
                                  child: Text(
                                    '${index + 1}',
                                  ),
                                ),
                              ),
                              title: Text(
                                '${state.posts[index]}',
                              ),
                              subtitle: Text('Post one body'),
                            ),
                          );
                        },
                      );
                    } else if (state is PostStateError) {
                      return Center(
                        child: Text(state.message),
                      );
                    }
                    return const Center(
                      child: Text("Some Error Occured"),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
