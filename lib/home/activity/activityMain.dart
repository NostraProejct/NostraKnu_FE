import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ActivityMain extends StatefulWidget {
  const ActivityMain({super.key});

  @override
  State<ActivityMain> createState() => _ActivityMainState();
}

class _ActivityMainState extends State<ActivityMain> {
  String _selectedCategory = '전체';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        iconSize: 26,
        onPressed: () => context.pop(),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search_rounded, color: Color(0xFF919191),),
                  contentPadding: EdgeInsets.symmetric(vertical:5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)), // 꼭지점을 둥글게
                    borderSide: BorderSide.none, // 테두리 없애기
                  ),
                  filled: true,
                  fillColor: Color(0xFFE8E8E8),
                  hintText: 'Search all Components',
                  hintStyle: TextStyle(color: Color(0xFF919191))
              ),
            ),
          ),
          SizedBox(width: 40,)
        ],
      ),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  'Find',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Text(
                  'Your',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 50.0),
                    child: Text(
                      'Job',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DropdownButton<String>(
                    value: _selectedCategory,
                    items: <String>['전체', '프론트', '백엔드', 'AI']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        if (newValue != null) {
                          _selectedCategory = newValue;
                        } else {
                          _selectedCategory = '전체';
                        }
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: Scrollbar(
              thumbVisibility: true,
              child: ListView.builder(
                itemCount: 6, // 채용 공고 개수
                itemBuilder: (context, index) {
                  return JobCard(index: index); // JobCard 위젯 호출
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class JobCard extends StatelessWidget {
  final int index;

  const JobCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: const EdgeInsets.only(top: 0, bottom: 16, right: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF), // 배경색
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE3D5CA), width: 6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '채용 공고 ${index + 1}', // 각 공고 제목
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8), // 여백을 줄임
          const Text(
            '클릭하면 취업사이트로 이동.', // 임시 내용
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}