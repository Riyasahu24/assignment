
import 'package:assignment/model/post.dart';
import 'package:assignment/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../utils/ui_helper.dart';

class PostDetailsScreen extends StatelessWidget {
  final PostModel post;

  const PostDetailsScreen({required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Text(post.title ?? '', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              Text(post.body ?? '',style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                          const SizedBox(height: 10),

                          Divider(),
        const SizedBox(height: 10),
              Text('Comments',style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.deepPurple)),
               const SizedBox(height: 10),
              Expanded(
                child: FutureBuilder(
                  future: ApiService().fetchComments(post.id ?? 0),
                  builder: (context, snap) {
                   if (snap.hasData) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snap.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          final comment = snap.data?[index];
                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: 4,vertical: 4),
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 CircleAvatar(child: Icon(Icons.person),),
                                 SizedBox(width: 10,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                 
                                  Text(comment?.email ?? '',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
                                   Text(comment?.name ?? '',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                                Text(comment?.body ?? '',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),),
                                ],),
                              ),
                             
                            ],),
                          );
                        },
                      );
                    } else if (snap.hasError) {
                      return UIHelper.errorView(
                        message: snap.error.toString(),
                        onRetry: () {
                        },
                      );
                    }
                    return UIHelper.loadingSpinner();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
