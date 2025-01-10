import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../list/data/testData.dart';

class CommunityChatList extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _CommunityChatList();
}

class _CommunityChatList extends State<CommunityChatList> {
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
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.4),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 2),
              )
            ]
        ),
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Container(
              width: 75,
              height: 7,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: PagedListView<int, Data_pre> (
                pagingController: _pagingController,
                builderDelegate: PagedChildBuilderDelegate<Data_pre>(
                    itemBuilder: (context, item, index) => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          width: 40,  // Set desired width
                          height: 40, // Set desired height
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0), // Adjust the border radius
                            image: DecorationImage(
                              image: AssetImage('assets/images/HomeSliderPicture_1.jpg'),
                              fit: BoxFit.cover, // Adjust the image's fit behavior
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Row(
                              children: [
                                Text("저자"),
                                SizedBox(width: 10,),
                                Text("시간")
                              ],
                            ),
                            SizedBox(
                              width: 300,
                              child: Text("내용이 들어갈 자리입니다................"),
                            )
                          ],
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
                    )
                ),
              ),
            )
          ],
        )
    );
  }
}

Future<List<Data_pre>> fetchData(int pageKey, int pageSize) async {
  return boardDatas.expand((board) => board.posts).skip(pageKey).take(pageSize).toList();
}