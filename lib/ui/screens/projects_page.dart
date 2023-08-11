import 'package:portfolio/bloc/database_cubit.dart';
import 'package:portfolio/bloc/database_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/ui/widgets/project_panel.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DatabaseCubit,DatabaseState>(
        builder: (context,state){
          if (state is DatabaseLoadedState){
            return ListView.builder(
              itemCount: state.titles.length,
                itemBuilder: (BuildContext context, int index){
                  return ProjectPanel(title: state.titles[index], description: state.descriptions[index],
                      color: state.colors[index], githubLink: state.githubLinks[index],);
                }
            );
          }
          else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
