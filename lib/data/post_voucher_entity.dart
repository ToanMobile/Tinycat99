class PostVoucherEntity {
	PostVoucherFields fields;

	PostVoucherEntity({this.fields});

	PostVoucherEntity.fromJson(Map<String, dynamic> json) {
		fields = json['fields'] != null ? new PostVoucherFields.fromJson(json['fields']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.fields != null) {
      data['fields'] = this.fields.toJson();
    }
		return data;
	}
}

class PostVoucherFields {
	String time;
	String name;
	String phone;
	String ku;

	PostVoucherFields({this.time, this.name, this.phone, this.ku});

	PostVoucherFields.fromJson(Map<String, dynamic> json) {
		time = json['Time'];
		name = json['Name'];
		phone = json['Phone'];
		ku = json['Ku'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['Time'] = this.time;
		data['Name'] = this.name;
		data['Phone'] = this.phone;
		data['Ku'] = this.ku;
		return data;
	}
}
