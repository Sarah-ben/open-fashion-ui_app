class AppStates{}
class InitialState extends AppStates{}
class GetProductSuccessState extends AppStates{}
class GetProductErrorState extends AppStates{
  final onError;
  GetProductErrorState(this.onError);
}