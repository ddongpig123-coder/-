import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

/// ShareTable 키 관리 컨트롤러
///
/// 키 생성 및 저장 기능을 제공합니다.
final shareTableProvider = NotifierProvider<ShareTableController, String?>(
  ShareTableController.new,
);

/// ShareTable 키를 관리하는 컨트롤러
class ShareTableController extends Notifier<String?> {
  @override
  String? build() {
    // 초기값: 키가 없는 상태
    return null;
  }

  /// 새로운 키를 생성합니다.
  ///
  /// 6자리 영문 대문자와 숫자 조합의 키를 생성합니다.
  void generateKey() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random();
    final key = List.generate(
      6,
      (index) => chars[random.nextInt(chars.length)],
    ).join();

    state = key;
  }

  /// 키를 초기화합니다.
  void clearKey() {
    state = null;
  }
}
