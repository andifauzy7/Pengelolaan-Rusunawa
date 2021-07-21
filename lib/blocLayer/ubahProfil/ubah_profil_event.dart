part of 'ubah_profil_bloc.dart';

@immutable
abstract class UbahProfilEvent {
  const UbahProfilEvent();
}

class UbahProfilEventGetProfil extends UbahProfilEvent {}

class UbahProfilEventSubmit extends UbahProfilEvent {
  Data pengguna;
  UbahProfilEventSubmit(this.pengguna);
}
