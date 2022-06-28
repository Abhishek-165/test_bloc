abstract class TestBlocState {}

class TestBlocLoadingState extends TestBlocState {}

class TestBlocCompletedState extends TestBlocState {
  String data;
  TestBlocCompletedState(this.data);
}

class TestBlocErrorState extends TestBlocState {
  String error;
  TestBlocErrorState(this.error);
}
