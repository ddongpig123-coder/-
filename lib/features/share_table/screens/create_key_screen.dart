import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/features/share_table/controllers/share_table_controller.dart';
import 'package:template/features/share_table/screens/share_key_screen.dart';

/// ShareTable 키 생성 화면
class CreateKeyScreen extends ConsumerWidget {
  /// [CreateKeyScreen] 생성자
  const CreateKeyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 60),
              // 타이틀
              const Text(
                'ShareTable',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF2C2C2E),
                  fontFamily: 'Noto Sans KR',
                ),
              ),
              const SizedBox(height: 16),
              // 설명 텍스트
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF636366),
                    fontFamily: 'Noto Sans KR',
                    height: 1.5,
                  ),
                  children: [
                    TextSpan(text: '본 '),
                    TextSpan(
                      text: '그룹 앱이 시작해요. 아래 버튼을 눌러 나만의 키를 만드세요',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(text: '.'),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              // 키 만들기 버튼
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    // 키 생성
                    ref.read(shareTableProvider.notifier).generateKey();

                    // ShareKeyScreen으로 이동
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ShareKeyScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5B8DEF),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    '나의 키 만들기',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Noto Sans KR',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // 안내 텍스트
              const Text(
                '키는 기기 로컬에 저장됩니다.',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF8E8E93),
                  fontFamily: 'Noto Sans KR',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
