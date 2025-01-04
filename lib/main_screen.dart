import 'package:flutter/material.dart';

class JobListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Find Your Job"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.grid_view_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "취업분야",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 3, // 반복되는 카드 수
                itemBuilder: (context, index) {
                  return JobCard();
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: '',
          ),
        ],
      ),
    );
  }
}

class JobCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "(주)우아한형제들",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 8),
          Text(
            "각 부문별 경력/신입 인재영입",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 8),
          Text(
            "신입·경력   학력무관   정규직 외   서울 송파구   상시채용",
            style: TextStyle(fontSize: 12, color: Colors.grey[700]),
          ),
          SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: [
              Chip(
                label: Text("#리프레시 휴가", style: TextStyle(fontSize: 12)),
                backgroundColor: Colors.grey[200],
              ),
              Chip(
                label: Text("#복지포인트", style: TextStyle(fontSize: 12)),
                backgroundColor: Colors.grey[200],
              ),
              Chip(
                label: Text("#유연근무", style: TextStyle(fontSize: 12)),
                backgroundColor: Colors.grey[200],
              ),
              Chip(
                label: Text("#도서 구입비 지원", style: TextStyle(fontSize: 12)),
                backgroundColor: Colors.grey[200],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
