class StandardError {
   String? timestamp;
	 int? status;
	 String? error;
	 String? message;
	 String? path;

   StandardError({
    this.error,
    this.message,
    this.path,
    this.status,
    this.timestamp
   }); 

   
  StandardError.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    path = json['path'];
    status = json['status'];
    timestamp = json['timestamp'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['message'] = message;
    data['path'] = path;
    data['status'] = status;
    data['timestamp'] = timestamp;

    return data;
  }
}