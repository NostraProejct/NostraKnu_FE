class API {
  static const hostConnect = "http://192.168.75.247/api_new_members"; // http:// ipv4 주소/ 만든 폴더
  static const hostConnectUser = "$hostConnect/Nostra_api/user"; //hostConnect를 이용하여 user 폴더까지 접근

  static const signup = "$hostConnect/Nostra_api/user/signup.php"; //사용자의 signup과정 진행을 위해 signup.php파일에 접근할 수 있는 변수 생성
                                                        // -> signup 변수에 signup.php파일의 경로 전달
  static const validateEmail = "$hostConnect/user/validate_email.php"; // 위에꺼와 마찬가지로 validate_email.php파일에 접근할 수 있는 변수 생성
                                                                        // -> validateEmail 변수에 validate_email.php파일의 경로 전달
}