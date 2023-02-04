import 'package:app/helpers/injection.dart';
import 'package:app/src/widgets/list_items/pr_list_item.dart';
import 'package:core/core/bloc/pr_bloc/pr_bloc.dart';
import 'package:core/core/bloc/pr_bloc/pr_event.dart';
import 'package:core/core/bloc/pr_bloc/pr_state.dart';
import 'package:core/layers/domain/entities/git_rep.dart';
import 'package:core/layers/domain/entities/pull_request.dart';
import 'package:core/layers/domain/usecases/get_pull_request_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PullRequestPage extends StatefulWidget {
  final GitRep rep;
  const PullRequestPage({Key? key, required this.rep}) : super(key: key);

  @override
  State<PullRequestPage> createState() => _PullRequestPageState();
}

class _PullRequestPageState extends State<PullRequestPage> {
  late final PrBloc bloc;

  @override
  void initState() {
    bloc = PrBloc(loadCase: getIt<GetPullRequestUseCase>(), rep: widget.rep);
    bloc.add(OnPrEventLoad());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.rep.name),
          leading: const BackButton(),
        ),
        body: BlocBuilder(
          bloc: bloc,
          builder: (context, state) {
            if (state is PrStateNotLoaded) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PrStateEmpty) {
              return const Center(
                  child: Text('Nennhum Pull Request Encontrado!'));
            } else if (state is PrStateLoaded) {
              final List<PullRequest> prs = state.list;
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: prs.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return PrListItem(pr: prs[index]);
                },
              );
            }
            return const ListTile();
          },
        ),
      ),
    );
  }
}
