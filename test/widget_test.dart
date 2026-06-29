import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/main.dart';

void main() {
  testWidgets('portfolio groups projects by status', (tester) async {
    await tester.pumpWidget(const PortfolioApp());

    expect(find.text('망치든 개발자'), findsOneWidget);
    expect(
      find.textContaining('세상을 조금 더 행복하게 만들 수 있는 소프트웨어와 서비스를 고민합니다'),
      findsOneWidget,
    );
    expect(find.text('가치관 01  후회하지 않는 것'), findsOneWidget);
    expect(find.text('가치관 02  옳다고 믿는 일을 행하는 것'), findsOneWidget);
    expect(find.text('대표 프로젝트'), findsOneWidget);
    expect(find.text('담당 파트'), findsWidgets);
    expect(find.text('진행중'), findsOneWidget);
    expect(find.text('완료'), findsOneWidget);
    expect(find.text('중단'), findsOneWidget);
    expect(find.text('매수각'), findsWidgets);
    expect(find.text('레테'), findsWidgets);
    expect(find.text('복지 챗봇'), findsOneWidget);
    expect(find.text('체스 - 킹슬레이어'), findsOneWidget);
    expect(find.text('이력'), findsOneWidget);
    expect(find.text('수상 경력'), findsWidgets);
    expect(find.text('자격증'), findsOneWidget);
    expect(find.text('봉사 경력'), findsOneWidget);
    expect(find.text('근로 경험'), findsOneWidget);
    expect(find.text('경험'), findsOneWidget);
  });
}
