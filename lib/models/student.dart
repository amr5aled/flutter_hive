import 'package:hive/hive.dart';
part 'student.g.dart';

@HiveType(typeId: 0)
class Students  extends HiveObject{
   @HiveField(0)
  final String? name;
   @HiveField(1)
  final int? grade;
  Students({this.name, this.grade});
}
