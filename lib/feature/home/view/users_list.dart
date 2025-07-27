import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chaitra/feature/user/view/user_controllers.dart';
import 'package:flutter_chat_types/src/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';


class UsersList extends ConsumerWidget {
  const UsersList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(allUserStreamProvider);
    return Container(
      padding: EdgeInsets.all(10),
      height: 100,

      child: users.when(
          data: (data){
            return _buildListView(data);
          },
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => Skeletonizer(
              child: _buildListView(List.generate(3, (index) => User(
                id: 's;dlksa',
                metadata: {},
                firstName: 'asl;dkas',
                imageUrl: 'https://plus.unsplash.com/premium_photo-1753303051854-0e9b97c3c895?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwyfHx8ZW58MHx8fHx8'
              ))),
          ),
      ),
    );
  }

  ListView _buildListView(List<User> data) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(width: 10,),
            scrollDirection: Axis.horizontal ,
            itemCount: data.length,
            itemBuilder: (context, index) => Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: CachedNetworkImageProvider(data[index].imageUrl!),
                ),
                Text(data[index].firstName!, style: const TextStyle(fontWeight: FontWeight.w500),),
              ],
            ),
          );
  }
}