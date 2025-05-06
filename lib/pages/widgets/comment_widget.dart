import 'package:flutter/material.dart';


class CommentWidget extends StatelessWidget {
  final String imageUrl;
  final String user;
  final String comment;
  const CommentWidget({super.key, required this.imageUrl, required this.user, required this.comment});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
            ),
            SizedBox(width: 10,),
            Text(user)
          ],
        ),
        SizedBox(height: 10,),
        Text(comment),
        Row(
          children: [
            Text('23 hours ago', style: TextStyle(color: Colors.grey),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: CircleAvatar(
                radius: 2,
                backgroundColor: Colors.grey,
              ),
            ),
            Text('World', style: TextStyle(color: Colors.grey),)
          ],
        )
      ],
    );
  }
}
