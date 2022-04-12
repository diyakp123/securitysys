
class User {

  final String l_id;
  final String l_name;
  final String l_email;
  final String l_pass;
  final String l_phone;
  final String l_role;
  final String l_status;

	User.fromJsonMap(Map<String, dynamic> map): 
		l_id = map["l_id"],
		l_name = map["l_name"],
		l_email = map["l_email"],
		l_pass = map["l_pass"],
		l_phone = map["l_phone"],
		l_role = map["l_role"],
		l_status = map["l_status"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['l_id'] = l_id;
		data['l_name'] = l_name;
		data['l_email'] = l_email;
		data['l_pass'] = l_pass;
		data['l_phone'] = l_phone;
		data['l_role'] = l_role;
		data['l_status'] = l_status;
		return data;
	}
}
