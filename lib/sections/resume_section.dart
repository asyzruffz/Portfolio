import 'package:flutter/material.dart';
import 'package:portfolio/constants/content_data.dart';
import 'package:portfolio/constants/palette.dart';
import 'package:portfolio/constants/ruler.dart';
import 'package:portfolio/constants/tag.dart';
import 'package:portfolio/widgets/content_layout.dart';
import 'package:portfolio/widgets/padded_card.dart';
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
  const ResumeDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> skillCard = [];
    for (SkillCategory category in ContentData.resumeStats) {
      skillCard.add(ResumeAttributeCategory(name: category.name));
      for (SkillData skill in category.skills) {
        skillCard.add(ResumeCardAttribute(data: skill));
      }
    }

    return Responsive(
      desktop: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ResumeCard(
              title: Tag.labelExperiences,
              divider: const Divider(color: Palette.secondary),
              children: ContentData.experiences
                  .map<Widget>((data) => ResumeCardContent(data: data))
                  .toList(),
            ),
          ),
          const SizedBox(width: Ruler.fullX),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ResumeCard(
                  title: Tag.labelEducation,
                  divider: const Divider(color: Palette.secondary),
                  children: ContentData.educations
                      .map<Widget>((data) => ResumeCardContent(data: data))
                      .toList(),
                ),
                const SizedBox(height: Ruler.fullX),
                ResumeCard(
                  title: Tag.labelLanguages,
                  children: ContentData.resumeLanguages
                      .map<Widget>((lang) => ResumeCardAttribute(data: lang))
                      .toList(),
                ),
              ],
            ),
          ),
          const SizedBox(width: Ruler.fullX),
          Expanded(
            child: ResumeCard(
              title: Tag.labelSkills,
              children: skillCard,
            ),
          ),
        ],
      ),
      mobile: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ResumeCard(
            title: Tag.labelExperiences,
            divider: const Divider(color: Palette.secondary),
            children: ContentData.experiences
                .map<Widget>((data) => ResumeCardContent(data: data))
                .toList(),
          ),
          const SizedBox(height: Ruler.fullX),
          ResumeCard(
            title: Tag.labelEducation,
            divider: const Divider(color: Palette.secondary),
            children: ContentData.educations
                .map<Widget>((data) => ResumeCardContent(data: data))
                .toList(),
          ),
          const SizedBox(height: Ruler.fullX),
          ResumeCard(
            title: Tag.labelSkills,
            children: skillCard,
          ),
          const SizedBox(height: Ruler.fullX),
          ResumeCard(
            title: Tag.labelLanguages,
            children: ContentData.resumeLanguages
                .map<Widget>((lang) => ResumeCardAttribute(data: lang))
                .toList(),
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
              amount: '3k+',
            ),
            ResumeStats(
              icon: Icons.layers,
              label: 'Project Finished',
              amount: '20+',
            ),
            ResumeStats(
              icon: Icons.face,
              label: 'Happy Clients',
              amount: '100',
            ),
            ResumeStats(
              icon: Icons.coffee,
              label: 'Coffee Drinked',
              amount: '100+',
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
    return PaddedCard(
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
  final ResumeData data;

  const ResumeCardContent({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          data.time,
          style: const TextStyle(
            height: 1,
            fontSize: 24,
            color: Palette.primary,
          ),
        ),
        const SizedBox(height: Ruler.miniX),
        Text(
          data.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: Ruler.miniX),
        Text(
          data.description,
          style: const TextStyle(color: Palette.secondary),
        ),
      ],
    );
  }
}

class ResumeCardAttribute extends StatelessWidget {
  final SkillData data;

  const ResumeCardAttribute({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          data.label,
          style: const TextStyle(color: Palette.secondary, fontSize: 14),
        ),
        LinearProgressIndicator(
          value: data.value,
          semanticsLabel: data.label,
          backgroundColor: Palette.disabled,
        ),
      ],
    );
  }
}

class ResumeAttributeCategory extends StatelessWidget {
  final String name;

  const ResumeAttributeCategory({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Ruler.halfMiniX),
      child: Text(
        name,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
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
