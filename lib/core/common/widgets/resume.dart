import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/common/widgets/animated_widget.dart';
import 'package:portfolio/core/common/widgets/button.dart';
import 'package:portfolio/core/constants/dimensions.dart';
import 'package:url_launcher/url_launcher.dart';

class Resume extends StatelessWidget {
  const Resume({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    List<String> skills = [
      "Java",
      "Spring Boot",
      "Android Native",
      "Dart",
      "Flutter",
      "CI/CD",
      "Github Actions",
      "Codemagic",
      "Jenkins"
    ];
    List<String> aspire = [
      "Developed cross-platform mobile apps using Flutter & Dart, implementing MVVM, Singleton, andMixins for scalability.",
      "Integrated RESTful APIs, Firebase, and WebSockets, optimizing performance with caching, lazyloading, and Flutter DevTools.",
      "Maintained and optimized Spring MVC applications by debugging issues, refactoring code, andensuring system stability.",
      "Upgraded Spring Boot, Hibernate, and dependencies, addressing security vulnerabilities andimproving performance."
    ];
    List<String> netprophets = [
      "Developed and enhanced Flutter applications, implementing MVVP architecture, UI enhancements,and web view integration for a better user experience.",
      "Built and maintained key features such as Bill Payment, Recharge, Voucher Top-up, and Firebaseservices, collaborating with third-party partners like PAYU, PAYPAL, and chatbot for seamlessintegrations.",
      "Developed reusable UI utility libraries, optimized performance through in-app and persistentcaching, and implemented a reactive data approach.",
      "Created specialized platforms, including a Healthcare Professionals (HCPs) portal and jobapplication modules with real-time chat socket features.",
      "Designed and implemented CRUD APIs for seamless data management using Spring Boot,PostgreSQL, Docker, and Linux, supporting India's digital learning and PGI platforms."
    ];
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
                  "Resume.",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 10),
                Text(
                  "A snapshot of my professional journey, skills, and the impact I’ve created so far.",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 10),
                Button(
                  text: "DOWNLOAD RESUME",
                  onClick: () async {
                    if (!await launchUrl(
                      Uri.parse(
                          "https://drive.google.com/file/d/1M3qbYqKM4c9JdMLkhBeCimw_ukGkRRoT/view?usp=sharing"),
                    )) {
                      throw Exception(
                          'Could not launch ${"https://drive.google.com/file/d/1M3qbYqKM4c9JdMLkhBeCimw_ukGkRRoT/view?usp=sharing"}');
                    }
                  },
                ),
              ],
            ),
          ),
          // Text(
          //   "Experiences that shaped me.",
          //   style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          //         foreground: Paint()
          //           ..shader = const LinearGradient(
          //             stops: [0, 1],
          //             colors: [
          //               Color.fromARGB(255, 47, 50, 240),
          //               Color.fromARGB(255, 175, 150, 235),
          //             ],
          //           ).createShader(const Rect.fromLTWH(0, 0, 200, 70)),
          //       ),
          // ),
          const SizedBox(height: 50),
          SizeConfig.isMobile()
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedCustomWidget(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Summary",
                            style: GoogleFonts.abrilFatface(
                              textStyle:
                                  Theme.of(context).textTheme.displaySmall,
                            ),
                          ),
                          ResumeSection(
                              scrollController: scrollController,
                              title: "HIMANSHU SINGH",
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Innovative and deadline-driven Developer with 3+ years of industry experience.",
                                    style: TextStyle(
                                        fontSize: SizeConfig.isMobile()
                                            ? 12
                                            : SizeConfig.isTablet()
                                                ? 14
                                                : 16,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 5,
                                        width: 5,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Lucknow, India",
                                        style: TextStyle(
                                          fontSize: SizeConfig.isMobile()
                                              ? 14
                                              : SizeConfig.isTablet()
                                                  ? 16
                                                  : 18,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 5,
                                        width: 5,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Text(
                                          "singh.himanshu04051999@gmail.com",
                                          style: TextStyle(
                                            fontSize: SizeConfig.isMobile()
                                                ? 12
                                                : SizeConfig.isTablet()
                                                    ? 14
                                                    : 16,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              )),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Skills",
                            style: GoogleFonts.abrilFatface(
                              textStyle:
                                  Theme.of(context).textTheme.displaySmall,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: skills
                                .map(
                                  (e) => Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    color: const Color(0xFF082F49),
                                    child: Text(
                                      e,
                                      style: TextStyle(
                                        color: Color(0xFF7DD3FC),
                                        fontSize:
                                            SizeConfig.isMobile() ? 14 : 18,
                                        fontWeight: FontWeight.w200,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Education",
                            style: GoogleFonts.abrilFatface(
                              textStyle:
                                  Theme.of(context).textTheme.displaySmall,
                            ),
                          ),
                          ResumeSection(
                              scrollController: scrollController,
                              title:
                                  "BACHELOR OF TECHNOLOGY (INFORMATION TECHNOLOGY)",
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    color: const Color(0xFF082F49),
                                    child: Text(
                                      "2018-2022",
                                      style: TextStyle(
                                        color: Color(0xFF7DD3FC),
                                        fontSize:
                                            SizeConfig.isMobile() ? 14 : 18,
                                        fontWeight: FontWeight.w200,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Ajay Kumar Garg Engineering College",
                                    style: TextStyle(
                                        fontSize: SizeConfig.isMobile()
                                            ? 12
                                            : SizeConfig.isTablet()
                                                ? 14
                                                : 16,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "I am UG in B.Tech. from Ajay Kumar Garg Engineering College of Professional Studies (Associated with AKTU). I have scored 70% in B.Tech.",
                                    style: TextStyle(
                                      fontSize: SizeConfig.isMobile()
                                          ? 14
                                          : SizeConfig.isTablet()
                                              ? 16
                                              : 18,
                                    ),
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    AnimatedCustomWidget(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Professional Experience",
                            style: GoogleFonts.abrilFatface(
                              textStyle:
                                  Theme.of(context).textTheme.displaySmall,
                            ),
                          ),
                          ResumeSection(
                              scrollController: scrollController,
                              title: "FLUTTER DEVELOPER",
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    color: const Color(0xFF082F49),
                                    child: Text(
                                      "Feb'25 - Jun'25",
                                      style: TextStyle(
                                        color: Color(0xFF7DD3FC),
                                        fontSize:
                                            SizeConfig.isMobile() ? 14 : 18,
                                        fontWeight: FontWeight.w200,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Aspire Software Consultancy",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ListView.separated(
                                      physics: NeverScrollableScrollPhysics(),
                                      separatorBuilder: (context, index) {
                                        return SizedBox(
                                          height: 10,
                                        );
                                      },
                                      padding: EdgeInsets.all(0),
                                      itemCount: aspire.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(top: 10),
                                              height: 5,
                                              width: 5,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Text(
                                                aspire[index],
                                                style: TextStyle(
                                                  fontSize: SizeConfig
                                                          .isMobile()
                                                      ? 14
                                                      : SizeConfig.isTablet()
                                                          ? 16
                                                          : 18,
                                                ),
                                              ),
                                            )
                                          ],
                                        );
                                      })
                                ],
                              )),
                          ResumeSection(
                              scrollController: scrollController,
                              title: "SOFTWARE ENGINEER",
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    color: const Color(0xFF082F49),
                                    child: Text(
                                      "Jan'22 - Jan'25",
                                      style: TextStyle(
                                        color: Color(0xFF7DD3FC),
                                        fontSize:
                                            SizeConfig.isMobile() ? 14 : 18,
                                        fontWeight: FontWeight.w200,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Netprophets Cyberworks Pvt. Ltd.",
                                    style: TextStyle(
                                        fontSize: SizeConfig.isMobile()
                                            ? 12
                                            : SizeConfig.isTablet()
                                                ? 14
                                                : 16,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ListView.separated(
                                      physics: NeverScrollableScrollPhysics(),
                                      separatorBuilder: (context, index) {
                                        return SizedBox(
                                          height: 10,
                                        );
                                      },
                                      padding: EdgeInsets.all(0),
                                      itemCount: aspire.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(top: 10),
                                              height: 5,
                                              width: 5,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Text(
                                                netprophets[index],
                                                style: TextStyle(
                                                  fontSize: SizeConfig
                                                          .isMobile()
                                                      ? 14
                                                      : SizeConfig.isTablet()
                                                          ? 16
                                                          : 18,
                                                ),
                                              ),
                                            )
                                          ],
                                        );
                                      })
                                ],
                              )),
                        ],
                      ),
                    ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: AnimatedCustomWidget(
                        listDirection: ListDirection.leftToRight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Summary",
                              style: GoogleFonts.abrilFatface(
                                textStyle:
                                    Theme.of(context).textTheme.displaySmall,
                              ),
                            ),
                            ResumeSection(
                                scrollController: scrollController,
                                title: "HIMANSHU SINGH",
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Innovative and deadline-driven Developer with 3+ years of industry experience.",
                                      style: TextStyle(
                                          fontSize: SizeConfig.isMobile()
                                              ? 12
                                              : SizeConfig.isTablet()
                                                  ? 14
                                                  : 16,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: 5,
                                          width: 5,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Lucknow, India",
                                          style: TextStyle(
                                            fontSize: SizeConfig.isMobile()
                                                ? 14
                                                : SizeConfig.isTablet()
                                                    ? 16
                                                    : 18,
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: 5,
                                          width: 5,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "singh.himanshu04051999@gmail.com",
                                          style: TextStyle(
                                            fontSize: SizeConfig.isMobile()
                                                ? 14
                                                : SizeConfig.isTablet()
                                                    ? 16
                                                    : 18,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                )),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Skills",
                              style: GoogleFonts.abrilFatface(
                                textStyle:
                                    Theme.of(context).textTheme.displaySmall,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: skills
                                  .map(
                                    (e) => Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      color: const Color(0xFF082F49),
                                      child: Text(
                                        e,
                                        style: TextStyle(
                                          color: Color(0xFF7DD3FC),
                                          fontSize:
                                              SizeConfig.isMobile() ? 14 : 18,
                                          fontWeight: FontWeight.w200,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Education",
                              style: GoogleFonts.abrilFatface(
                                textStyle:
                                    Theme.of(context).textTheme.displaySmall,
                              ),
                            ),
                            ResumeSection(
                                scrollController: scrollController,
                                title:
                                    "BACHELOR OF TECHNOLOGY (INFORMATION TECHNOLOGY)",
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      color: const Color(0xFF082F49),
                                      child: Text(
                                        "2018-2022",
                                        style: TextStyle(
                                          color: Color(0xFF7DD3FC),
                                          fontSize:
                                              SizeConfig.isMobile() ? 14 : 18,
                                          fontWeight: FontWeight.w200,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Ajay Kumar Garg Engineering College",
                                      style: TextStyle(
                                          fontSize: SizeConfig.isMobile()
                                              ? 12
                                              : SizeConfig.isTablet()
                                                  ? 14
                                                  : 16,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "I am UG in B.Tech. from Ajay Kumar Garg Engineering College of Professional Studies (Associated with AKTU). I have scored 70% in B.Tech.",
                                      style: TextStyle(
                                        fontSize: SizeConfig.isMobile()
                                            ? 14
                                            : SizeConfig.isTablet()
                                                ? 16
                                                : 18,
                                      ),
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: AnimatedCustomWidget(
                        listDirection: ListDirection.rightToLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Professional Experience",
                              style: GoogleFonts.abrilFatface(
                                textStyle:
                                    Theme.of(context).textTheme.displaySmall,
                              ),
                            ),
                            ResumeSection(
                                scrollController: scrollController,
                                title: "FLUTTER DEVELOPER",
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      color: const Color(0xFF082F49),
                                      child: Text(
                                        "Feb'25 - Jun'25",
                                        style: TextStyle(
                                          color: Color(0xFF7DD3FC),
                                          fontSize:
                                              SizeConfig.isMobile() ? 14 : 18,
                                          fontWeight: FontWeight.w200,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Aspire Software Consultancy",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ListView.separated(
                                        physics: NeverScrollableScrollPhysics(),
                                        separatorBuilder: (context, index) {
                                          return SizedBox(
                                            height: 10,
                                          );
                                        },
                                        padding: EdgeInsets.all(0),
                                        itemCount: aspire.length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(top: 10),
                                                height: 5,
                                                width: 5,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  aspire[index],
                                                  style: TextStyle(
                                                    fontSize: SizeConfig
                                                            .isMobile()
                                                        ? 14
                                                        : SizeConfig.isTablet()
                                                            ? 16
                                                            : 18,
                                                  ),
                                                ),
                                              )
                                            ],
                                          );
                                        })
                                  ],
                                )),
                            ResumeSection(
                                scrollController: scrollController,
                                title: "SOFTWARE ENGINEER",
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      color: const Color(0xFF082F49),
                                      child: Text(
                                        "Jan'22 - Jan'25",
                                        style: TextStyle(
                                          color: Color(0xFF7DD3FC),
                                          fontSize:
                                              SizeConfig.isMobile() ? 14 : 18,
                                          fontWeight: FontWeight.w200,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Netprophets Cyberworks Pvt. Ltd.",
                                      style: TextStyle(
                                          fontSize: SizeConfig.isMobile()
                                              ? 12
                                              : SizeConfig.isTablet()
                                                  ? 14
                                                  : 16,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ListView.separated(
                                        physics: NeverScrollableScrollPhysics(),
                                        separatorBuilder: (context, index) {
                                          return SizedBox(
                                            height: 10,
                                          );
                                        },
                                        padding: EdgeInsets.all(0),
                                        itemCount: aspire.length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(top: 10),
                                                height: 5,
                                                width: 5,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  netprophets[index],
                                                  style: TextStyle(
                                                    fontSize: SizeConfig
                                                            .isMobile()
                                                        ? 14
                                                        : SizeConfig.isTablet()
                                                            ? 16
                                                            : 18,
                                                  ),
                                                ),
                                              )
                                            ],
                                          );
                                        })
                                  ],
                                )),
                          ],
                        ),
                      ),
                    )
                  ],
                )
        ],
      ),
    );
  }
}

class ResumeSection extends StatefulWidget {
  const ResumeSection({
    super.key,
    required this.scrollController,
    required this.title,
    required this.child,
  });

  final ScrollController scrollController;
  final String title;
  final Widget child;

  @override
  State<ResumeSection> createState() => _ResumeSectionState();
}

class _ResumeSectionState extends State<ResumeSection> {
  bool _isVisible = false;
  double height = 0;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_checkVisibility);
  }

  final GlobalKey _boxKey = GlobalKey();

  void _checkVisibility() {
    if (!mounted) return;

    RenderBox? box = context.findRenderObject() as RenderBox?;
    final RenderBox? mobileViewbox =
        _boxKey.currentContext?.findRenderObject() as RenderBox?;

    if (mobileViewbox != null && mobileViewbox.hasSize) {
      height = mobileViewbox.size.height;
    }

    if (box == null || !box.hasSize) return;

    final position = box.localToGlobal(Offset.zero);
    final screenHeight = MediaQuery.of(context).size.height;

    final visible =
        position.dy < screenHeight && position.dy + box.size.height > 0;

    if (visible && !_isVisible) {
      setState(() {
        _isVisible = true;
      });
    }
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_checkVisibility);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, __) {
        _checkVisibility();
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                // color: Colors.red,
                height: height,
                width: SizeConfig.isDesktop() ? 40 : 20,
                child: Stack(
                  children: [
                    Positioned(
                      left: 10,
                      child: Container(
                        height: height,
                        width: 2,
                        color: Theme.of(context).cardColor,
                      ),
                    ),
                    Positioned(
                      left: 10,
                      child: TweenAnimationBuilder<double>(
                        duration: const Duration(milliseconds: 2000),
                        tween: Tween<double>(
                          begin: 0,
                          end: _isVisible ? height : 0,
                        ),
                        builder: (context, value, child) {
                          return Container(
                            height: value,
                            width: 2,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Color.fromARGB(255, 47, 50, 240),
                                  Color.fromARGB(255, 175, 150, 235),
                                  Colors.transparent,
                                ],
                                stops: [0.0, 0.1, 0.9, 1.0],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      top: 20,
                      // left: SizeConfig.isDesktop() ? 10 : null,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: Color(0xFF6366F1),
                        child: CircleAvatar(
                          radius: 9,
                          backgroundColor: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: SizedBox(
                  key: _boxKey,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(
                              fontSize: SizeConfig.isMobile()
                                  ? 16
                                  : SizeConfig.isTablet()
                                      ? 18
                                      : 22,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        widget.child
                      ],
                    ),
                  )),
            ),
          ],
        );
      },
    );
  }
}
