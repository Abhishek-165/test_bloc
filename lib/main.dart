import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testbloc/bloc/test_bloc.dart';
import 'package:testbloc/bloc/test_event.dart';
import 'package:testbloc/bloc/test_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NewsTopBloc? newsTopBloc;
  @override
  void initState() {
    super.initState();
    newsTopBloc = NewsTopBloc();
    newsTopBloc!.add(FetchEvent("1"));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => NewsTopBloc(),
        ),
      ],
      child: BlocBuilder<NewsTopBloc, TestBlocState>(
          bloc: NewsTopBloc(),
          buildWhen: (prevState, currState) {
            return (currState is TestBlocCompletedState ||
                currState is TestBlocLoadingState);
          },
          builder: ((context, state) {
            if (state is TestBlocLoadingState) {
              return const Scaffold(
                  body: SafeArea(child: Center(child: Text("Loading State "))));
            } else if (state is TestBlocCompletedState) {
              return Scaffold(
                  body: SafeArea(child: Center(child: Text(state.data))));
            }
            return const Scaffold();
          })),
    );
  }
}
