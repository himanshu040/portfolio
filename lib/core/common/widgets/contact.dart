import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio/core/common/widgets/animated_widget.dart';
import 'package:portfolio/core/common/widgets/button.dart';
import 'package:portfolio/core/constants/dimensions.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.isTablet() || SizeConfig.isMobile() ? 40 : 100,
        vertical: 60,
      ),
      child: Column(
        children: [
          AnimatedCustomWidget(
            child: Column(
              children: [
                Text(
                  "Get In Touch.",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 10),
                Text(
                  "Have a project in mind or want to discuss potential collaborations? Feel free to reach out through any of these channels.",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SizeConfig.isMobile()
              ? Column(
                  children: [
                    AnimatedCustomWidget(
                        listDirection: ListDirection.bottomToTop,
                        child: SocialLinks()),
                    AnimatedCustomWidget(
                        listDirection: ListDirection.bottomToTop,
                        child: StartConverStationBox())
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: AnimatedCustomWidget(
                            listDirection: ListDirection.leftToRight,
                            child: SocialLinks())),
                    Expanded(
                        child: AnimatedCustomWidget(
                            listDirection: ListDirection.rightToLeft,
                            child: StartConverStationBox()))
                  ],
                )
        ],
      ),
    );
  }
}

class Socil {
  Socil(
      {required this.content,
      required this.icon,
      required this.title,
      this.url});
  final String title;
  final String content;
  final String icon;
  final String? url;
}

class SocialBox extends StatefulWidget {
  const SocialBox({super.key, required this.s});

  final Socil s;

  @override
  State<SocialBox> createState() => _SocialBoxState();
}

class _SocialBoxState extends State<SocialBox> {
  late Socil e;
  bool _isHovered = false;

  @override
  void initState() {
    // TODO: implement initState
    e = widget.s;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: GestureDetector(
        onTap: () async {
          if (e.url != null) {
            if (!await launchUrl(
              Uri.parse(e.url!),
            )) {
              throw Exception('Could not launch ${e.url}');
            }
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black,
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: _isHovered ? 20 : 10,
                offset: _isHovered ? const Offset(10, 10) : const Offset(5, 5),
              )
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF082F49),
                ),
                child: SvgPicture.asset(
                  e.icon,
                  color: Color(0xff0284C7),
                  height: SizeConfig.isMobile() ? 20 : 40,
                  // width: 40,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      e.title,
                      style: TextStyle(
                          fontSize: SizeConfig.isMobile()
                              ? 16
                              : SizeConfig.isTablet()
                                  ? 18
                                  : 20,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      e.content,
                      style: TextStyle(
                        fontSize: SizeConfig.isMobile()
                            ? 8
                            : SizeConfig.isTablet()
                                ? 10
                                : 12,
                        fontWeight: FontWeight.w200,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class StartConverStationBox extends StatefulWidget {
  const StartConverStationBox({super.key});

  @override
  State<StartConverStationBox> createState() => _StartConverStationBoxState();
}

class _StartConverStationBoxState extends State<StartConverStationBox> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController subject = TextEditingController();
  final TextEditingController message = TextEditingController();

  bool _loading = false;

  Future<void> sendMessage() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _loading = true;
    });

    try {
      // final HttpsCallable callable =
      //     FirebaseFunctions.instance.httpsCallable('sendContactEmail');
      final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
      final responseToMe = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          //encoding your body
          "service_id":
              "service_mnjx68n", //collect this paramets form the emailjs website
          "user_id": "QaBno_XgFqhXVJp8d",
          "template_id": "template_4avv8hn",
          "template_params": {
            "name": name.text.trim(),
            "email": email.text.trim(),
            "message": message.text.trim(),
            "subject": subject.text.trim(),
          },
        }),
      );
      print(responseToMe.statusCode);
      if (responseToMe.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Message sent successfully!')),
        );
        name.clear();
        email.clear();
        subject.clear();
        message.clear();
      } else {
        print(responseToMe.statusCode);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to send message')),
        );
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to send message')),
      );
    }

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizeConfig.isMobile()
                  ? Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Your Name",
                              style: TextStyle(fontWeight: FontWeight.w200),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              controller: name,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Name required';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Your Email",
                              style: TextStyle(fontWeight: FontWeight.w200),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              controller: email,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Email required';
                                }
                                if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                  return 'Enter valid email';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Your Name",
                                style: TextStyle(fontWeight: FontWeight.w200),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: name,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Name required';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Your Email",
                                style: TextStyle(fontWeight: FontWeight.w200),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: email,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Email required';
                                  }
                                  if (!RegExp(r'\S+@\S+\.\S+')
                                      .hasMatch(value)) {
                                    return 'Enter valid email';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Subject",
                    style: TextStyle(fontWeight: FontWeight.w200),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: subject,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Subject required';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Message",
                    style: TextStyle(fontWeight: FontWeight.w200),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: message,
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Message required';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Button(
                text: _loading ? "Sending..." : "START CONVERSATION",
                onClick: _loading ? null : sendMessage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SocialLinks extends StatelessWidget {
  const SocialLinks({super.key});

  @override
  Widget build(BuildContext context) {
    List<Socil> social = [
      Socil(
          content: "singh.himanshu04051999@gmail.com",
          icon: "asset/images/logo/mail.svg",
          title: "Email",
          url: "mailto:singh.himanshu04051999@gmail.com"),
      Socil(
          content: "Himanshu Singh",
          icon: "asset/images/logo/linked_in.svg",
          title: "LinkedIn",
          url: "https://www.linkedin.com/in/himanshu-singh-b950551b3/"),
      Socil(
          content: "github.com/himanshu040",
          icon: "asset/images/logo/github.svg",
          title: "Github",
          url: "https://github.com/himanshu040"),
      Socil(
          content: "+91 9319904390",
          icon: "asset/images/logo/phone.svg",
          title: "Phone",
          url: "tel:+919319904390"),
      // Socil(content: "Himanshu Singh", icon: , title: "Email"),
    ];

    return Card(
      elevation: 0,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Wrap(
          runSpacing: 20,
          children: social.map((e) {
            return SocialBox(
              s: e,
            );
          }).toList(),
        ),
      ),
    );
  }
}
