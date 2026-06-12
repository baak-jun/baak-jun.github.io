# Baak Jun Portfolio

GitHub Pages로 배포하는 박준혁(Baak Jun)의 개인 포트폴리오 웹사이트입니다. 블로그보다 프로젝트 허브에 가깝게 구성했으며, 대표 프로젝트와 기술 스택, 경험, 연락 링크를 한 화면에서 확인할 수 있습니다.

## 배포 주소

```text
https://baak-jun.github.io/
```

## 프로젝트 구조

```text
.
├── index.html
├── styles.css
├── script.js
├── assets/
│   ├── mesugak-dashboard.svg
│   ├── mesugak-buy-signal.png
│   ├── lethe-traum.png
│   ├── welfare-chatbot.svg
│   └── welfare-doctor.png
├── AGENTS.md
└── README.md
```

## 로컬 실행

정적 HTML/CSS/JavaScript 사이트라 별도 빌드 도구가 필요하지 않습니다.

```bash
python -m http.server 8000
```

브라우저에서 다음 주소를 엽니다.

```text
http://localhost:8000
```

## GitHub Pages 배포 방법

1. Repository Settings로 이동
2. Pages 메뉴 선택
3. Source: Deploy from a branch
4. Branch: main
5. Folder: /root
6. Save

## 포함 프로젝트

- Welfare Chatbot: AI LLM 기반 시니어 청각장애인 복지지원 챗봇 프로젝트
- MesuGak: 기술적 지표 기반 주식 매수 신호 분석 웹 서비스
- Lethe: Unity/C# 기반 특수 설정 미스터리 추리 어드벤처 게임
