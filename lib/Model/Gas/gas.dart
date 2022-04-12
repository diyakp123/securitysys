
class Gas {

  final String mq_id;
  final String device_id;
  final String mq4_value;
  final String reading_time;

	Gas.fromJsonMap(Map<String, dynamic> map): 
		mq_id = map["mq_id"],
		device_id = map["device_id"],
		mq4_value = map["mq4_value"],
		reading_time = map["reading_time"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['mq_id'] = mq_id;
		data['device_id'] = device_id;
		data['mq4_value'] = mq4_value;
		data['reading_time'] = reading_time;
		return data;
	}
}
