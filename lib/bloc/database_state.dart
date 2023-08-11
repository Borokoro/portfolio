
abstract class DatabaseState{
  const DatabaseState();
}

class DatabaseInitialState extends DatabaseState{
  DatabaseInitialState();
}

class DatabaseLoadingState extends DatabaseState{
  DatabaseLoadingState();
}

class DatabaseLoadedState extends DatabaseState{
  DatabaseLoadedState(
      this.titles,
      this.descriptions,
      this.colors,
      this.githubLinks,
      );
  final List<String> titles;
  final List<String> descriptions;
  final List<int> colors;
  final List<String> githubLinks;
}