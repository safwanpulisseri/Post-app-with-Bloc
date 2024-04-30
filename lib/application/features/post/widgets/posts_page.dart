import 'package:flutter/material.dart';
import 'package:post_app_with_bloc/application/core/services/theme_services.dart';
import 'package:provider/provider.dart';

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
              })
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
              const Center(
                child: CircularProgressIndicator(
                  color: Colors.pink,
                ),
              ),
              const Center(
                child: Text('Post Are Loading'),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
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
                          'Post One',
                        ),
                        subtitle: Text('Post body'),
                      ),
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
