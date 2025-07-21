import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/common/widgets/animated_widget.dart';
import 'package:portfolio/core/common/widgets/button.dart';
import 'package:portfolio/core/constants/dimensions.dart';
import 'package:portfolio/core/theme/color_pallete.dart';
import 'package:url_launcher/url_launcher.dart' show launchUrl;

class Work extends StatelessWidget {
  const Work({super.key, required this.scrollController});

  final ScrollController scrollController;

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
                  "Works.",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 10),
                Text(
                  "Check out the projects that I have done.",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  "Get to know me better.",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        foreground: Paint()
                          ..shader = const LinearGradient(
                            stops: [0, 1],
                            colors: [
                              Color.fromARGB(255, 47, 50, 240),
                              Color.fromARGB(255, 175, 150, 235),
                            ],
                          ).createShader(const Rect.fromLTWH(0, 0, 200, 70)),
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
          SliderAnimation(
            scrollController: scrollController,
            primaryImage: "asset/images/digicel/digicel_home.jpeg",
            secondaryImage: "asset/images/digicel/digicel_home.jpeg",
            workClass: WorkClass(
                desc: "",
                projectname: "MyDigicel Pacific",
                skills: ["Flutter", "Bloc", "Payment Gateway"],
                link:
                    "https://apps.apple.com/in/app/mydigicel-pacific/id6745426520"),
          ),
          SliderAnimation(
            scrollController: scrollController,
            primaryImage: "asset/images/ullas/ullas_home.jpg",
            secondaryImage: "asset/images/ullas/ullas_splash.jpg",
            workClass: WorkClass(
                desc: "",
                projectname: "Ullas",
                skills: ["Android", "MVVM", "Compose", "Room"],
                link:
                    "https://play.google.com/store/apps/details?id=com.np.nilp&pli=1"),
          ),
          SliderAnimation(
            scrollController: scrollController,
            primaryImage: "asset/images/anastomos/anastomos_home.png",
            secondaryImage: "asset/images/anastomos/anastomos_splash.png",
            workClass: WorkClass(
              desc: "",
              projectname: "Anastomos",
              skills: ["Flutter", "Bloc", "MVVP", "Chat API", "Web Socket"],
            ),
          ),
          SliderAnimation(
            scrollController: scrollController,
            primaryImage: "asset/images/asc/asc_hrms_home.jpg",
            secondaryImage: "asset/images/asc/asc_hrms_calender.jpg",
            workClass: WorkClass(
                desc: "",
                projectname: "ASCHRMS",
                skills: ["Flutter", "GetX", "Live Location"],
                link:
                    "https://play.google.com/store/apps/details?id=com.hrms.management.system&hl=en_IN"),
          ),
        ],
      ),
    );
  }
}

class SliderAnimation extends StatefulWidget {
  const SliderAnimation({
    super.key,
    required this.workClass,
    required this.scrollController,
    required this.primaryImage,
    required this.secondaryImage,
  });

  final WorkClass workClass;
  final ScrollController scrollController;
  final String primaryImage;
  final String secondaryImage;

  @override
  State<SliderAnimation> createState() => _SliderAnimationState();
}

class _SliderAnimationState extends State<SliderAnimation> {
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
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.isDesktop()
                  ? 100.0
                  : SizeConfig.isMobile()
                      ? 0
                      : 20),
          child: SizeConfig.isMobile()
              ? Row(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        // color: Colors.red,
                        height: height + 100,
                        width: SizeConfig.isDesktop() ? 40 : 20,
                        child: Stack(
                          children: [
                            Positioned(
                              left: SizeConfig.isDesktop() ? 20 : 10,
                              child: Container(
                                height: height + 100,
                                width: 2,
                                color: Theme.of(context).cardColor,
                              ),
                            ),
                            Positioned(
                              left: SizeConfig.isDesktop() ? 20 : 10,
                              child: TweenAnimationBuilder<double>(
                                duration: const Duration(milliseconds: 2000),
                                tween: Tween<double>(
                                  begin: 0,
                                  end: _isVisible ? height + 100 : 0,
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
                              top: SizeConfig.isDesktop() ? 40 : 20,
                              left: SizeConfig.isDesktop() ? 10 : null,
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AnimatedCustomWidget(
                              listDirection: ListDirection.bottomToTop,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    child: Text(
                                      widget.workClass.projectname,
                                      style: GoogleFonts.abrilFatface(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .displaySmall,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: SizeConfig.gap),
                                  Wrap(
                                    spacing: 10,
                                    runSpacing: 10,
                                    children: widget.workClass.skills
                                        .map(
                                          (e) => Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            color: const Color(0xFF082F49),
                                            child: Text(
                                              e,
                                              style: TextStyle(
                                                color: Color(0xFF7DD3FC),
                                                fontSize: SizeConfig.isMobile()
                                                    ? 14
                                                    : 18,
                                                fontWeight: FontWeight.w200,
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                  SizedBox(
                                    height: SizeConfig.gap,
                                  ),
                                  if (widget.workClass.link != null)
                                    Button(
                                      text: "SEE THIS PROJECT",
                                      onClick: () async {
                                        if (widget.workClass.link != null) {
                                          if (!await launchUrl(
                                            Uri.parse(widget.workClass.link!),
                                          )) {
                                            throw Exception(
                                                'Could not launch ${widget.workClass.link}');
                                          }
                                        }
                                      },
                                    )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            AnimatedCustomWidget(
                              child: Card(
                                elevation: 5,
                                clipBehavior: Clip.antiAlias,
                                shape: ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: SizedBox(
                                  height: SizeConfig.isDesktop() ? 600 : 350,
                                  width: SizeConfig.isDesktop() ? 350 : 200,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        right: SizeConfig.isDesktop() ? -40 : -30,
                                        // left: SizeConfig.isDesktop() ? -40 : 0,
                                        top: -10,
                                        child: Image.asset(
                                          widget.primaryImage,
                                          height:
                                              SizeConfig.isDesktop() ? 500 : 300,
                                          width:
                                              SizeConfig.isDesktop() ? 300 : 200,
                                          // fit: BoxFit.fill,
                                        ),
                                      ),
                                      Positioned(
                                        left: SizeConfig.isDesktop() ? 10 : 0,
                                        bottom:
                                            SizeConfig.isDesktop() ? -50 : -20,
                                        child: Image.asset(
                                          widget.secondaryImage,
                                          height:
                                              SizeConfig.isDesktop() ? 500 : 300,
                                          width:
                                              SizeConfig.isDesktop() ? 300 : 200,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              : Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Text info
                    Expanded(
                      flex: 2,
                      child: AnimatedCustomWidget(
                        listDirection: ListDirection.leftToRight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: Text(
                                widget.workClass.projectname,
                                style: GoogleFonts.abrilFatface(
                                  textStyle:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: widget.workClass.skills
                                  .map(
                                    (e) => Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      color: const Color(0xFF082F49),
                                      child: Text(
                                        e,
                                        style: const TextStyle(
                                          color: Color(0xFF7DD3FC),
                                          fontSize: 18,
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
                            if (widget.workClass.link != null)
                              Button(
                                text: "SEE THIS PROJECT",
                                onClick: () async {
                                  if (widget.workClass.link != null) {
                                    if (!await launchUrl(
                                      Uri.parse(widget.workClass.link!),
                                    )) {
                                      throw Exception(
                                          'Could not launch ${widget.workClass.link}');
                                    }
                                  }
                                },
                              )
                          ],
                        ),
                      ),
                    ),

                    // Animated Line
                    Expanded(
                      // flex: 2,
                      child: Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          // color: Colors.red,
                          height: SizeConfig.isDesktop() ? 800 : 500,
                          width: SizeConfig.isDesktop() ? 40 : 20,
                          child: Stack(
                            children: [
                              Positioned(
                                left: SizeConfig.isDesktop() ? 20 : 10,
                                child: Container(
                                  height: SizeConfig.isDesktop() ? 800 : 500,
                                  width: 2,
                                  color: Theme.of(context).cardColor,
                                ),
                              ),
                              Positioned(
                                left: SizeConfig.isDesktop() ? 20 : 10,
                                child: TweenAnimationBuilder<double>(
                                  duration: const Duration(milliseconds: 2000),
                                  tween: Tween<double>(
                                    begin: 0,
                                    end: _isVisible
                                        ? SizeConfig.isDesktop()
                                            ? 800
                                            : 500
                                        : 0,
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
                                top: SizeConfig.isDesktop() ? 40 : 20,
                                left: SizeConfig.isDesktop() ? 10 : null,
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
                    ),

                    // Image Card
                    Expanded(
                      flex: 2,
                      child: AnimatedCustomWidget(
                        listDirection: ListDirection.rightToLeft,
                        child: UnconstrainedBox(
                          child: Card(
                            elevation: 5,
                            clipBehavior: Clip.antiAlias,
                            shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: SizedBox(
                              height: SizeConfig.isDesktop() ? 600 : 350,
                              width: SizeConfig.isDesktop() ? 350 : 200,
                              child: Stack(
                                children: [
                                  Positioned(
                                    right: SizeConfig.isDesktop() ? -40 : -30,
                                    // left: SizeConfig.isDesktop() ? -40 : 0,
                                    top: -10,
                                    child: Image.asset(
                                      widget.primaryImage,
                                      height:
                                          SizeConfig.isDesktop() ? 500 : 300,
                                      width: SizeConfig.isDesktop() ? 300 : 200,
                                      // fit: BoxFit.fill,
                                    ),
                                  ),
                                  Positioned(
                                    left: SizeConfig.isDesktop() ? 10 : 0,
                                    bottom: SizeConfig.isDesktop() ? -50 : -20,
                                    child: Image.asset(
                                      widget.secondaryImage,
                                      height:
                                          SizeConfig.isDesktop() ? 500 : 300,
                                      width: SizeConfig.isDesktop() ? 300 : 200,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
        );
      },
    );
  }
}

class WorkClass {
  WorkClass(
      {required this.projectname,
      required this.desc,
      required this.skills,
      this.link});
  final String projectname;
  final String desc;
  final List<String> skills;
  final String? link;
}
