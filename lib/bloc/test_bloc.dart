import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testbloc/bloc/test_event.dart';
import 'package:testbloc/bloc/test_state.dart';

class NewsTopBloc extends Bloc<TestBlocEvent, TestBlocState> {
  NewsTopBloc() : super(TestBlocLoadingState());

  @override
  Stream<TestBlocState> mapEventToState(TestBlocEvent event) async* {
    if (event is FetchEvent) {
      yield* _mapFetchDataState(event);
    }
  }
}

Stream<TestBlocState> _mapFetchDataState(FetchEvent event) async* {
  yield TestBlocLoadingState();
  //api call

  yield TestBlocCompletedState("Success");
  yield TestBlocErrorState("Error");
}
