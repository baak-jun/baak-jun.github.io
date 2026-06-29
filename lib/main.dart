import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

// 프로젝트 상태를 바꾸려면 항목을 원하는 목록으로 옮기세요.
const activeProjects = <ProjectInfo>[
  ProjectInfo(
    title: '매수각',
    description: '시장 흐름과 매매 신호를 한눈에 살필 수 있도록 만드는 분석 대시보드입니다.',
    icon: Icons.query_stats_outlined,
    imagePath: 'assets/mesugak-buy-signal.png',
    link: 'https://mesu-gak.web.app/',
    role: '기획, 프론트엔드, 데이터 화면 설계',
    highlights: ['시장 흐름 요약', '매매 신호 시각화', '실사용 배포'],
  ),
  ProjectInfo(
    title: '갤러리/피노타입 분석 온디바이스 상담 인공지능 챗봇 서비스',
    description: '기기 안에서 분석과 상담 경험을 제공하는 인공지능 챗봇 서비스입니다.',
    icon: Icons.smart_toy_outlined,
    hideImage: true,
    link: 'https://github.com/CSID-DGU/2026-1-CECD1-4-TD-01',
    note: '2026학년도 1학기 S.M.A.R.T. 토너먼트 대상 (1등) 수상',
    role: '온디바이스 상담 흐름 설계, 챗봇 UX 구현',
    highlights: ['기기 내 분석', '상담형 대화 흐름', '팀 프로젝트 대상'],
  ),
];
const completedProjects = <ProjectInfo>[
  ProjectInfo(
    title: '레테',
    description: '이야기와 탐험 흐름을 중심으로 완성한 게임 프로젝트입니다.',
    icon: Icons.videogame_asset_outlined,
    imagePath: 'assets/lethe-traum.png',
    link:
        'https://drive.google.com/drive/u/0/folders/1bdyWPaJ5oGx4jNJe7f6Yv4CiiPn2ckvm',
    role: '게임 기획, 구현, 플레이 흐름 정리',
    highlights: ['스토리 기반 진행', '탐험 경험 설계', '완성 빌드 공유'],
  ),
  ProjectInfo(
    title: '복지 챗봇',
    description: '복지 제도 정보를 대화형으로 탐색할 수 있도록 만든 챗봇 프로젝트입니다.',
    icon: Icons.chat_bubble_outline,
    imagePath: 'assets/welfare-doctor.png',
    link: 'https://github.com/baak-jun/Welfare-Chatbot',
    role: '복지 정보 탐색 흐름 설계, 챗봇 구현',
    highlights: ['대화형 정보 탐색', '복지 제도 안내', 'GitHub 공개'],
  ),
];
const pausedProjects = <ProjectInfo>[
  ProjectInfo(
    title: '체스 - 킹슬레이어',
    description: '체스 규칙을 바탕으로 기획한 게임 프로젝트입니다.',
    icon: Icons.extension_outlined,
    link: 'https://baakjun.itch.io/king-slayer',
    role: '게임 규칙 기획, 프로토타입 제작',
    highlights: ['체스 기반 변형 규칙', '프로토타입 공개', '게임 디자인 실험'],
  ),
];

final featuredProjects = <ProjectInfo>[
  activeProjects[0],
  activeProjects[1],
  completedProjects[0],
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
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFB96A3B),
          surface: const Color(0xFFFFFCF6),
        ),
        textTheme: GoogleFonts.notoSansKrTextTheme().apply(
          bodyColor: ink,
          displayColor: ink,
        ),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderSection(),
                SizedBox(height: 56),
                PortfolioSnapshotSection(),
                SizedBox(height: 72),
                AboutSection(),
                SizedBox(height: 72),
                FeaturedProjectsSection(),
                SizedBox(height: 72),
                ProjectsSection(),
                SizedBox(height: 72),
                ResumeSection(),
                SizedBox(height: 72),
                ExperienceSection(),
                SizedBox(height: 56),
                FooterSection(),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

class PortfolioSnapshotSection extends StatelessWidget {
  const PortfolioSnapshotSection({super.key});

  @override
  Widget build(BuildContext context) => const Wrap(
    spacing: 14,
    runSpacing: 14,
    children: [
      SnapshotItem(value: '5', label: '프로젝트'),
      SnapshotItem(value: '1', label: '수상 경력'),
      SnapshotItem(value: 'Flutter', label: '주요 구현'),
      SnapshotItem(value: 'AI · Game', label: '관심 분야'),
    ],
  );
}

class SnapshotItem extends StatelessWidget {
  final String value;
  final String label;
  const SnapshotItem({super.key, required this.value, required this.label});

  @override
  Widget build(BuildContext context) => Container(
    width: 150,
    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
    decoration: BoxDecoration(
      color: Colors.white.withValues(alpha: 0.74),
      border: Border.all(
        color: const Color(0xFFB96A3B).withValues(alpha: 0.18),
      ),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            color: const Color(0xFF2D2926).withValues(alpha: 0.68),
          ),
        ),
      ],
    ),
  );
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        '안녕하세요',
        style: TextStyle(
          fontSize: 20,
          color: const Color(0xFF2D2926).withValues(alpha: 0.72),
        ),
      ),
      const SizedBox(height: 12),
      Row(
        children: [
          Image.asset(
            'assets/명함 아이콘.png',
            width: 58,
            height: 58,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 16),
          Flexible(
            child: Text(
              '망치든 개발자',
              style: GoogleFonts.notoSansKr(
                fontSize: 42,
                fontWeight: FontWeight.w800,
                height: 1.15,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 20),
      Container(width: 56, height: 4, color: const Color(0xFFB96A3B)),
      const SizedBox(height: 24),
      const Text(
        '세상을 조금 더 행복하게 만드는 소프트웨어와 서비스를 고민합니다.',
        style: TextStyle(fontSize: 17, height: 1.7),
      ),
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
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
      ),
    ],
  );
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
        '저는 세상을 조금 더 행복하게 만들 수 있는 소프트웨어와 서비스를 고민합니다. 거창한 변화보다도, 사람들이 익숙하게 지나치는 불편함을 발견하고 더 나은 선택지로 바꾸는 일에 관심이 많습니다.',
        style: TextStyle(fontSize: 16, height: 1.8),
      ),
      SizedBox(height: 16),
      Text(
        '문제의 본질을 먼저 파악하고, 변화의 신호를 빠르게 알아차리는 개발자가 되고 싶습니다. 작은 개선이라도 사용자의 시간과 비용을 줄일 수 있다면, 그것이 더 즐겁고 건강한 일상을 만드는 출발점이 될 수 있다고 믿습니다.',
        style: TextStyle(fontSize: 16, height: 1.8),
      ),
      SizedBox(height: 28),
      Text(
        '가치관 01  후회하지 않는 것',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: Color(0xFFB96A3B),
        ),
      ),
      SizedBox(height: 10),
      Text(
        '가치관 02  옳다고 믿는 일을 행하는 것',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: Color(0xFF347260),
        ),
      ),
    ],
  );
}

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});
  @override
  Widget build(BuildContext context) => const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SectionTitle(title: '프로젝트'),
      SizedBox(height: 32),
      ProjectStatusSection(
        title: '진행중',
        projects: activeProjects,
        accent: Color(0xFFB96A3B),
      ),
      SizedBox(height: 48),
      ProjectStatusSection(
        title: '완료',
        projects: completedProjects,
        accent: Color(0xFF347260),
      ),
      SizedBox(height: 72),
      ProjectStatusSection(
        title: '중단',
        projects: pausedProjects,
        accent: Color(0xFF857E76),
        subdued: true,
      ),
    ],
  );
}

class FeaturedProjectsSection extends StatelessWidget {
  const FeaturedProjectsSection({super.key});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SectionTitle(title: '대표 프로젝트'),
      const SizedBox(height: 28),
      FeaturedProjectGrid(projects: featuredProjects),
    ],
  );
}

class FeaturedProjectGrid extends StatelessWidget {
  final List<ProjectInfo> projects;
  const FeaturedProjectGrid({super.key, required this.projects});

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      final columns = constraints.maxWidth >= 840 ? 3 : 1;
      final width = (constraints.maxWidth - (columns - 1) * 20) / columns;
      return Wrap(
        spacing: 20,
        runSpacing: 20,
        children: [
          for (final project in projects)
            SizedBox(
              width: width,
              child: FeaturedProjectCard(project: project),
            ),
        ],
      );
    },
  );
}

class FeaturedProjectCard extends StatelessWidget {
  final ProjectInfo project;
  const FeaturedProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: Colors.white.withValues(alpha: 0.82),
      border: Border.all(
        color: const Color(0xFF2D2926).withValues(alpha: 0.10),
      ),
      borderRadius: BorderRadius.circular(8),
    ),
    clipBehavior: Clip.antiAlias,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProjectImage(
          project: project,
          accent: const Color(0xFFB96A3B),
          height: 170,
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                project.title,
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w800,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                project.description,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.6,
                  color: const Color(0xFF2D2926).withValues(alpha: 0.74),
                ),
              ),
              if (project.role != null) ...[
                const SizedBox(height: 14),
                ProjectRoleBlock(
                  role: project.role!,
                  accent: const Color(0xFFB96A3B),
                ),
              ],
              const SizedBox(height: 18),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final highlight in project.highlights.take(3))
                    ProjectTag(label: highlight),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class ProjectStatusSection extends StatelessWidget {
  final String title;
  final List<ProjectInfo> projects;
  final Color accent;
  final bool subdued;
  const ProjectStatusSection({
    super.key,
    required this.title,
    required this.projects,
    required this.accent,
    this.subdued = false,
  });
  @override
  Widget build(BuildContext context) {
    final section = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: subdued ? 18 : 22,
                fontWeight: FontWeight.w700,
                color: accent,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              '${projects.length}',
              style: TextStyle(
                fontSize: 14,
                color: accent.withValues(alpha: 0.78),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ProjectGrid(projects: projects, accent: accent, subdued: subdued),
      ],
    );
    return subdued ? Opacity(opacity: 0.68, child: section) : section;
  }
}

class ProjectGrid extends StatelessWidget {
  final List<ProjectInfo> projects;
  final Color accent;
  final bool subdued;
  const ProjectGrid({
    super.key,
    required this.projects,
    required this.accent,
    required this.subdued,
  });
  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      final columns = constraints.maxWidth >= 700 ? 2 : 1;
      final width = (constraints.maxWidth - (columns - 1) * 20) / columns;
      return Wrap(
        spacing: 20,
        runSpacing: 20,
        children: [
          for (final project in projects)
            SizedBox(
              width: width,
              height: 540,
              child: ProjectCard(
                project: project,
                accent: accent,
                subdued: subdued,
              ),
            ),
        ],
      );
    },
  );
}

class ProjectInfo {
  final String title;
  final String description;
  final IconData icon;
  final String? imagePath;
  final bool hideImage;
  final String? link;
  final String? note;
  final String? role;
  final List<String> highlights;

  const ProjectInfo({
    required this.title,
    required this.description,
    required this.icon,
    this.imagePath,
    this.hideImage = false,
    this.link,
    this.note,
    this.role,
    this.highlights = const [],
  });
}

class ProjectCard extends StatefulWidget {
  final ProjectInfo project;
  final Color accent;
  final bool subdued;
  const ProjectCard({
    super.key,
    required this.project,
    required this.accent,
    required this.subdued,
  });
  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool hovered = false;
  Future<void> openProject() async {
    final link = widget.project.link;
    if (link == null) {
      return;
    }
    final launched = await launchUrl(
      Uri.parse(link),
      mode: LaunchMode.externalApplication,
      webOnlyWindowName: '_blank',
    );
    if (!launched && mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('프로젝트 링크를 열 수 없습니다.')));
    }
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
          constraints: const BoxConstraints(minHeight: 360),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: widget.subdued ? 0.50 : 0.82),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: hovered
                  ? widget.accent
                  : widget.accent.withValues(alpha: 0.20),
              width: hovered ? 2 : 1,
            ),
            boxShadow: hovered
                ? [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ]
                : null,
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProjectImage(
                project: widget.project,
                accent: widget.accent,
                height: 164,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            widget.project.icon,
                            size: 26,
                            color: widget.accent,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              widget.project.title,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                height: 1.3,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        widget.project.description,
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.55,
                          color: const Color(
                            0xFF2D2926,
                          ).withValues(alpha: 0.76),
                        ),
                      ),
                      if (widget.project.role != null) ...[
                        const SizedBox(height: 14),
                        ProjectRoleBlock(
                          role: widget.project.role!,
                          accent: widget.accent,
                        ),
                      ],
                      if (widget.project.note != null) ...[
                        const SizedBox(height: 16),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.emoji_events_outlined,
                              size: 18,
                              color: widget.accent,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                widget.project.note!,
                                style: TextStyle(
                                  fontSize: 13,
                                  height: 1.45,
                                  fontWeight: FontWeight.w700,
                                  color: widget.accent,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                      const Spacer(),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          linked ? '프로젝트 열기' : '링크 준비 중',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: widget.accent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProjectRoleBlock extends StatelessWidget {
  final String role;
  final Color accent;
  const ProjectRoleBlock({super.key, required this.role, required this.accent});

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    decoration: BoxDecoration(
      color: accent.withValues(alpha: 0.07),
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: accent.withValues(alpha: 0.18)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '담당 파트',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w800,
            color: accent,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          role,
          style: TextStyle(
            fontSize: 13,
            height: 1.45,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF2D2926).withValues(alpha: 0.78),
          ),
        ),
      ],
    ),
  );
}

class ProjectImage extends StatelessWidget {
  final ProjectInfo project;
  final Color accent;
  final double height;
  const ProjectImage({
    super.key,
    required this.project,
    required this.accent,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final imagePath = project.imagePath;
    return Container(
      height: height,
      width: double.infinity,
      color: accent.withValues(alpha: 0.09),
      child: project.hideImage
          ? ProjectImageBlank(accent: accent)
          : imagePath == null
          ? ProjectImageFallback(project: project, accent: accent)
          : Image.asset(
              imagePath,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  ProjectImageFallback(project: project, accent: accent),
            ),
    );
  }
}

class ProjectImageBlank extends StatelessWidget {
  final Color accent;
  const ProjectImageBlank({super.key, required this.accent});

  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(
      color: accent.withValues(alpha: 0.06),
      border: Border(bottom: BorderSide(color: accent.withValues(alpha: 0.10))),
    ),
    child: const SizedBox.expand(),
  );
}

class ProjectImageFallback extends StatelessWidget {
  final ProjectInfo project;
  final Color accent;
  const ProjectImageFallback({
    super.key,
    required this.project,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) => Center(
    child: Container(
      width: 72,
      height: 72,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.76),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: accent.withValues(alpha: 0.20)),
      ),
      child: Icon(project.icon, size: 34, color: accent),
    ),
  );
}

class ProjectTag extends StatelessWidget {
  final String label;
  const ProjectTag({super.key, required this.label});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
    decoration: BoxDecoration(
      color: const Color(0xFF347260).withValues(alpha: 0.08),
      borderRadius: BorderRadius.circular(8),
      border: Border.all(
        color: const Color(0xFF347260).withValues(alpha: 0.16),
      ),
    ),
    child: Text(
      label,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: Color(0xFF347260),
      ),
    ),
  );
}

class ResumeSection extends StatelessWidget {
  const ResumeSection({super.key});

  @override
  Widget build(BuildContext context) => const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SectionTitle(title: '이력'),
      SizedBox(height: 26),
      ResumeGrid(),
    ],
  );
}

class ResumeGrid extends StatelessWidget {
  const ResumeGrid({super.key});

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      final wide = constraints.maxWidth >= 760;
      final itemWidth = wide
          ? (constraints.maxWidth - 18) / 2
          : constraints.maxWidth;
      const items = [
        ResumeItem(
          icon: Icons.emoji_events_outlined,
          category: '수상 경력',
          title: 'S.M.A.R.T. 토너먼트 대상',
          body: '2026학년도 1학기 온디바이스 상담 인공지능 챗봇 서비스로 대상 수상.',
        ),
        ResumeItem(
          icon: Icons.workspace_premium_outlined,
          category: '자격증',
          title: '정리 중',
          body: '보유 자격증명을 추가하면 이 영역에 표시됩니다.',
        ),
        ResumeItem(
          icon: Icons.volunteer_activism_outlined,
          category: '봉사 경력',
          title: '정리 중',
          body: '활동 기관, 기간, 맡은 역할을 중심으로 정리할 수 있습니다.',
        ),
        ResumeItem(
          icon: Icons.work_outline,
          category: '근로 경험',
          title: '정리 중',
          body: '근무처, 기간, 담당 업무와 배운 점을 함께 정리할 수 있습니다.',
        ),
      ];
      return Wrap(
        spacing: 18,
        runSpacing: 18,
        children: [
          for (final item in items) SizedBox(width: itemWidth, child: item),
        ],
      );
    },
  );
}

class ResumeItem extends StatelessWidget {
  final IconData icon;
  final String category;
  final String title;
  final String body;
  const ResumeItem({
    super.key,
    required this.icon,
    required this.category,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.white.withValues(alpha: 0.72),
      border: Border.all(
        color: const Color(0xFF2D2926).withValues(alpha: 0.10),
      ),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 24, color: const Color(0xFFB96A3B)),
            const SizedBox(width: 10),
            Text(
              category,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: Color(0xFFB96A3B),
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Text(
          title,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 8),
        Text(
          body,
          style: TextStyle(
            fontSize: 14,
            height: 1.6,
            color: const Color(0xFF2D2926).withValues(alpha: 0.72),
          ),
        ),
      ],
    ),
  );
}

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) => const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SectionTitle(title: '경험'),
      SizedBox(height: 26),
      ExperienceList(),
    ],
  );
}

class ExperienceList extends StatelessWidget {
  const ExperienceList({super.key});

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      final wide = constraints.maxWidth >= 760;
      final itemWidth = wide
          ? (constraints.maxWidth - 18) / 2
          : constraints.maxWidth;
      const items = [
        ExperienceItem(
          icon: Icons.emoji_events_outlined,
          title: 'S.M.A.R.T. 토너먼트 대상',
          body: '온디바이스 상담 인공지능 챗봇 서비스로 2026학년도 1학기 대상 수상.',
        ),
        ExperienceItem(
          icon: Icons.rocket_launch_outlined,
          title: '서비스 배포 경험',
          body: '매수각을 웹 서비스로 배포하며 데이터 화면과 사용 흐름을 직접 다듬음.',
        ),
        ExperienceItem(
          icon: Icons.sports_esports_outlined,
          title: '게임 프로젝트 완성',
          body: '레테와 킹슬레이어를 통해 기획, 구현, 빌드 공유까지 경험.',
        ),
        ExperienceItem(
          icon: Icons.psychology_alt_outlined,
          title: 'AI 대화형 서비스',
          body: '상담, 복지 정보 탐색처럼 사용자의 질문 흐름이 중요한 챗봇을 구현.',
        ),
      ];
      return Wrap(
        spacing: 18,
        runSpacing: 18,
        children: [
          for (final item in items) SizedBox(width: itemWidth, child: item),
        ],
      );
    },
  );
}

class ExperienceItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String body;
  const ExperienceItem({
    super.key,
    required this.icon,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.white.withValues(alpha: 0.70),
      border: Border.all(
        color: const Color(0xFF2D2926).withValues(alpha: 0.10),
      ),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 26, color: const Color(0xFFB96A3B)),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                body,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.6,
                  color: const Color(0xFF2D2926).withValues(alpha: 0.72),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});
  @override
  Widget build(BuildContext context) => Row(
    children: [
      Text(
        title,
        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
      ),
      const SizedBox(width: 16),
      Expanded(
        child: Container(
          height: 1,
          color: const Color(0xFFB96A3B).withValues(alpha: 0.30),
        ),
      ),
    ],
  );
}

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});
  @override
  Widget build(BuildContext context) => Center(
    child: Text(
      '© ${DateTime.now().year} 망치든 개발자. 플러터로 만들었습니다.',
      style: TextStyle(
        fontSize: 14,
        color: const Color(0xFF2D2926).withValues(alpha: 0.60),
      ),
    ),
  );
}
