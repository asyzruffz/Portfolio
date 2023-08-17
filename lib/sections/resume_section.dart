import 'package:flutter/material.dart';
import 'package:portfolio/constants/palette.dart';
import 'package:portfolio/constants/ruler.dart';
import 'package:portfolio/widgets/content_layout.dart';
import 'package:portfolio/widgets/responsive.dart';
import 'package:portfolio/widgets/section_title.dart';
import 'package:portfolio/widgets/topic_title.dart';

class ResumeSection extends StatelessWidget {
  const ResumeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: Ruler.doubleX),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ContentLayout(
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: SectionTitle(first: 'My ', second: 'Resume'),
            ),
          ),
          SizedBox(height: Ruler.fullX),
          ContentLayout(child: ResumeDetails()),
          SizedBox(height: Ruler.doubleX),
          ResumeSummary(),
        ],
      ),
    );
  }
}

class ResumeDetails extends StatelessWidget {
  final List<Widget> experienceCard = const [
    ResumeCardContent(
      timePeriod: '2017 - Present',
      title: 'UX Developer',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nostrum recusandae, cupiditate ullam dolor ratione repellendus.aliquid repudiandae saepe!',
    ),
    ResumeCardContent(
      timePeriod: '2016 - 2017',
      title: 'Front-end Developer',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nostrum recusandae, cupiditate ullam dolor ratione repellendus.aliquid repudiandae saepe!',
    ),
    ResumeCardContent(
      timePeriod: '2015 - 2016',
      title: 'UX Designer',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nostrum recusandae, cupiditate ullam dolor ratione repellendus.aliquid repudiandae saepe!',
    ),
  ];

  final List<Widget> educationCard = const [
    ResumeCardContent(
      timePeriod: '2017 - Present',
      title: 'B.E Computer Engineering',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nostrum recusandae, cupiditate ullam dolor ratione repellendus.aliquid repudiandae saepe!',
    ),
    ResumeCardContent(
      timePeriod: '2016 - 2017',
      title: 'Diploma in Computer Engineering',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nostrum recusandae, cupiditate ullam dolor ratione repellendus.aliquid repudiandae saepe!',
    ),
    ResumeCardContent(
      timePeriod: '2015 - 2016',
      title: 'High School Degree',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nostrum recusandae, cupiditate ullam dolor ratione repellendus.aliquid repudiandae saepe!',
    ),
  ];

  final List<Widget> skillCard = const [
    ResumeCardAttribute(label: 'HTML5 & CSS3', value: 0.9),
    ResumeCardAttribute(label: 'Javascript', value: 0.8),
    ResumeCardAttribute(label: 'PHP', value: 0.6),
  ];

  final List<Widget> languageCard = const [
    ResumeCardAttribute(label: 'Malay', value: 1),
    ResumeCardAttribute(label: 'English', value: 0.95),
  ];

  const ResumeDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ResumeCard(
              title: 'Experiences',
              divider: const Divider(color: Palette.secondary),
              children: experienceCard,
            ),
          ),
          const SizedBox(width: Ruler.fullX),
          Expanded(
            child: ResumeCard(
              title: 'Education',
              divider: const Divider(color: Palette.secondary),
              children: educationCard,
            ),
          ),
          const SizedBox(width: Ruler.fullX),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ResumeCard(
                  title: 'Skills',
                  children: skillCard,
                ),
                const SizedBox(height: Ruler.fullX),
                ResumeCard(
                  title: 'Languages',
                  children: languageCard,
                ),
              ],
            ),
          ),
        ],
      ),
      mobile: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ResumeCard(
            title: 'Experiences',
            divider: const Divider(color: Palette.secondary),
            children: experienceCard,
          ),
          const SizedBox(height: Ruler.fullX),
          ResumeCard(
            title: 'Education',
            divider: const Divider(color: Palette.secondary),
            children: educationCard,
          ),
          const SizedBox(height: Ruler.fullX),
          ResumeCard(
            title: 'Skills',
            children: skillCard,
          ),
          const SizedBox(height: Ruler.fullX),
          ResumeCard(
            title: 'Languages',
            children: languageCard,
          ),
        ],
      ),
    );
  }
}

class ResumeSummary extends StatelessWidget {
  const ResumeSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: Ruler.doubleX),
      height: 225,
      color: Palette.dark,
      child: const ContentLayout(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ResumeStats(
              icon: Icons.lock_clock,
              label: 'Hours Worked',
              amount: '500',
            ),
            ResumeStats(
              icon: Icons.layers,
              label: 'Project Finished',
              amount: '50K',
            ),
            ResumeStats(
              icon: Icons.face,
              label: 'Happy Clients',
              amount: '200K',
            ),
            ResumeStats(
              icon: Icons.coffee,
              label: 'Coffee Drinked',
              amount: '2k',
            ),
          ],
        ),
      ),
    );
  }
}

class ResumeCard extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final Widget? divider;

  const ResumeCard({
    super.key,
    required this.title,
    required this.children,
    this.divider,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Ruler.threeQuarterX),
      decoration: BoxDecoration(border: Border.all(color: Palette.secondary)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TopicTitle(title, fontSize: 28),
          const SizedBox(height: Ruler.halfX),
          ..._childrenWithDivider()
        ],
      ),
    );
  }

  List<Widget> _childrenWithDivider() {
    List<Widget> items = [];
    for (var i = 0; i < children.length; i++) {
      items.add(children[i]);
      if (divider != null && i < children.length - 1) {
        items.add(const SizedBox(height: Ruler.miniX));
        items.add(divider!);
        items.add(const SizedBox(height: Ruler.miniX));
      } else {
        items.add(const SizedBox(height: Ruler.miniX));
      }
    }
    return items;
  }
}

class ResumeCardContent extends StatelessWidget {
  final String timePeriod;
  final String title;
  final String description;

  const ResumeCardContent({
    super.key,
    required this.timePeriod,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          timePeriod,
          style: const TextStyle(
            height: 1,
            fontSize: 24,
            color: Palette.primary,
          ),
        ),
        const SizedBox(height: Ruler.miniX),
        Text(
          title,
          style: const TextStyle(color: Palette.secondary),
        ),
        const SizedBox(height: Ruler.miniX),
        Text(
          description,
          style: const TextStyle(color: Palette.secondary),
        ),
      ],
    );
  }
}

class ResumeCardAttribute extends StatelessWidget {
  final String label;
  final double value;

  const ResumeCardAttribute({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(color: Palette.secondary, fontSize: 14),
        ),
        const SizedBox(height: Ruler.halfMiniX),
        LinearProgressIndicator(
          value: value,
          semanticsLabel: label,
          backgroundColor: Palette.disabled,
        ),
      ],
    );
  }
}

class ResumeStats extends StatelessWidget {
  final IconData icon;
  final String amount;
  final String label;

  const ResumeStats({
    super.key,
    required this.icon,
    required this.amount,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: Ruler.iconBig, color: Palette.onPrimary),
        const SizedBox(width: Ruler.miniX),
        const VerticalDivider(color: Palette.onPrimary),
        const SizedBox(width: Ruler.miniX),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              amount,
              style: const TextStyle(
                fontSize: 48,
                height: 1,
                fontWeight: FontWeight.bold,
                color: Palette.primary,
              ),
            ),
            Text(
              label,
              style: const TextStyle(
                color: Palette.secondary,
              ),
            ),
          ],
        )
      ],
    );
  }
}
