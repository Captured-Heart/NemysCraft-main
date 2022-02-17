import 'package:bloc/bloc.dart';

part 'firebaseurl_state.dart';

class FirebaseurlCubit extends Cubit<FirebaseUrlState> {
  FirebaseurlCubit() : super(FirebaseUrlState(collectionUrl: ''));

  void getUrl() => emit(FirebaseUrlState(collectionUrl: 'collectionUrl'));
}
