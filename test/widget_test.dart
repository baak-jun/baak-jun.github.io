import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/main.dart';

void main() {
  testWidgets('portfolio groups projects by status', (tester) async {
    await tester.pumpWidget(const PortfolioApp());

    expect(find.text('망치든 개발자'), findsOneWidget);
    expect(find.text('문제의 본질을 먼저 파악하는 일을 중요하게 생각합니다. 불편함에 익숙해진 나머지, 사실은 문제인 것을 문제로 인식하지 못한 채 불필요한 시간을 쓰고 있지는 않은지 끊임없이 살핍니다.'), findsOneWidget);
    expect(find.text('가치관 01  후회하지 않는 것'), findsOneWidget);
    expect(find.text('가치관 02  옳다고 믿는 일을 행하는 것'), findsOneWidget);
    expect(find.text('진행중'), findsOneWidget);
    expect(find.text('완료'), findsOneWidget);
    expect(find.text('중단'), findsOneWidget);
    expect(find.text('매수각'), findsOneWidget);
    expect(find.text('레테'), findsOneWidget);
    expect(find.text('복지 챗봇'), findsOneWidget);
    expect(find.text('체스 - 킹슬레이어'), findsOneWidget);
  });
}
