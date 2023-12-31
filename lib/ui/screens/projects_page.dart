import 'package:go_router/go_router.dart';
import 'package:portfolio/bloc/database/database_cubit.dart';
import 'package:portfolio/bloc/database/database_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/bloc/images/images_state.dart';
import 'package:portfolio/ui/widgets/project_panel.dart';
import 'package:portfolio/bloc/panel/panel_cubit.dart';
import 'package:portfolio/bloc/panel/panel_state.dart';

import '../../bloc/images/images_cubit.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xE6002327),
        title: SizedBox(
          width: MediaQuery.of(context).size.width / 8,
          child: ElevatedButton(
            onPressed: () => context.go('/'),
            child: const Center(
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      body: BlocBuilder<DatabaseCubit, DatabaseState>(
        builder: (context, stateDb) {
          return BlocBuilder<PanelCubit, PanelState>(
            builder: (context, statePn) {
              return BlocBuilder<ImagesCubit, ImagesState>(
                  builder: (context, stateImg) {
                if (stateDb is DatabaseLoadedState &&
                    stateImg is ImagesLoadedState) {
                  return ListView.builder(
                      itemCount: stateDb.titles.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ProjectPanel(
                          title: stateDb.titles[index],
                          description: stateDb.descriptions[index],
                          color: stateDb.colors[index],
                          githubLink: stateDb.githubLinks[index],
                          isChosen:
                              statePn.chosenPanelId == index ? true : false,
                          id: index,
                        );
                      });
                } else if (stateDb is DatabaseLoadingState ||
                    stateImg is ImagesLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (stateDb is DatabaseLoadedState &&
                    stateImg is ImagesInitialState) {
                  BlocProvider.of<ImagesCubit>(context).cacheAllImages(context);
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  BlocProvider.of<DatabaseCubit>(context).getAllProjects();
                  return const SizedBox();
                }
              });
            },
          );
        },
      ),
    );
  }
}
