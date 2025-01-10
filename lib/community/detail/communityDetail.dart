import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nostra/community/detail/communityChatList.dart';
import 'package:nostra/community/detail/title/communityDetailTitle.dart';

class CommunityDetail extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _CommunityDetail();
}

class _CommunityDetail extends State<CommunityDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CommunityDetailTitle(),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.go('/community/list');
          },
        ),
      ),
      body: Container(
        child: Stack(
          children: [
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          width: 40,  // Set desired width
                          height: 40, // Set desired height
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            image: DecorationImage(
                              image: AssetImage('assets/images/HomeSliderPicture_1.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Row(
                              children: [
                                Text("Lamu"),
                                SizedBox(width: 10,),
                                Text("2시간 전")
                              ],
                            ),
                            SizedBox(
                              width: 200,
                              child: Text("경기도 고양시............................."),
                            )
                          ],
                        ),
                        Expanded(
                          child:
                          Container(
                            width: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(
                                  child: Text(
                                    '함께 걷는 사람 ${'1231'}명',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                                Container(
                                    alignment: Alignment.centerRight,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.favorite, size: 16, color: Colors.red),
                                        Text(
                                          '131',
                                          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                                        ),
                                      ],
                                    )
                                )
                              ],
                            ),
                          ),

                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 120,
                    child: Text("대충 긴글"),
                  ),
                  Container(
                    width: 390,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      image: DecorationImage(
                        image: AssetImage('assets/images/HomeSliderPicture_1.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16, left: 11),
                    child: Row(
                      children: [
                        Icon(Icons.favorite, size: 18,color: Colors.red,),
                        Text("개추"),
                        SizedBox(width: 10,),
                        Image.asset('assets/images/Favorites.png', width: 18,)
                      ],
                    ),
                  )
                ],
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.4,
              minChildSize: 0.4,
              maxChildSize: 1.0,
              builder: (BuildContext context, ScrollController scrollController) {
                return Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 10,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 10,
                              offset: Offset(10, -6),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        color: Colors.white, // 배경색
                      ),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Container(
                          height: 1500,
                          child: CommunityChatList(),
                        ),
                      ),
                    ),
                  ],
                );
              },
              snap: true,
            )

          ],
        ),
      ),
    );
  }
}