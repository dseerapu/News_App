class Response<T>{

  final Status status;
  final T?  data;
  final String? message;

  Response.loading([this.message]): status = Status.loading, data = null;
  Response.success([this.data]): status = Status.success, message = null;
  Response.failure([this.message]): status = Status.failure, data = null;

  @override
  String toString() {
    return 'Status + $status \n Message : $message \n data : $data';
  }

}

enum Status{
  loading, success, failure
}