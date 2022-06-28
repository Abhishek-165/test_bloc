abstract class TestBlocEvent {}

class FetchEvent extends TestBlocEvent {
  String uid;
  FetchEvent(this.uid);
}
