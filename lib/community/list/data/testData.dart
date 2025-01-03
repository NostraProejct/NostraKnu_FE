final boardDatas = [
  BoardTextData_pre(
    title: '정보 게시판',
    posts: [
      Data_pre('Lamu_01', '24시간 전', '이거 보아주려고 여기로 왔었다', 115),
      Data_pre('KARL', '3일 전', '김준희 비보', 98),
      Data_pre('Lamu_01', '5분 전', '대충 긴 정보', 76),
    ],
  ),
  BoardTextData_pre(
    title: '취업ㆍ진로 게시판',
    posts: [
      Data_pre('Lamu_01', '3시간 전', '스터디 화상부 구합니다', 221),
      Data_pre('KARL0263', '1년 전', '23 년 경쟁과 여친구함', 169),
      Data_pre('Lamu_01', '5초 전', '부트캠프 참가자 모집!!', 99),
    ],
  ),
  BoardTextData_pre(
    title: '대외활동 게시판',
    posts: [
      Data_pre('Lamu_01', '2분 전', '바이오 멘토커 2기 모집', 132),
      Data_pre('KARL', '11시간 전', '메디엑스 3기 모집합니다', 54),
      Data_pre('Lamu_01', '5일 전', '신청순 3명 영어카페케이 5기 모집중', 22),
    ],
  ),
  BoardTextData_pre(
    title: '대외활동 게시판',
    posts: [
      Data_pre('Lamu_01', '2분 전', '바이오 멘토커 2기 모집', 132),
      Data_pre('KARL', '11시간 전', '메디엑스 3기 모집합니다', 54),
      Data_pre('Lamu_01', '5일 전', '신청순 3명 영어카페케이 5기 모집중', 22),
    ],
  ),
  BoardTextData_pre(
    title: '대외활동 게시판',
    posts: [
      Data_pre('Lamu_01', '2분 전', '바이오 멘토커 2기 모집', 132),
      Data_pre('KARL', '11시간 전', '메디엑스 3기 모집합니다', 54),
      Data_pre('Lamu_01', '5일 전', '신청순 3명 영어카페케이 5기 모집중', 22),
    ],
  ),
  BoardTextData_pre(
    title: '대외활동 게시판',
    posts: [
      Data_pre('Lamu_01', '2분 전', '바이오 멘토커 2기 모집', 132),
      Data_pre('KARL', '11시간 전', '메디엑스 3기 모집합니다', 54),
      Data_pre('Lamu_01', '5일 전', '신청순 3명 영어카페케이 5기 모집중', 22),
    ],
  ),  BoardTextData_pre(
    title: '대외활동 게시판',
    posts: [
      Data_pre('Lamu_01', '2분 전', '바이오 멘토커 2기 모집', 132),
      Data_pre('KARL', '11시간 전', '메디엑스 3기 모집합니다', 54),
      Data_pre('Lamu_01', '5일 전', '신청순 3명 영어카페케이 5기 모집중', 22),
    ],
  ),  BoardTextData_pre(
    title: '대외활동 게시판',
    posts: [
      Data_pre('Lamu_01', '2분 전', '바이오 멘토커 2기 모집', 132),
      Data_pre('KARL', '11시간 전', '메디엑스 3기 모집합니다', 54),
      Data_pre('Lamu_01', '5일 전', '신청순 3명 영어카페케이 5기 모집중', 22),
    ],
  ),  BoardTextData_pre(
    title: '대외활동 게시판',
    posts: [
      Data_pre('Lamu_01', '2분 전', '바이오 멘토커 2기 모집', 132),
      Data_pre('KARL', '11시간 전', '메디엑스 3기 모집합니다', 54),
      Data_pre('Lamu_01', '5일 전', '신청순 3명 영어카페케이 5기 모집중', 22),
    ],
  ),
];

class BoardTextData_pre {
  final String title;
  final List<Data_pre> posts;

  BoardTextData_pre({required this.title, required this.posts});
}

class Data_pre {
  final String author;
  final String time;
  final String content;
  final int likes;

  Data_pre(this.author, this.time, this.content, this.likes);
}