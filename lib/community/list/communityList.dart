import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'data/testData.dart';

class CommunityList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CommunityList();
}

class _CommunityList extends State<CommunityList> {
  static const _pageSize = 100;

  final PagingController<int, Data_pre> _pagingController = PagingController(firstPageKey: 0);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await fetchData(pageKey, _pageSize);
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, Data_pre>(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<Data_pre>(
        itemBuilder: (context, item, index) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 0, left: 8, right: 8, top: 11),
              margin: EdgeInsets.symmetric(horizontal: 13),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.content, style: TextStyle(fontWeight: FontWeight.bold),),
                        Text(item.author),
                        Text(item.time, style: TextStyle(color: Colors.grey, fontSize: 10),)
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.favorite, size: 16, color: Colors.red),
                      SizedBox(width: 4),
                      Text(
                        item.likes.toString(),
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 21),
              child: Divider(thickness: 1, color: Colors.grey[203]),
            ),
          ],
        )
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}


Future<List<Data_pre>> fetchData(int pageKey, int pageSize) async {
  await Future.delayed(Duration(seconds: 2));
  return boardDatas.expand((board) => board.posts).skip(pageKey).take(pageSize).toList();
}