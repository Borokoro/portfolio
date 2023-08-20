import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/images/images_state.dart';

class ImagesCubit extends Cubit<ImagesState>{
  ImagesCubit() : super(ImagesInitialState());

  void cacheAllImages(BuildContext context) async{
    await precacheImage(const AssetImage('assets/images/Bowling.gif'), context);
    await precacheImage(const AssetImage('assets/images/Jumpy Jumper Jumps.gif'), context);
    await precacheImage(const AssetImage('assets/images/Password Wallet.gif'), context);
    await precacheImage(const AssetImage('assets/images/Portfolio.gif'), context);
    await precacheImage(const AssetImage('assets/images/Skladappka.gif'), context);
    await precacheImage(const AssetImage('assets/images/Table.gif'), context);
    emit(ImagesLoadedState());
  }
}