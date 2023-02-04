import 'package:app/helpers/injection.dart';
import 'package:app/src/widgets/list_items/git_rep_list_item.dart';
import 'package:core/core/bloc/git_rep_bloc/git_rep_bloc.dart';
import 'package:core/core/bloc/git_rep_bloc/git_rep_event.dart';
import 'package:core/core/bloc/git_rep_bloc/git_rep_state.dart';
import 'package:core/layers/domain/entities/git_rep.dart';
import 'package:core/layers/domain/repositories/i_git_rep_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final GitRepBloc bloc;
  late final IGitRepRepository repository;

  @override
  void initState() {
    bloc = getIt<GitRepBloc>();
    bloc.add(OnGitRepEventLoad());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: Scaffold(
        appBar: AppBar(title: const Center(child: Text('Repositórios'))),
        body: BlocBuilder(
          bloc: bloc,
          builder: (context, state) {
            if (state is GitRepStateNotLoaded) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GitRepStateEmpty) {
              return const Center(
                  child: Text('Nenhum repositório encontrado!'));
            } else if (state is GitRepStateError) {
              return Text('State Error: ${state.error}');
            } else if (state is GitRepStateLoaded) {
              List<GitRep> repositories = state.list;
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: repositories.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GitRepListItem(rep: repositories[index]);
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
