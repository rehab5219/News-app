import 'package:bloc/bloc.dart';
import 'package:cubit_data/view_model/cubit/bmi_cubit/bmi_state.dart';
import 'package:cubit_data/view_model/service/local/shared_helper.dart';
import '../../service/local/shared_keys.dart';
import '../../utils/enums.dart';

class BMICubit extends Cubit<BMIState> {
BMICubit() : super(ChangeGenderState(
  gender: true,
));

// bool isMale = SharedHelper.prefs?.getBool(SharedKeys.male) ?? true;

void changeGender(Gender gender) async {
    if (gender == Gender.male) {
    //   isMale = (await SharedHelper.save(SharedKeys.male, isMale))!;
    //   isMale = (await SharedHelper.prefs?.setBool(SharedKeys.male, isMale))!;
    // }else{
    //   isMale = (await SharedHelper.save(SharedKeys.female, isMale))!;
    //   isMale = (await SharedHelper.prefs?.setBool(SharedKeys.female, isMale))!;
    }
    // emit(ChangeGenderState(
    //   gender: isMale,
    // ));
  }

  // double height = SharedHelper.prefs?.getDouble(SharedKeys.height) ?? 150;

 void changeHeight(double value) async {
   // await SharedHelper.save(SharedKeys.height, height);
   // await SharedHelper.prefs?.setDouble(SharedKeys.height, height);

   emit(ChangeHeightState());
 }

 // int weight = SharedHelper.prefs?.getInt(SharedKeys.weight) ?? 60;

 void incrementWeight() async {
   // await SharedHelper.save(SharedKeys.weight, ++weight);
   // await SharedHelper.prefs?.setInt(SharedKeys.weight, ++weight);

   // emit(IncrementWeightState(
   //   weight: weight,
   // ));
 }


 void decrementWeight() async {
   // await SharedHelper.save(SharedKeys.weight, --weight);
   // await SharedHelper.prefs?.setInt(SharedKeys.weight, --weight);

   // emit(DecrementWeightState(
   //   weight: weight,
   // ));
 }

 // int age = SharedHelper.prefs?.getInt(SharedKeys.age) ?? 26;

 void incrementAge() async {
   // await SharedHelper.save(SharedKeys.age, ++age);
   // await SharedHelper.prefs?.setInt(SharedKeys.age, ++age);

   // emit(IncrementAgeState(
   //   age: age,
   // ));
 }

void decrementAge() async {
  // await SharedHelper.save(SharedKeys.age, --age);
  // await SharedHelper.prefs?.setInt(SharedKeys.age, --age);

  // emit(DecrementAgeState(
    // age: age,
  // ));
 }
}