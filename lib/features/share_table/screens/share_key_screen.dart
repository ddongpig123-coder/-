import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/features/share_table/controllers/share_table_controller.dart';

/// ShareTable 키 공유 화면
class ShareKeyScreen extends ConsumerWidget {
  /// [ShareKeyScreen] 생성자
  const ShareKeyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 생성된 키 가져오기
    final generatedKey = ref.watch(shareTableProvider) ?? 'ERROR';

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
              // 성공 메시지
              const Text(
                '나만의 키가 생성되었어요!',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF636366),
                  fontFamily: 'Noto Sans KR',
                ),
              ),
              const SizedBox(height: 40),
              // 키 표시 영역
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F2F7),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 생성된 키
                    Text(
                      generatedKey,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF5B8DEF),
                        fontFamily: 'Noto Sans KR',
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(width: 16),
                    // 복사 버튼
                    GestureDetector(
                      onTap: () {
                        Clipboard.setData(
                          ClipboardData(text: generatedKey),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('키가 복사되었습니다'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.copy,
                          size: 20,
                          color: Color(0xFF636366),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // 클립보드 안내
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Noto Sans KR',
                  ),
                  children: [
                    TextSpan(
                      text: '클립보드에 ',
                      style: TextStyle(color: Color(0xFF8E8E93)),
                    ),
                    TextSpan(
                      text: '복사되었어요',
                      style: TextStyle(
                        color: Color(0xFF34C759),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: '!',
                      style: TextStyle(color: Color(0xFF8E8E93)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              // 시간표 보러가기 버튼
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    // 시간표 화면으로 이동
                    Navigator.pop(context);
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
                    '시간표 보러가기',
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
