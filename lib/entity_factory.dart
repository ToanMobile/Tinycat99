

import 'data/post_voucher_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "PostVoucherEntity") {
      return PostVoucherEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}