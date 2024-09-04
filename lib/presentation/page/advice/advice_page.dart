import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_schulung/domain/repositories/advice_repo.dart';
import 'package:flutter_schulung/domain/use_case/advice_use_case.dart';
import 'package:flutter_schulung/presentation/page/advice/cubit/advice_page_cubit.dart';

class AdvicePageProvider extends StatelessWidget {
  const AdvicePageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AdvicePageCubit>(
      create: (context) => AdvicePageCubit(
        useCase: AdviceUseCase(
          repository: RepositoryProvider.of<AdviceRepo>(context),
        ),
      ),
      child: const AdvicePage(),
    );
  }
}

class AdvicePage extends StatelessWidget {
  const AdvicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: BlocBuilder<AdvicePageCubit, AdvicePageState>(
            builder: (context, state) {
              switch (state) {
                case AdvicePageEmpty _:
                  return const Text('Empty');
                case AdvicePageLoading _:
                  return const CircularProgressIndicator();
                case AdvicePageLoaded loaded:
                  return Text(loaded.entity.advice);
                case AdvicePageError _:
                  return const Text('FEHLER');
              }
            },
          ),
        ),
        OutlinedButton(
          onPressed: BlocProvider.of<AdvicePageCubit>(context).fetchAdvice,
          child: const Text('fetch'),
        ),
      ],
    );
  }
}
