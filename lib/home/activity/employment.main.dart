import 'package:flutter/material.dart';

class Employment extends StatefulWidget {
  const Employment({super.key});

  @override
  State<Employment> createState() => _EmploymentState();
}

class _EmploymentState extends State<Employment> {
  String _selectedCategory = '전체';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: null,
        toolbarHeight: 10,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(padding: EdgeInsets.only(left: 10.0),
                  child: Text('Find', style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Text('Your', style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 50.0),
                      child: Text('Job', style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      )),
                    ),
                    DropdownButton<String>(
                      value: _selectedCategory,
                      items: <String>['전체', '프론트', '백엔드', 'AI']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value), // 드롭다운 항목에 표시될 텍스트
                        );
                      }).toList(),
                      onChanged: (String? newValue) { // 항목이 선택되었을때 호출되는 콜백 함수
                        setState(() { // 상태를 업그레이드해서 UI를 다시 그린다.
                          if(newValue != null){
                            _selectedCategory = newValue;
                          } else {
                            _selectedCategory = '전체'; //기본값
                          }
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            // 채용 공고 카드 리스트
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
      ),
    );
  }
}

// 채용 공고 카드 위젯
class JobCard extends StatelessWidget {
  final int index;

  const JobCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: const EdgeInsets.only(top: 0, bottom: 16, right:20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF), // 배경색
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0xFFE3D5CA), width: 6)
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
