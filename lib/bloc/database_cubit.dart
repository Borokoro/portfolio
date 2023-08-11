import 'package:flutter_bloc/flutter_bloc.dart';
import 'database_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseCubit extends Cubit<DatabaseState>{
  DatabaseCubit() : super(DatabaseInitialState());

  final CollectionReference<Map<String, dynamic>> projectsCollection=
      FirebaseFirestore.instance.collection("projects");

  Future<void> getAllProjects() async{
    List<String> titles=[];
    List<String> descriptions=[];
    List<int> colors=[];
    List<String> githubLinks=[];
    final document=await projectsCollection.get();
    for (var element in document.docs) {
      titles.add(element.data()['title']);
      descriptions.add(element.data()['description']);
      colors.add(int.parse(element.data()['color']));
      githubLinks.add(element.data()['github']);
    }
    emit(DatabaseLoadedState(titles, descriptions, colors, githubLinks));
  }
}