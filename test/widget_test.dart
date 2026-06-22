import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/main.dart';

void main() {
  testWidgets('portfolio groups projects by status', (tester) async {
    await tester.pumpWidget(const PortfolioApp());

    expect(find.text('망치든개발자고'), findsOneWidget);
    expect(find.text('진행중'), findsOneWidget);
    expect(find.text('완료'), findsOneWidget);
    expect(find.text('중단'), findsOneWidget);
    expect(find.text('매수각'), findsOneWidget);
    expect(find.text('레테'), findsOneWidget);
    expect(find.text('복지 챗봇'), findsOneWidget);
    expect(find.text('체스 - 킹슬레이어'), findsOneWidget);
  });
}
