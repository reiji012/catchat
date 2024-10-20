import 'package:catchat/repositories/user_repository/user_repository.dart';
import 'package:catchat/state/user/user_state.dart';
import 'package:state_notifier/state_notifier.dart';

class UserStateNotifier extends StateNotifier<UserState> {
  UserStateNotifier() : super(UserState(userInfo: {}, userId: ''));

  late final UserRepository userRepostitory;

  void init() async {
    userRepostitory = UserRepository();
    // TODO ここでuserIdを取得する
    var userId = '2';
    final userInfo = await userRepostitory.getUserInfo(userId: userId);
    state = state.copyWith(userId: userId, userInfo: userInfo);
  }

  void fetchCat() async {}

  void updateUserInfo(Map<String, dynamic> userInfo) {
    userRepostitory.setUserInfo(userId: state.userId, userInfo: userInfo);
    state = state.copyWith(userInfo: userInfo);
  }
}
