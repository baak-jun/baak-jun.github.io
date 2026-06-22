# 망치든개발자고 포트폴리오

GitHub Pages에 배포하는 Flutter Web 기반 개인 포트폴리오입니다.

## 로컬 실행

Flutter SDK가 설치된 환경에서 실행합니다.

```bash
flutter pub get
flutter run -d chrome
```

## 웹 빌드

GitHub Pages 루트 경로에 배포할 산출물을 만듭니다.

```bash
flutter build web --base-href /
```

빌드 결과물은 `build/web`에 생성됩니다.

## 프로젝트 상태 관리

프로젝트 목록은 [lib/main.dart](lib/main.dart)의 `activeProjects`, `completedProjects`, `pausedProjects`로 분리되어 있습니다. 새 프로젝트는 원하는 목록에 `ProjectInfo` 한 항목을 추가하고, 상태를 바꿀 때는 해당 항목을 다른 목록으로 옮기면 됩니다. 수상·출시·협업 같은 특이사항은 해당 항목에 `note:`를 추가하면 카드에 표시됩니다.

- 진행중: 매수각, 갤러리/피노타입 분석 온디바이스 상담 인공지능 챗봇 서비스
- 완료: 레테, 복지 챗봇
- 중단: 체스 - 킹슬레이어
