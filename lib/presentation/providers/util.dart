enum CallState { notRequested, inProgress, error, completed }

class GetData<T> {
  GetData({
    this.data,
    this.state = CallState.notRequested,
    this.errorMsg,
  });

  final T? data;
  final CallState state;
  final String? errorMsg;
}
