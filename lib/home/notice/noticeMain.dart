import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NoticeMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NoticeMain();
  }
}

class _NoticeMain extends State<NoticeMain> {
  int currentPageGroupIndex = 1;
  int currentPage = 1;
  final int itemsPerPage = 5;

  final List<Map<String, String>> notices = List.generate(63, (index) => {
      "id": "${1045 - index}",
      "title": "공지사항 ${index + 1} 제목",
      "date": "24.10.${(index % 30 + 1).toString().padLeft(2, '0')}"
    },
  );

  // 데이터 기반으로 총 페이지 계산
  int get totalPages => (notices.length / itemsPerPage).ceil();

  // 현재 페이지 그룹에 해당하는 페이지 목록 반환
  List<int> getPageNumbersForCurrentGroup() {
    int startPage = (currentPageGroupIndex - 1) * itemsPerPage + 1;
    int endPage = startPage + itemsPerPage - 1;
    if (endPage > totalPages) endPage = totalPages;
    return List.generate(endPage - startPage + 1, (index) => startPage + index);
  }

  // 현재 페이지에 해당하는 공지사항 가져오기
  List<Map<String, String>> getNoticesForCurrentPage() {
    int startIndex = (currentPage - 1) * itemsPerPage;
    int endIndex = startIndex + itemsPerPage;

    // 데이터가 없는 페이지 빈 리스트 반환
    if (startIndex >= notices.length) {
      return [];
    }
    return notices.sublist(startIndex, endIndex > notices.length ? notices.length : endIndex);
  }

  @override
  Widget build(BuildContext context) {
    final currentPageNumbers = getPageNumbersForCurrentGroup();

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          iconSize: 26,
          onPressed: () => context.pop(),
        ),
        title: Text(
          '공지사항',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            iconSize: 26,
            onPressed: () {
              // 검색 기능
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: getNoticesForCurrentPage().length,
              itemBuilder: (context, index) {
                final notice = getNoticesForCurrentPage()[index];
                return GestureDetector(
                  onTap: () {
                    context.push('/notice/${notice["id"]}', extra: {
                      "id": notice["id"]!,
                      "title": notice["title"]!,
                      "date": notice["date"]!,
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 9.0, horizontal: 16.0),
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
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
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4),
                        Container(
                          height: 44,
                          child: Text(
                            notice["title"]!,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
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
            padding: const EdgeInsets.symmetric(vertical: 14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios, size: 16),
                  onPressed: () {
                    if (currentPageGroupIndex > 1) {
                      setState(() {
                        currentPageGroupIndex--;
                        currentPage = (currentPageGroupIndex - 1) * itemsPerPage + 1;
                      });
                    }
                  },
                ),
                ...currentPageNumbers.map((page) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        currentPage = page; // 선택된 페이지 변경
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.0),
                      padding:
                      EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                      decoration: BoxDecoration(
                        color: page == currentPage ? Colors.blue : Colors.white,
                        borderRadius: BorderRadius.circular(4.0),
                        border: Border.all(
                          color: page == currentPage ? Colors.blue : Colors.grey,
                        ),
                      ),
                      child: Text(
                        "$page",
                        style: TextStyle(
                          fontSize: 14,
                          color:
                          page == currentPage ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  );
                }).toList(),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios, size: 16),
                  onPressed: () {
                    if ((currentPageGroupIndex) * itemsPerPage < totalPages) {
                      setState(() {
                        currentPageGroupIndex++;
                        currentPage = (currentPageGroupIndex - 1) * itemsPerPage + 1;
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
