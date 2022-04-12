import 'package:multipurpose_security_system/Model/Login/user.dart';

class LoginApi {

  final bool error;
  final String message;
  final User user;

	LoginApi.fromJsonMap(Map<String, dynamic> map): 
		error = map["error"],
		message = map["message"],
		user = User.fromJsonMap(map["user"]);

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['error'] = error;
		data['message'] = message;
		data['user'] = user == null ? null : user.toJson();
		return data;
	}
}
