import 'package:flutter/material.dart';

class NoticeMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NoticeMain();
  }
}

class _NoticeMain extends State<NoticeMain> {
  int currentPage = 1;
  final int itemsPerPage = 5;
  final int totalPages = 10;

  final List<Map<String, String>> notices = List.generate(
    50, (index) => {
      "id": "${1045 - index}",
      "title": "공지사항 ${index + 1} 제목",
      "date": "24.10.${(index % 30 + 1).toString().padLeft(2, '0')}"
    },
  );

  List<Map<String, String>> getCurrentPageNotices() {
    int startIndex = (currentPage - 1) * itemsPerPage;
    int endIndex = startIndex + itemsPerPage;
    return notices.sublist(
        startIndex, endIndex > notices.length ? notices.length : endIndex);
  }

  @override
  Widget build(BuildContext context) {
    final currentNotices = getCurrentPageNotices();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "공지사항",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // 검색 기능 추가
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: currentNotices.length,
              itemBuilder: (context, index) {
                final notice = currentNotices[index];
                return GestureDetector(
                  onTap: () {
                    // 공지사항 상세 페이지로 이동
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NoticeDetailScreen(
                          id: notice["id"]!,
                          title: notice["title"]!,
                          date: notice["date"]!,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notice["id"]!,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          notice["title"]!,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          notice["date"]!,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // 페이지네이션 바
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios, size: 16),
                  onPressed: () {
                    if (currentPage > 1) {
                      setState(() {
                        currentPage--;
                      });
                    }
                  },
                ),
                ...List.generate(5, (index) {
                  int page = currentPage - 2 + index;
                  if (page < 1 || page > totalPages) return SizedBox();
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        currentPage = page;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.0),
                      padding:
                      EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                      decoration: BoxDecoration(
                        color:
                        page == currentPage ? Colors.blue : Colors.white,
                        borderRadius: BorderRadius.circular(4.0),
                        border: Border.all(
                          color:
                          page == currentPage ? Colors.blue : Colors.grey,
                        ),
                      ),
                      child: Text(
                        "$page",
                        style: TextStyle(
                          fontSize: 14,
                          color: page == currentPage
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  );
                }),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios, size: 16),
                  onPressed: () {
                    if (currentPage < totalPages) {
                      setState(() {
                        currentPage++;
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 공지사항 상세 화면
class NoticeDetailScreen extends StatelessWidget {
  final String id;
  final String title;
  final String date;

  NoticeDetailScreen({required this.id, required this.title, required this.date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("공지사항 글", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              id,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              date,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            SizedBox(height: 16),
            Expanded(
              child: Text(
                "공지사항 내용. 데이터베이스에서 가져올 예정",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
