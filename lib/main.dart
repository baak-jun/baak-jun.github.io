import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

// 프로젝트 상태를 바꾸려면 항목을 원하는 목록으로 옮기세요.
const activeProjects = <ProjectInfo>[
  ProjectInfo(title: '매수각', description: '시장 흐름과 매매 신호를 한눈에 살필 수 있도록 만드는 분석 대시보드입니다.', icon: Icons.query_stats_outlined, link: 'https://mesu-gak.web.app/'),
  ProjectInfo(
    title: '갤러리/피노타입 분석 온디바이스 상담 인공지능 챗봇 서비스',
    description: '기기 안에서 분석과 상담 경험을 제공하는 인공지능 챗봇 서비스입니다.',
    icon: Icons.smart_toy_outlined,
    link: 'https://github.com/CSID-DGU/2026-1-CECD1-4-TD-01',
    note: '2026학년도 1학기 S.M.A.R.T. 토너먼트 대상 (1등) 수상',
  ),
];
const completedProjects = <ProjectInfo>[
  ProjectInfo(title: '레테', description: '이야기와 탐험 흐름을 중심으로 완성한 게임 프로젝트입니다.', icon: Icons.videogame_asset_outlined, link: 'https://drive.google.com/drive/u/0/folders/1bdyWPaJ5oGx4jNJe7f6Yv4CiiPn2ckvm'),
  ProjectInfo(title: '복지 챗봇', description: '복지 제도 정보를 대화형으로 탐색할 수 있도록 만든 챗봇 프로젝트입니다.', icon: Icons.chat_bubble_outline, link: 'https://github.com/baak-jun/Welfare-Chatbot'),
];
const pausedProjects = <ProjectInfo>[
  ProjectInfo(
    title: '체스 - 킹슬레이어',
    description: '체스 규칙을 바탕으로 기획한 게임 프로젝트입니다.',
    icon: Icons.extension_outlined,
    link: 'https://baakjun.itch.io/king-slayer',
  ),
];

void main() => runApp(const PortfolioApp());

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});
  @override
  Widget build(BuildContext context) {
    const ink = Color(0xFF2D2926);
    return MaterialApp(
      title: '망치든 개발자 포트폴리오',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFFCF6),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFB96A3B), surface: const Color(0xFFFFFCF6)),
        textTheme: GoogleFonts.notoSansKrTextTheme().apply(bodyColor: ink, displayColor: ink),
      ),
      home: const PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatelessWidget {
  const PortfolioHomePage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    body: SingleChildScrollView(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1080),
          child: const Padding(
            padding: EdgeInsets.fromLTRB(24, 56, 24, 32),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              HeaderSection(), SizedBox(height: 72), AboutSection(), SizedBox(height: 72),
              ProjectsSection(), SizedBox(height: 56), FooterSection(),
            ]),
          ),
        ),
      ),
    ),
  );
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});
  @override
  Widget build(BuildContext context) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Text('안녕하세요', style: TextStyle(fontSize: 20, color: const Color(0xFF2D2926).withValues(alpha: 0.72))),
    const SizedBox(height: 12),
    Row(children: [
      Image.asset('assets/명함 아이콘.png', width: 58, height: 58, fit: BoxFit.contain),
      const SizedBox(width: 16),
      Flexible(child: Text('망치든 개발자', style: GoogleFonts.notoSansKr(fontSize: 42, fontWeight: FontWeight.w800, height: 1.15))),
    ]),
    const SizedBox(height: 20),
    Container(width: 56, height: 4, color: const Color(0xFFB96A3B)),
    const SizedBox(height: 24),
    const Text('사람들의 일상에 즐거움을 더하는 소프트웨어를 만듭니다.', style: TextStyle(fontSize: 17, height: 1.7)),
    const SizedBox(height: 24),
    OutlinedButton.icon(
      onPressed: () => launchUrl(
        Uri.parse('https://github.com/baak-jun'),
        mode: LaunchMode.externalApplication,
        webOnlyWindowName: '_blank',
      ),
      icon: const Icon(Icons.account_tree_outlined),
      label: const Text('깃허브 바로가기'),
      style: OutlinedButton.styleFrom(
        foregroundColor: const Color(0xFF2D2926),
        side: const BorderSide(color: Color(0xFFB96A3B)),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
      ),
    ),
  ]);
}

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) => const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SectionTitle(title: '소개'),
      SizedBox(height: 22),
      Text(
        '저는 문제의 본질을 먼저 파악하는 일을 중요하게 생각합니다. 불편함에 익숙해진 나머지, 사실은 문제인 것을 문제로 인식하지 못한 채 불필요한 시간을 쓰고 있지는 않은지 끊임없이 살핍니다.',
        style: TextStyle(fontSize: 16, height: 1.8),
      ),
      SizedBox(height: 16),
      Text(
        '비가 멈춘 순간 가장 먼저 우산을 내리는 사람처럼, 변화의 신호를 빠르게 알아차리고 더 나은 선택을 행동으로 옮기고 싶습니다. 작은 비라면 우산을 드는 것보다 내리는 편이 더 효율적이며, 불필요한 비용과 시간을 줄이는 리스크 관리이기도 합니다. 그 선택이 다른 사람에게도 새로운 인식의 출발점이 될 수 있다고 믿습니다.',
        style: TextStyle(fontSize: 16, height: 1.8),
      ),
      SizedBox(height: 28),
      Text('가치관 01  후회하지 않는 것', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Color(0xFFB96A3B))),
      SizedBox(height: 10),
      Text('가치관 02  옳다고 믿는 일을 행하는 것', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Color(0xFF347260))),
    ],
  );
}

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});
  @override
  Widget build(BuildContext context) => const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    SectionTitle(title: '프로젝트'), SizedBox(height: 32),
    ProjectStatusSection(title: '진행중', projects: activeProjects, accent: Color(0xFFB96A3B)), SizedBox(height: 48),
    ProjectStatusSection(title: '완료', projects: completedProjects, accent: Color(0xFF347260)), SizedBox(height: 72),
    ProjectStatusSection(title: '중단', projects: pausedProjects, accent: Color(0xFF857E76), subdued: true),
  ]);
}

class ProjectStatusSection extends StatelessWidget {
  final String title;
  final List<ProjectInfo> projects;
  final Color accent;
  final bool subdued;
  const ProjectStatusSection({super.key, required this.title, required this.projects, required this.accent, this.subdued = false});
  @override
  Widget build(BuildContext context) {
    final section = Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        Text(title, style: TextStyle(fontSize: subdued ? 18 : 22, fontWeight: FontWeight.w700, color: accent)),
        const SizedBox(width: 10),
        Text('${projects.length}', style: TextStyle(fontSize: 14, color: accent.withValues(alpha: 0.78))),
      ]),
      const SizedBox(height: 16), ProjectGrid(projects: projects, accent: accent, subdued: subdued),
    ]);
    return subdued ? Opacity(opacity: 0.68, child: section) : section;
  }
}

class ProjectGrid extends StatelessWidget {
  final List<ProjectInfo> projects;
  final Color accent;
  final bool subdued;
  const ProjectGrid({super.key, required this.projects, required this.accent, required this.subdued});
  @override
  Widget build(BuildContext context) => LayoutBuilder(builder: (context, constraints) {
    final columns = constraints.maxWidth >= 700 ? 2 : 1;
    final width = (constraints.maxWidth - (columns - 1) * 20) / columns;
    return Wrap(spacing: 20, runSpacing: 20, children: [
      for (final project in projects) SizedBox(width: width, child: ProjectCard(project: project, accent: accent, subdued: subdued)),
    ]);
  });
}

class ProjectInfo {
  final String title;
  final String description;
  final IconData icon;
  final String? link;
  final String? note;

  const ProjectInfo({
    required this.title,
    required this.description,
    required this.icon,
    this.link,
    this.note,
  });
}

class ProjectCard extends StatefulWidget {
  final ProjectInfo project;
  final Color accent;
  final bool subdued;
  const ProjectCard({super.key, required this.project, required this.accent, required this.subdued});
  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool hovered = false;
  Future<void> openProject() async {
    final link = widget.project.link;
    if (link == null) return;
    final launched = await launchUrl(
      Uri.parse(link),
      mode: LaunchMode.externalApplication,
      webOnlyWindowName: '_blank',
    );
    if (!launched && mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('프로젝트 링크를 열 수 없습니다.')));
  }
  @override
  Widget build(BuildContext context) {
    final linked = widget.project.link != null;
    return MouseRegion(
      cursor: linked ? SystemMouseCursors.click : SystemMouseCursors.basic,
      onEnter: linked ? (_) => setState(() => hovered = true) : null,
      onExit: linked ? (_) => setState(() => hovered = false) : null,
      child: GestureDetector(
        onTap: linked ? openProject : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          constraints: const BoxConstraints(minHeight: 218), padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: widget.subdued ? 0.50 : 0.82), borderRadius: BorderRadius.circular(8),
            border: Border.all(color: hovered ? widget.accent : widget.accent.withValues(alpha: 0.20), width: hovered ? 2 : 1),
            boxShadow: hovered ? [BoxShadow(color: Colors.black.withValues(alpha: 0.08), blurRadius: 16, offset: const Offset(0, 6))] : null,
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Icon(widget.project.icon, size: 34, color: widget.accent), const SizedBox(height: 30),
            Text(widget.project.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)), const SizedBox(height: 10),
            Text(widget.project.description, style: TextStyle(fontSize: 14, height: 1.55, color: const Color(0xFF2D2926).withValues(alpha: 0.76))),
            if (widget.project.note != null) ...[
              const SizedBox(height: 16),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Icon(Icons.emoji_events_outlined, size: 18, color: widget.accent),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    widget.project.note!,
                    style: TextStyle(fontSize: 13, height: 1.45, fontWeight: FontWeight.w700, color: widget.accent),
                  ),
                ),
              ]),
            ],
            const Spacer(), Align(alignment: Alignment.centerRight, child: Text(linked ? '프로젝트 열기' : '링크 준비 중', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: widget.accent))),
          ]),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});
  @override
  Widget build(BuildContext context) => Row(children: [
    Text(title, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w800)), const SizedBox(width: 16),
    Expanded(child: Container(height: 1, color: const Color(0xFFB96A3B).withValues(alpha: 0.30))),
  ]);
}

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});
  @override
  Widget build(BuildContext context) => Center(child: Text('© ${DateTime.now().year} 망치든 개발자. 플러터로 만들었습니다.', style: TextStyle(fontSize: 14, color: const Color(0xFF2D2926).withValues(alpha: 0.60))));
}
