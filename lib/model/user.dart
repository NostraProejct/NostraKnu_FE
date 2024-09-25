class User{
  int user_id;
  String user_name;
  String user_email;
  String user_password;

  User(this.user_id, this.user_name, this.user_email, this.user_password);

  Map<String, dynamic> toJson()=>{  // 입력된 데이터를 json포맷으로 바꾸는 과정
    'user_id' : user_id.toString(),
    'user_name' : user_name,
    'user_email' : user_email,
    'user_password' : user_password,
  };  // Map<우리가 생성한 키네임, 밸류 값>
}
//https://velog.io/@bxxloob_-/flutter-%ED%94%8C%EB%9F%AC%ED%84%B0%EC%97%90%EC%84%9C-json-%EC%82%AC%EC%9A%A9%ED%95%98%EA%B8%B0
// json 설명