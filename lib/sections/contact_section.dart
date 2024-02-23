import 'package:flutter/material.dart';
import 'package:portfolio/constants/palette.dart';
import 'package:portfolio/constants/ruler.dart';
import 'package:portfolio/constants/tag.dart';
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
                  title: Tag.contactFormTitle,
                  child: MessageForm(),
                ),
              ),
              SizedBox(width: Ruler.fullX),
              SizedBox(
                width: 300,
                child: ContactCard(
                  title: Tag.contactInfoTitle,
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
            labelText: Tag.labelName,
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
            labelText: Tag.labelEmail,
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
            labelText: Tag.labelMessage,
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
          onPressed: () => _messageError(context),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: Ruler.miniX),
            child: Text(Tag.contactSendBtn, style: TextStyle(fontSize: 16)),
          ),
        ),
      ],
    );
  }

  void _messageError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Error! Message not sent.'),
      backgroundColor: Colors.red,
      duration: Durations.long1,
    ));
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
          label: Tag.labelPhone,
          detail: Tag.phoneNumber,
        ),
        SizedBox(height: Ruler.halfX),
        ContactDetail(
          icon: Icons.home_outlined,
          label: Tag.labelAddress,
          detail: Tag.address2,
        ),
        SizedBox(height: Ruler.halfX),
        ContactDetail(
          icon: Icons.email_outlined,
          label: Tag.labelEmail,
          detail: Tag.email,
        ),
        SizedBox(height: Ruler.fullX),
        SocialsList(color: Palette.primary),
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
          child: Icon(icon, size: Ruler.iconNormal, color: Palette.primary),
        ),
        const SizedBox(width: Ruler.halfX),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$label :', style: const TextStyle(fontSize: 16)),
            SelectableText(
              detail,
              style: const TextStyle(color: Palette.secondary),
            ),
          ],
        )
      ],
    );
  }
}
