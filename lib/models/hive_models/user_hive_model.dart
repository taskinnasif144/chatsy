import 'package:hive/hive.dart';

part 'user_hive_model.g.dart';

@HiveType(typeId: 1)
class UserHiveModel extends HiveObject {
  @HiveField(0)
  final String email;

  @HiveField(1)
  final String uid;

  UserHiveModel({
    required this.email,
    required this.uid
});
}