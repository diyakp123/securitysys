import 'package:multipurpose_security_system/Model/Warning/warning.dart';

class WarningListApi {

  final List<Warning> warning;
  final bool error;
  final String message;

	WarningListApi.fromJsonMap(Map<String, dynamic> map): 
		warning = List<Warning>.from(map["warning"].map((it) => Warning.fromJsonMap(it))),
		error = map["error"],
		message = map["message"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['warning'] = warning != null ? 
			this.warning.map((v) => v.toJson()).toList()
			: null;
		data['error'] = error;
		data['message'] = message;
		return data;
	}
}
