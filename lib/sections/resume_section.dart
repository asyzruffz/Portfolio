import 'package:flutter/material.dart';
import 'package:portfolio/constants/palette.dart';
import 'package:portfolio/constants/ruler.dart';
import 'package:portfolio/constants/tag.dart';
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
      timePeriod: Tag.resumeExpTime1,
      title: Tag.resumeExpRole1,
      description: Tag.resumeExpDesc1,
    ),
    ResumeCardContent(
      timePeriod: Tag.resumeExpTime2,
      title: Tag.resumeExpRole2,
      description: Tag.resumeExpDesc2,
    ),
    ResumeCardContent(
      timePeriod: Tag.resumeExpTime3,
      title: Tag.resumeExpRole3,
      description: Tag.resumeExpDesc3,
    ),
  ];

  final List<Widget> educationCard = const [
    ResumeCardContent(
      timePeriod: Tag.resumeEduTime1,
      title: Tag.resumeEduLevel1,
      description: Tag.resumeEduDesc1,
    ),
    ResumeCardContent(
      timePeriod: Tag.resumeEduTime2,
      title: Tag.resumeEduLevel2,
      description: Tag.resumeEduDesc2,
    ),
    ResumeCardContent(
      timePeriod: Tag.resumeEduTime3,
      title: Tag.resumeEduLevel3,
      description: Tag.resumeEduDesc3,
    ),
  ];

  final List<Widget> skillCard = const [
    ResumeCardAttribute(label: Tag.resumeSkill1, value: Tag.resumeSkillScore1),
    ResumeCardAttribute(label: Tag.resumeSkill2, value: Tag.resumeSkillScore2),
    ResumeCardAttribute(label: Tag.resumeSkill3, value: Tag.resumeSkillScore3),
  ];

  final List<Widget> languageCard = const [
    ResumeCardAttribute(
      label: Tag.resumeLanguage1,
      value: Tag.resumeLangScore1,
    ),
    ResumeCardAttribute(
      label: Tag.resumeLanguage2,
      value: Tag.resumeLangScore2,
    ),
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
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            //color: Palette.secondary,
          ),
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
