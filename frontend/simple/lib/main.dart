import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:simple/bloc.dart';
import 'package:simple/data.dart';

// flutter pub run build_runner watch --delete-conflicting-outputs

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = await HydratedBlocDelegate.build();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<DataBloc>(create: (_) => DataBloc()),
          BlocProvider<LogBloc>(create: (_) => LogBloc()),
          BlocProvider<ComputeBloc>(
            create: (context) => ComputeBloc(context.bloc<DataBloc>()),
          ),
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<ComputeBloc, ComputeState>(
              listener: (context, state) {
                final logBloc = context.bloc<LogBloc>();
                return state.when(
                  available: (data) => logBloc.add(LogEvent.logData(data)),
                  empty: () => logBloc.add(LogEvent.logBlank()),
                );
              },
            ),
            BlocListener<DataBloc, Data>(
              listener: (context, state) {
                context.bloc<ComputeBloc>().add(ComputeEvent.onNew(state));
              },
            ),
          ],
          child: Builder(
            builder: (context) => Scaffold(
              floatingActionButton: FloatingActionButton(
                child: Text("clear"),
                onPressed: () {
                  context.bloc<ComputeBloc>().clear();
                },
              ),
              body: Container(
                constraints: BoxConstraints.expand(),
                color: Colors.black,
                child: BlocBuilder<LogBloc, String>(
                  builder: (context, state) => Center(
                    child: Text(
                      state,
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
