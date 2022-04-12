
class DashboardApi {

  final String flame;
  final String gas;
  final String smoke;
  final String temperature;
  final String count;
  final bool error;
  final String message;

	DashboardApi.fromJsonMap(Map<String, dynamic> map): 
		flame = map["flame"],
		gas = map["gas"],
		smoke = map["smoke"],
		temperature = map["temperature"],
		count = map["count"],
		error = map["error"],
		message = map["message"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['flame'] = flame;
		data['gas'] = gas;
		data['smoke'] = smoke;
		data['temperature'] = temperature;
		data['count'] = count;
		data['error'] = error;
		data['message'] = message;
		return data;
	}
}
