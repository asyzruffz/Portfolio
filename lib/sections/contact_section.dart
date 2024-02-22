import 'package:flutter/material.dart';
import 'package:portfolio/constants/palette.dart';
import 'package:portfolio/constants/ruler.dart';
import 'package:portfolio/widgets/content_layout.dart';
import 'package:portfolio/widgets/socials_list.dart';
import 'package:portfolio/widgets/topic_title.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Palette.primary,
      child: const ContentLayout(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: Ruler.doubleX),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 500,
                child: ContactCard(
                  title: 'Send a message',
                  child: MessageForm(),
                ),
              ),
              SizedBox(width: Ruler.fullX),
              SizedBox(
                width: 300,
                child: ContactCard(
                  title: 'Get in touch',
                  child: ContactInfo(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  final String title;
  final Widget child;

  const ContactCard({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Ruler.fullX),
      color: Palette.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TopicTitle(title, fontSize: 28),
          const SizedBox(height: Ruler.fullX),
          child,
        ],
      ),
    );
  }
}

class MessageForm extends StatelessWidget {
  const MessageForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const TextField(
          decoration: InputDecoration(
            labelText: 'Name',
            labelStyle: TextStyle(color: Palette.secondary),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Palette.secondary),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Palette.primary),
            ),
          ),
        ),
        const SizedBox(height: Ruler.halfX),
        const TextField(
          decoration: InputDecoration(
            labelText: 'Email',
            labelStyle: TextStyle(color: Palette.secondary),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Palette.secondary),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Palette.primary),
            ),
          ),
        ),
        const SizedBox(height: Ruler.halfX),
        const TextField(
          minLines: 3,
          maxLines: null,
          decoration: InputDecoration(
            labelText: 'Message',
            alignLabelWithHint: true,
            labelStyle: TextStyle(color: Palette.secondary),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Palette.secondary),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Palette.primary),
            ),
          ),
        ),
        const SizedBox(height: Ruler.halfX),
        FilledButton(
          style: FilledButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: Ruler.miniX),
            child: Text('Send Message', style: TextStyle(fontSize: 16)),
          ),
        ),
      ],
    );
  }
}

class ContactInfo extends StatelessWidget {
  const ContactInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ContactDetail(
          icon: Icons.phone_android_outlined,
          label: 'Phone :',
          detail: '+6013 464 2899',
        ),
        SizedBox(height: Ruler.halfX),
        ContactDetail(
          icon: Icons.home_outlined,
          label: 'Address :',
          detail: 'No. 59, Lorong Bukit 4\nTaman Bukit, Baling',
        ),
        SizedBox(height: Ruler.halfX),
        ContactDetail(
          icon: Icons.email_outlined,
          label: 'Email :',
          detail: 'm.asyraf.ibr@gmail.com',
        ),
        SizedBox(height: Ruler.fullX),
        SocialsList(),
      ],
    );
  }
}

class ContactDetail extends StatelessWidget {
  final IconData icon;
  final String label;
  final String detail;

  const ContactDetail({
    super.key,
    required this.icon,
    required this.label,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: Ruler.halfMiniX),
          child: Icon(icon, size: Ruler.iconNormal),
        ),
        const SizedBox(width: Ruler.halfX),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(fontSize: 16)),
            Text(detail, style: const TextStyle(color: Palette.secondary)),
          ],
        )
      ],
    );
  }
}