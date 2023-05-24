part of 'demo_bloc.dart';

@Freezed()
class DemoEvent with _$DemoEvent {
  const factory DemoEvent.loadImageFromDB() = _LoadImageFromDB;

  const factory DemoEvent.deleteImageFromDB({
    required DogImage dogImage,
  }) = _DeleteImageFromDB;
}
