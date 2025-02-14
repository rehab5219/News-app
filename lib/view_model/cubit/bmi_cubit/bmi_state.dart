sealed class BMIState{}

class InitialState extends BMIState {}

class ChangeGenderState extends BMIState {
  bool gender;
  ChangeGenderState({required this.gender});
}

class ChangeHeightState extends BMIState {}

class IncrementWeightState extends BMIState {
  int weight;
  IncrementWeightState({required this.weight});
}

class DecrementWeightState extends BMIState {
  int weight;
  DecrementWeightState({required this.weight});
}

class IncrementAgeState extends BMIState {
  int age;
  IncrementAgeState({required this.age});
}

class DecrementAgeState extends BMIState {
  int age;
  DecrementAgeState({required this.age});
}