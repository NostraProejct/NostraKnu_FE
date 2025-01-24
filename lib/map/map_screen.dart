import 'package:flutter/material.dart';

class MapScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final TransformationController _transformationController = TransformationController();
  String? selectedBuildingName;
  String? selectedBuildingDescription;
  String? selectedBuildingLocation = '강원 춘천시 강원대학길1';
  Offset? selectedMarkerPosition; // 클릭된 동그라미 위치 저장

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildInteractiveMap(context),  // 지도 이미지
          _buildSearchBar(),
          if (selectedBuildingName != null)
            _buildBuildingInfo(context),  // 건물정보창
        ],
      ),
    );
  }

  Widget _buildInteractiveMap(BuildContext context) {
    return InteractiveViewer(
      transformationController: _transformationController,
      panEnabled: true,
      scaleEnabled: true,
      minScale: 1.0,
      maxScale: 4.0,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/campus_map.png',
            fit: BoxFit.contain,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          // 건물 위치 표시 (동그라미)
          _buildLocationMarker(295, 170, '미래광장', '미래광장'),
          _buildLocationMarker(330, 275, '문화예술대학1호관 312동', '문화예술대학 건물'),
          _buildLocationMarker(425, 120, '법학전문대학원 502동', '법학대학 연구실'),
          _buildLocationMarker(440, 250, '친환경지류포장소재관 422동', '친환경지류포장소재관 건물'),
          _buildLocationMarker(355, 35, '강원대학교 한빛관', 'IT대학 건물'),
          _buildLocationMarker(340, 65, '공대 3호관', '공학 관련 강의실'),
        ],
      ),
    );
  }

  // 건물 위치 동그라미 표시
  Widget _buildLocationMarker(double top, double left, String buildingName,
      String description) {
    bool isSelected = selectedMarkerPosition == Offset(left, top);

    return Positioned(
      top: top,
      left: left,
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (isSelected) {
              // 같은 동그라미를 다시 누르면 정보창 닫기
              selectedBuildingName = null;
              selectedBuildingDescription = null;
              selectedMarkerPosition = null;
            } else {
              // 다른 동그라미 클릭 시 정보창 초기화
              selectedBuildingName = buildingName;
              selectedBuildingDescription = description;
              selectedMarkerPosition = Offset(left, top);
            }
          });
        },
        child: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: isSelected ? Colors.red : Colors.orange, // 선택 시 색상 변경
            shape: BoxShape.circle,
            border: isSelected
                ? Border.all(color: Colors.black, width: 1.5) // 선택된 경우 외곽선 추가
                : null,
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Positioned(
      top: 30,
      left: 16,
      right: 16,
      child: SearchBar(
        constraints: BoxConstraints(maxWidth: 350, maxHeight: 50),
        elevation: MaterialStatePropertyAll(3),
        hintText: '여기서 검색',
        leading: Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.search_rounded),
        ),
        trailing: [
          IconButton(
            icon: const Icon(Icons.keyboard_voice),
            onPressed: () {
              // 마이크
            },
          ),
          IconButton(
            icon: const Icon(Icons.camera_alt),
            onPressed: () {
              // 사진
            },
          ),
        ],
        onChanged: (value) {
          // 검색어 작성 중 텍스트가 변경된 경우 함수실행 설정
        },
        onTap: () {
          // 검색바 클릭했을 때 동작
        },
      ),
    );
  }

  Widget _buildBuildingInfo(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.4, // 처음 보여질 크기
      minChildSize: 0.3, // 최소 크기
      maxChildSize: 0.9, // 최대 크기
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          child: ListView(
            controller: scrollController,
            padding: EdgeInsets.symmetric(vertical: 5),
            children: [
              // 드래그 핸들러
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 5, bottom: 5),
                  width: 60,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              // 건물 이름과 이미지
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 건물 이름
                    Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              selectedBuildingName!,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[300],
                              ),
                            ),
                            SizedBox(height: 1,),
                            Text(
                              selectedBuildingDescription!,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[600]
                              ),
                            ),
                          ],
                        )
                    ),
                    // 건물 이미지
                    Container(
                      width: 120,
                      height: 85,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage('assets/images/building_placeholder.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // 건물 위치
              _buildBuildingLocation(),
              // 상세 정보
              _buildBuildingDetail(),
            ],
          )
        );
      },
    );
  }

  Widget _buildBuildingLocation() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 거리
          Container(
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 6),
                Text(
                  '454m',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(width: 6),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[300],
                    foregroundColor: Colors.blueGrey[900],
                    shadowColor: Colors.blue,
                    elevation: 1.0,
                    minimumSize: Size(50, 10),
                    padding: EdgeInsets.symmetric(horizontal: 1,),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onPressed: () {
                    //
                  },
                  child: Text(
                    '길 안내',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // 위치
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.location_pin, size: 22,
                  color: Colors.blue,),
                SizedBox(width: 2),
                Text(
                  selectedBuildingLocation!,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBuildingDetail() {
    return Padding(
        padding: EdgeInsets.all(16),
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '상세 정보',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 10),
              Text(
                '건물 상제 정보~~~ ',
                style: TextStyle(
                    fontSize: 16
                ),
              ),
              SizedBox(height: 10),
              Text(
                '추가 정보 1: ...',
                style: TextStyle(
                    fontSize: 16
                ),
              ),
              SizedBox(height: 100),
              Text(
                '추가 정보 2: ...',
                style: TextStyle(
                    fontSize: 16
                ),
              ),
            ],
          ),
        )
    );
  }

}