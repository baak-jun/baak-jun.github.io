import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Baak-Jun Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFF9EE), // Brighter ivory/cream
        primaryColor: const Color(0xFFD4A373),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFD4A373),
          surface: const Color(0xFFFFF9EE),
        ),
        textTheme: GoogleFonts.outfitTextTheme(Theme.of(context).textTheme).apply(
          bodyColor: const Color(0xFF3E362E),
          displayColor: const Color(0xFF3E362E),
        ),
      ),
      home: const PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatelessWidget {
  const PortfolioHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 64.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderSection(),
                  SizedBox(height: 80),
                  AboutSection(),
                  SizedBox(height: 80),
                  ProjectsSection(),
                  SizedBox(height: 80),
                  FooterSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hello, I am',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w300,
            color: const Color(0xFF3E362E).withOpacity(0.7),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Baak Jun.',
          style: GoogleFonts.playfairDisplay(
            fontSize: 64,
            fontWeight: FontWeight.w700,
            letterSpacing: -1.5,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: 60,
          height: 4,
          color: const Color(0xFFD4A373),
        ),
        const SizedBox(height: 24),
        const Text(
          'A passionate developer crafting beautiful and functional digital experiences.\nWelcome to my creative space.',
          style: TextStyle(
            fontSize: 18,
            height: 1.6,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: 'About Me'),
        SizedBox(height: 24),
        Text(
          'I am a software engineer focused on building robust and scalable applications. '
          'I love to explore new technologies, refine my architectural skills, and create '
          'user interfaces that are both intuitive and visually pleasing. This portfolio '
          'was built with Flutter Web to showcase a highly interactive, extensible codebase.',
          style: TextStyle(
            fontSize: 16,
            height: 1.7,
          ),
        ),
      ],
    );
  }
}

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: 'Projects'),
        const SizedBox(height: 32),
        LayoutBuilder(
          builder: (context, constraints) {
            int crossAxisCount = constraints.maxWidth > 700 ? 2 : 1;
            return GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: 24,
              crossAxisSpacing: 24,
              childAspectRatio: 1.5,
              children: const [
                ProjectCard(
                  title: 'Lethe Traum',
                  description: 'A captivating game project with rich storytelling and immersive gameplay mechanics.',
                  icon: Icons.videogame_asset,
                  link: 'https://github.com/baak-jun',
                ),
                ProjectCard(
                  title: 'Mesugak Dashboard',
                  description: 'An analytical dashboard featuring complex data visualization and real-time insights.',
                  icon: Icons.dashboard,
                  link: 'https://github.com/baak-jun',
                ),
                ProjectCard(
                  title: 'Welfare Chatbot',
                  description: 'An AI-powered conversational agent assisting users with welfare programs and inquiries.',
                  icon: Icons.chat_bubble_outline,
                  link: 'https://github.com/baak-jun',
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;
  final String link;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.link,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  Future<void> _launchUrl() async {
    final Uri url = Uri.parse(widget.link);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch \$url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: _launchUrl,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.6),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: _isHovered ? const Color(0xFFD4A373) : Colors.transparent,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(_isHovered ? 0.08 : 0.03),
                blurRadius: _isHovered ? 20 : 10,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                widget.icon,
                size: 40,
                color: const Color(0xFFD4A373),
              ),
              const Spacer(),
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                widget.description,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: const Color(0xFF3E362E).withOpacity(0.8),
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: GoogleFonts.playfairDisplay(
            fontSize: 32,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            height: 1,
            color: const Color(0xFFD4A373).withOpacity(0.3),
          ),
        ),
      ],
    );
  }
}

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0),
        child: Text(
          '© \${DateTime.now().year} Baak Jun. Built with Flutter.',
          style: TextStyle(
            fontSize: 14,
            color: const Color(0xFF3E362E).withOpacity(0.6),
          ),
        ),
      ),
    );
  }
}
