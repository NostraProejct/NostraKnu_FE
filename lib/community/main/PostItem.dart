import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nostra/community/main/data/data.dart';


class PostItem extends StatelessWidget {
  final Data data;
  const PostItem({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      data.author,
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                    SizedBox(width: 8),
                    Text(
                      data.timeAgo,
                      style: TextStyle(fontSize: 8, color: Colors.grey[600]),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  data.content,
                  style: TextStyle(fontSize: 9),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Row(
            children: [
              Icon(Icons.favorite, size: 16, color: Colors.red),
              SizedBox(width: 4),
              Text(
                data.likes.toString(),
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}