abstract class LigaStates{}

class StandingInitialState extends LigaStates{}
class StandingLoadingState extends LigaStates{}
class StandingSuccesState extends LigaStates{}
class StandingErrorState extends LigaStates{
  final String error;
  StandingErrorState(this.error);
}
class MatchesInitialState extends LigaStates{}
class MatchesLoadingState extends LigaStates{}
class MatchesSuccesState extends LigaStates{}
class MatchesErrorState extends LigaStates{
  final String error;
  MatchesErrorState(this.error);
}
class ExpandedState extends LigaStates{}
class CollapsedState extends LigaStates{}
class ExpectionLoadingState extends LigaStates{}
class ExpectionSuccessState extends LigaStates{}
class ExpectionErrorState extends LigaStates{}

class GetUserLoadingStates extends LigaStates{}
class GetUserSuccessStates extends LigaStates{}
class GetUserErrorStates extends LigaStates{}

class TestLoadingStates extends LigaStates{}
class TestSuccessStates extends LigaStates{}
class TestErrorStates extends LigaStates{}

class getTestLoadingStates extends LigaStates{}
class getTestSuccessStates extends LigaStates{}
class getTestErrorStates extends LigaStates{}

class UpdateErrorStates extends LigaStates{}
