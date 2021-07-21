part of 'ubah_profil_bloc.dart';

@immutable
abstract class UbahProfilState {
  const UbahProfilState();
}

class UbahProfilStateLoading extends UbahProfilState {}

class UbahProfilStateSuccess extends UbahProfilState {
  Data pengguna;
  UbahProfilStateSuccess(this.pengguna);
}

class UbahProfilStateFailed extends UbahProfilState {
  String message;
  UbahProfilStateFailed(this.message);
}


