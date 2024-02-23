import 'package:flutter/material.dart';
import 'package:portfolio/constants/palette.dart';
import 'package:portfolio/constants/ruler.dart';
import 'package:portfolio/constants/tag.dart';
import 'package:portfolio/helper.dart';
import 'package:portfolio/widgets/responsive.dart';
import 'package:portfolio/widgets/socials_list.dart';
import 'package:portfolio/widgets/topic_title.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      desktop: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: AboutContainer(child: AboutDescription()),
            ),
            Expanded(
              child: AboutContainer(child: AboutInfo()),
            ),
            Expanded(
              child: AboutContainer(child: AboutExpertise()),
            ),
          ],
        ),
      ),
      mobile: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          AboutContainer(child: AboutDescription()),
          AboutContainer(child: AboutInfo()),
          AboutContainer(child: AboutExpertise()),
        ],
      ),
    );
  }
}

class AboutContainer extends StatelessWidget {
  final Widget child;

  const AboutContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Ruler.doubleX),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Palette.secondary),
          left: BorderSide(color: Palette.secondary, width: 0.5),
          right: BorderSide(color: Palette.secondary, width: 0.5),
        ),
      ),
      child: child,
    );
  }
}

class AboutDescription extends StatelessWidget {
  const AboutDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const TopicTitle(Tag.aboutWhoami),
        const SizedBox(height: Ruler.fullX),
        const Text(
          Tag.aboutRole,
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(height: Ruler.halfX),
        const Text(
          Tag.aboutIntroduction,
          style: TextStyle(fontSize: 14, color: Palette.secondary),
        ),
        const SizedBox(height: Ruler.fullX),
        OutlinedButton(
          onPressed: () => Helper.goUrl(Tag.cvFile),
          style: ButtonStyle(
            side: MaterialStateProperty.all<BorderSide?>(
              const BorderSide(color: Palette.primary),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: Ruler.miniX),
            child: Text(Tag.aboutDownloadCV),
          ),
        ),
      ],
    );
  }
}

class AboutInfo extends StatelessWidget {
  const AboutInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TopicTitle(Tag.aboutPersonalInfo),
        SizedBox(height: Ruler.fullX),
        PersonalInfo(label: Tag.labelFullname, data: Tag.fullname),
        SizedBox(height: Ruler.miniX),
        PersonalInfo(label: Tag.labelBirthdate, data: Tag.dateOfBirth),
        SizedBox(height: Ruler.miniX),
        PersonalInfo(label: Tag.labelEmail, data: Tag.email),
        SizedBox(height: Ruler.miniX),
        PersonalInfo(label: Tag.labelPhone, data: Tag.phoneNumber),
        SizedBox(height: Ruler.miniX),
        PersonalInfo(label: Tag.labelAddress, data: Tag.address),
        SizedBox(height: Ruler.fullX),
        SocialsList(color: Palette.primary),
      ],
    );
  }
}

class AboutExpertise extends StatelessWidget {
  const AboutExpertise({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TopicTitle(Tag.aboutMyExpertise),
        SizedBox(height: Ruler.fullX),
        ExpertiseItem(
          icon: Icons.code,
          label: Tag.aboutExpertise1,
          description: Tag.aboutExpertiseDesc1,
        ),
        ExpertiseItem(
          icon: Icons.conveyor_belt,
          label: Tag.aboutExpertise2,
          description: Tag.aboutExpertiseDesc2,
        ),
        ExpertiseItem(
          icon: Icons.bug_report,
          label: Tag.aboutExpertise3,
          description: Tag.aboutExpertiseDesc3,
        ),
      ],
    );
  }
}

class PersonalInfo extends StatelessWidget {
  final String label;
  final String data;

  const PersonalInfo({
    super.key,
    required this.label,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '$label ',
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: SelectableText(
            ': $data',
            style: const TextStyle(fontSize: 14, color: Palette.secondary),
          ),
        ),
      ],
    );
  }
}

class ExpertiseItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String description;

  const ExpertiseItem({
    super.key,
    required this.icon,
    required this.label,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Icon(icon, size: Ruler.iconNormal, color: Palette.primary),
        ),
        const SizedBox(width: Ruler.halfX),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                label,
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                description,
                style: const TextStyle(fontSize: 14, color: Palette.secondary),
              ),
              const Padding(
                padding: EdgeInsets.only(right: Ruler.doubleX),
                child: Divider(thickness: 0.5, color: Palette.secondary),
              ),
            ],
          ),
        )
      ],
    );
  }
}
