import 'package:multipurpose_security_system/Model/Flames/smoke.dart';

class FlameListApi {

  final List<Smoke> smoke;
  final bool error;
  final String message;

	FlameListApi.fromJsonMap(Map<String, dynamic> map): 
		smoke = List<Smoke>.from(map["smoke"].map((it) => Smoke.fromJsonMap(it))),
		error = map["error"],
		message = map["message"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['smoke'] = smoke != null ? 
			this.smoke.map((v) => v.toJson()).toList()
			: null;
		data['error'] = error;
		data['message'] = message;
		return data;
	}
}
