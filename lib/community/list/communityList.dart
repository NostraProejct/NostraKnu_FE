import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.0),
            child: SizedBox(
              width: 85,
              height: 30,
              child: OutlinedButton(
                onPressed: () {
                  context.go('/community/write');
                },
                child: Text('글 작성하기', style: TextStyle(fontSize: 10),),
                style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Color(0xFFE8E8E8),
                    side: BorderSide.none,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                    ),
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16)
                ),
              ),
            )
          ),
          Expanded(
            child: PagedListView<int, Data_pre>(
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<Data_pre>(
                  itemBuilder: (context, item, index) => GestureDetector(
                    onTap: () {
                      context.go('/community/detailPost', extra: item);
                    },
                    child: Column(
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
                              Container(
                                width: 40, 
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.favorite, size: 16, color: Colors.red),
                                    Text(
                                      item.likes.toString(),
                                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                                    ),
                                  ],
                                ),
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
                    ),
                  ),
              ),
            ),
          )
        ],
      )
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}


Future<List<Data_pre>> fetchData(int pageKey, int pageSize) async {
  return boardDatas.expand((board) => board.posts).skip(pageKey).take(pageSize).toList();
}