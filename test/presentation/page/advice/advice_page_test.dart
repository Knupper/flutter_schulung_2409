import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_schulung/domain/entity/advice_entity.dart';
import 'package:flutter_schulung/presentation/page/advice/advice_page.dart';
import 'package:flutter_schulung/presentation/page/advice/cubit/advice_page_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAdvicePageCubit extends MockCubit<AdvicePageState> implements AdvicePageCubit {}

void main() {
  group('AdvicePage', () {
    late AdvicePageCubit mockCubit;

    Widget widgetUnderTest({required AdvicePageCubit pageCubit}) {
      return MaterialApp(
        home: BlocProvider<AdvicePageCubit>(
          create: (context) => pageCubit,
          child: const AdvicePage(),
        ),
      );
    }

    setUp(() {
      mockCubit = MockAdvicePageCubit();
    });

    group('should display view state', () {
      testWidgets('empty view', (WidgetTester tester) async {
        whenListen(
          mockCubit,
          Stream.fromIterable(
            <AdvicePageState>[],
          ),
          initialState: AdvicePageEmpty(),
        );

        await tester.pumpWidget(widgetUnderTest(pageCubit: mockCubit));

        final initText = find.text('Empty');

        expect(initText, findsOne);
      });

      testWidgets('loading view', (WidgetTester tester) async {
        whenListen(
          mockCubit,
          Stream.fromIterable(
            <AdvicePageState>[],
          ),
          initialState: AdvicePageLoading(),
        );

        await tester.pumpWidget(widgetUnderTest(pageCubit: mockCubit));

        final loadingSpinner = find.byType(CircularProgressIndicator);

        expect(loadingSpinner, findsOne);
      });

      testWidgets('loaded view', (WidgetTester tester) async {
        whenListen(
          mockCubit,
          Stream.fromIterable(
            <AdvicePageState>[],
          ),
          initialState: AdvicePageLoaded(entity: AdviceEntity(advice: 'Hallo Welt!')),
        );

        await tester.pumpWidget(widgetUnderTest(pageCubit: mockCubit));

        final loadedText = find.text('Hallo Welt!');

        expect(loadedText, findsOne);
      });

      testWidgets('error view', (WidgetTester tester) async {
        whenListen(
          mockCubit,
          Stream.fromIterable(
            <AdvicePageState>[],
          ),
          initialState: AdvicePageError(),
        );

        await tester.pumpWidget(widgetUnderTest(pageCubit: mockCubit));

        final errorText = find.text('FEHLER');

        expect(errorText, findsOne);
      });
    });

    group('should handle interaction', () {
      testWidgets('should call fetchAdvice once', (tester) async {
        when(() => mockCubit.fetchAdvice()).thenAnswer((_) async => Future.value());

        whenListen(
          mockCubit,
          Stream.fromIterable(
            <AdvicePageState>[],
          ),
          initialState: AdvicePageEmpty(),
        );

        await tester.pumpWidget(widgetUnderTest(pageCubit: mockCubit));

        await tester.pump();

        final buttonText = find.text('fetch');

        await tester.tap(buttonText);

        verify(() => mockCubit.fetchAdvice()).called(1);
      });
    });
  });
}
