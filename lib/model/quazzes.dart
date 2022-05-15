
import 'package:arcore_flutter_plugin_example/common/constant/list_of_animals.dart';

///[Quizzes] contains 5 questions
///**************************************************************************///
/// What is the name of this animal?
/// What is the name of the female animal?
/// What is the name of the baby of this animal?
/// What does this animal feed on?
/// What sound does this animal make?
abstract class Quizzes {
  /// I will take id of animal to detect what animal I selected.
  static bool isThisNameOfAnimal({int id,String name}){
    return animalsItems[id].name==name;
  }
}
