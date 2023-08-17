import 'package:flutter/material.dart';
import 'package:portfolio/constants/palette.dart';
import 'package:portfolio/constants/ruler.dart';
import 'package:portfolio/widgets/responsive.dart';
import 'package:portfolio/widgets/socials_list.dart';
import 'package:portfolio/widgets/topic_title.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      desktop: Row(
        mainAxisAlignment: MainAxisAlignment.center,
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
    return SizedBox(
      height: 450,
      child: Container(
        padding: const EdgeInsets.all(Ruler.doubleX),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Palette.secondary),
            left: BorderSide(color: Palette.secondary, width: 0.5),
            right: BorderSide(color: Palette.secondary, width: 0.5),
          ),
        ),
        child: child,
      ),
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
        const TopicTitle('Who am I ?'),
        const SizedBox(height: Ruler.fullX),
        const Text(
          'A Web Designer / Developer Located In Our Lovely Earth',
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(height: Ruler.halfX),
        const Text(
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit.sit amet, Qui deserunt consequatur fugit repellendusillo voluptas?',
          style: TextStyle(fontSize: 14, color: Palette.secondary),
        ),
        const SizedBox(height: Ruler.fullX),
        OutlinedButton(
          onPressed: () {},
          style: ButtonStyle(
            side: MaterialStateProperty.all<BorderSide?>(
              const BorderSide(color: Palette.primary),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: Ruler.miniX),
            child: Text('Download My CV'),
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
        TopicTitle('Personal Info'),
        SizedBox(height: Ruler.fullX),
        PersonalInfo(label: 'Full Name ', data: 'Muhammad Asyraf bin Ibrahim'),
        SizedBox(height: Ruler.miniX),
        PersonalInfo(label: 'Birthdate ', data: '09/10/1992'),
        SizedBox(height: Ruler.miniX),
        PersonalInfo(label: 'Email ', data: 'm.asyraf.ibr@gmail.com'),
        SizedBox(height: Ruler.miniX),
        PersonalInfo(label: 'Phone ', data: '+6013 464 2899'),
        SizedBox(height: Ruler.miniX),
        PersonalInfo(
            label: 'Address ',
            data:
                'No. 59, Lorong Bukit 4, Taman Bukit,\n  09100 Baling, Kedah, Malaysia'),
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
        TopicTitle('My Expertise'),
        SizedBox(height: Ruler.fullX),
        ExpertiseItem(
          icon: Icons.ac_unit,
          label: 'Programming',
          description: 'exercitat Repellendus, corrupt.',
        ),
        ExpertiseItem(
          icon: Icons.ac_unit,
          label: 'System Design',
          description: 'Lorem ipsum dolor sit consectetur.',
        ),
        ExpertiseItem(
          icon: Icons.ac_unit,
          label: 'Programming',
          description: 'voluptate commodi illo voluptatib.',
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
      children: <Text>[
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        Text(
          ': $data',
          style: const TextStyle(fontSize: 14, color: Palette.secondary),
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              label,
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              description,
              style: const TextStyle(fontSize: 14, color: Palette.secondary),
            ),
            const SizedBox(
              width: 300,
              child: Divider(thickness: 0.5, color: Palette.secondary),
            ),
          ],
        )
      ],
    );
  }
}
