import 'package:multipurpose_security_system/Model/Gas/gas.dart';

class GasListApi {

  final List<Gas> gas;
  final bool error;
  final String message;

	GasListApi.fromJsonMap(Map<String, dynamic> map): 
		gas = List<Gas>.from(map["gas"].map((it) => Gas.fromJsonMap(it))),
		error = map["error"],
		message = map["message"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['gas'] = gas != null ? 
			this.gas.map((v) => v.toJson()).toList()
			: null;
		data['error'] = error;
		data['message'] = message;
		return data;
	}
}
