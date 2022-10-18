part of 'demo_bloc.dart';

@Freezed()
class DemoEvent with _$DemoEvent {
  const factory DemoEvent.loadImageFromDB() = DemoLoadImageFromDB;
  const factory DemoEvent.deleteImageFromDB(String message) =
      DemoDeleteImageFromDB;
}
