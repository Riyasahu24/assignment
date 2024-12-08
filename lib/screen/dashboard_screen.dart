import 'package:assignment/bloc/posts/post_bloc.dart';
import 'package:assignment/bloc/posts/post_event.dart';
import 'package:assignment/bloc/posts/post_state.dart';
import 'package:assignment/bloc/theme/theme_bloc.dart';
import 'package:assignment/bloc/theme/theme_event.dart';
import 'package:assignment/bloc/theme/theme_state.dart';
import 'package:assignment/helper/session_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:assignment/model/post.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/ui_helper.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final ScrollController _scrollController = ScrollController();
   String? _email; 

  @override
  void initState() {
    super.initState();
 _loadEmail();
    context.read<PostsBloc>().add(FetchPosts());

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        context.read<PostsBloc>().add(FetchPosts());
      }
    });
  }


  Future<void> _loadEmail() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _email = prefs.getString('email'); // Retrieve email
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, themeState) {
      return Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          title: Text( _email != null ? 'Welcome, $_email!' : 'Welcome!',
                    style: TextStyle(fontSize: 16,color: Colors.deepPurple,fontWeight: FontWeight.bold)),

          actions: [
            BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                return Switch(
                 inactiveTrackColor: Colors.white,
                 inactiveThumbColor:Colors.black ,
                 activeColor: Colors.white,
                  value: state.isDarkMode,
                  onChanged: (value) {
                    context.read<ThemeBloc>().add(ToggleTheme());
                  },
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.logout,color: Colors.deepPurple,),
              onPressed: () {
                SessionHelper.clearSession();
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
        body: BlocBuilder<PostsBloc, PostsState>(
          builder: (context, state) {
            if (state is PostsLoading && state is! PostsLoaded) {
              return UIHelper.loadingSpinner();
            } else if (state is PostsError) {
              return UIHelper.errorView(
                message: state.message,
                onRetry: () {
                  context.read<PostsBloc>().add(FetchPosts());
                },
              );
            } else if (state is PostsLoaded) {
              return ListView.builder(
                controller: _scrollController,
                itemCount: state.posts.length +
                    (state.hasMore ? 1 : 0), // Add extra for loader
                itemBuilder: (context, index) {
                  if (index < state.posts.length) {
                    final PostModel post = state.posts[index];
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: themeState.isDarkMode
                                  ? Colors.grey.shade800
                                  : Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8)),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(0),
                        title: Text(
                          post.title ?? '',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(
                          post.body ?? '',
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/postDetails',
                            arguments: post,
                          );
                        },
                      ),
                    );
                  } else {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                },
              );
            }
            return Container();
          },
        ),
      );
    });
  }
}
