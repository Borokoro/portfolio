import 'package:flutter_bloc/flutter_bloc.dart';
import 'panel_state.dart';

class PanelCubit extends Cubit<PanelState>{
  PanelCubit() : super(PanelState(-1));

  void changeChosenPanel(int index) => emit(PanelState(index));
}