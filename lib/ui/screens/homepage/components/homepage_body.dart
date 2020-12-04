import 'package:flutter/material.dart';
import 'package:mowgli/ui/components/list.dart';
import 'package:mowgli/ui/resources/translations.dart';
import 'package:mowgli/ui/screens/homepage/bloc/homepage_bloc.dart';
import 'package:mowgli/ui/screens/homepage/components/list/homepage_body_list.dart';
import 'package:mowgli/ui/screens/homepage/components/row/homepage_body_row.dart';
import 'package:mowgli/ui/screens/homepage/components/row/homepage_body_date_recommendations.dart';
import 'package:mowgli/ui/screens/homepage/model/homepage_data_content.dart';

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (BuildContext context, HomePageState state) {
        return state.when(
            (HomePageContent data) => _HomePageBodyList(
                sections: data.sections,
                dateRecommendations: data.dateRecommendations),
            loading: (_) => const _HomePageBodyLoading(),
            error: (_) => const _HomePageBodyError(),
            empty: (_) => const _HomePageBodyEmpty());
      },
    );
  }
}

class _HomePageBodyLoading extends StatelessWidget {
  const _HomePageBodyLoading();

  @override
  Widget build(BuildContext context) {
    return const LoadingList();
  }
}

class _HomePageBodyEmpty extends StatelessWidget {
  const _HomePageBodyEmpty();

  @override
  Widget build(BuildContext context) {
    return EmptyList(label: Translations.of(context).homePageEmpty);
  }
}

class _HomePageBodyError extends StatelessWidget {
  const _HomePageBodyError();

  @override
  Widget build(BuildContext context) {
    Translations translations = Translations.of(context);

    return ErrorList<HomePageBloc>(
      errorLabel: translations.homePageErrorMessage,
      retryLabel: translations.homePageErrorButton,
    );
  }
}

class _HomePageBodyList extends StatelessWidget {
  final Iterable<HomePageSection> sections;
  final Iterable<HomePageDateRecommendation> dateRecommendations;

  _HomePageBodyList(
      {@required this.sections, @required this.dateRecommendations});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: sections != null && dateRecommendations != null
            ? sections.length + 1
            : (sections?.length ?? 0),
        itemBuilder: (BuildContext context, int position) {
          if (position == 0) {
            return HomePageDateRecommendations(
                dateRecommendations: dateRecommendations);
          } else {
            HomePageSection section = sections.elementAt(position - 1);

            switch (section.type) {
              case HomePageSectionType.row:
                return HomePageSectionRow(section: section);
              case HomePageSectionType.list:
                return HomePageSectionList(section: section);
            }

            throw Exception('Unknown element $section');
          }
        });
  }
}
