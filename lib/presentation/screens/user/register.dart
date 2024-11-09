part of '../screens.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _fullUrl = TextEditingController();
  final _username = TextEditingController();
  final _password = TextEditingController();
  final _url = TextEditingController();

  // List of allowed servers
  final List<String> allowedServers = [
    "http://max84.a8slate.com:2052",
    "http://speed.manef2025.xyz:80",
    "http://speed4k.pro:80",
    "http://max.amigo00.com:2052",
    "http://larache.pro:80"
  ];

  // Validation function
  bool isValidServer(String url) {
    url = url.replaceAll(RegExp(r'/+$'), '');
    return allowedServers.contains(url);
  }

  // Function to handle URL parsing and extracting parameters
  _convertM3utoXtreme(TextStyle style) {
    showDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: const Text('ضع رابط M3U الخاص بك'),
        content: Material(
          color: Colors.transparent,
          child: TextField(
            controller: _fullUrl,
            decoration: InputDecoration(
              hintText:
                  "http://domain.tr:8080?get.php/username=test&password=123",
              hintStyle: Get.textTheme.bodyMedium!.copyWith(
                color: Colors.grey,
                fontFamily: GoogleFonts.notoKufiArabic().fontFamily,
              ),
            ),
            style: style,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              _fullUrl.clear();
              Get.back();
            },
            child: Text(
              'إلغاء',
              style: Get.textTheme.bodyMedium!.copyWith(
                color: Colors.grey.shade400,
                fontFamily: GoogleFonts.notoKufiArabic().fontFamily,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              var txt = _fullUrl.text;
              if (txt.isEmpty) {
                return;
              }

              if (Uri.tryParse(txt)?.hasAbsolutePath ?? false) {
                Uri url = Uri.parse(txt);
                var parameters = url.queryParameters;
                String serverUrl =
                    "${url.scheme}://${url.host}${url.hasPort ? ":${url.port}" : ""}";

                if (isValidServer(serverUrl)) {
                  _username.text = parameters['username'] ?? '';
                  _password.text = parameters['password'] ?? '';
                  _url.text = serverUrl;
                  Get.back();
                } else {
                  Get.back();
                  showWarningToast(
                    context,
                    'اشتراك غير صالح',
                    'اشتراكك ليس من HassonTV. يرجى الحصول على اشتراكك من hassontv.com',
                  );
                }
              } else {
                debugPrint("This text is not a valid URL!");
                Get.snackbar("Error", "The provided data is not correct.");
              }
            },
            child: Text(
              'حفظ',
              style: Get.textTheme.bodyMedium!.copyWith(
                color: kColorPrimary,
                fontFamily: GoogleFonts.notoKufiArabic().fontFamily,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _url.dispose();
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = Get.textTheme.bodyMedium!.copyWith(
      color: Colors.white,
      fontSize: 16.sp,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      body: Ink(
        width: getSize(context).width,
        height: getSize(context).height,
        decoration: kDecorBackground,
        child: BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, stateSetting) {
            return AzulEnvatoChecker(
              uniqueKey: stateSetting.setting,
              successPage: SafeArea(
                child: BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is AuthFailed) {
                      showWarningToast(
                        context,
                        'فشل تسجيل الدخول.',
                        'يرجى التحقق من بيانات اعتماد IPTV الخاصة بك والمحاولة مرة أخرى.',
                      );
                    } else if (state is AuthSuccess) {
                      context.read<LiveCatyBloc>().add(GetLiveCategories());
                      context.read<MovieCatyBloc>().add(GetMovieCategories());
                      context.read<SeriesCatyBloc>().add(GetSeriesCategories());
                      Get.offAndToNamed(screenWelcome);
                    }
                  },
                  builder: (context, state) {
                    final isLoading = state is AuthLoading;

                    return IgnorePointer(
                      ignoring: isLoading,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () => Get.back(),
                                icon: const Icon(
                                  FontAwesomeIcons.chevronLeft,
                                  color: Colors.white,
                                ),
                              ),
                              TextButton.icon(
                                icon: const Icon(
                                  FontAwesomeIcons.link,
                                  color: Colors.white,
                                  size: 18,
                                ),
                                onPressed: () {
                                  _convertM3utoXtreme(style);
                                },
                                label: Text(
                                  'إضافة M3U',
                                  style:
                                      Get.theme.textTheme.bodyMedium!.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily:
                                        GoogleFonts.notoKufiArabic().fontFamily,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 1.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        kIconSplash,
                                        width: .7.dp,
                                        height: .7.dp,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  Text(
                                    'قم بتسجيل الدخول لاكتشاف جميع الأفلام والبرامج التلفزيونية والبث التلفزيوني المباشر،\nوالتمتع بميزاتنا.',
                                    textAlign: TextAlign.center,
                                    style: Get.textTheme.bodyLarge!.copyWith(
                                      color: Colors.white,
                                      fontFamily: GoogleFonts.notoKufiArabic()
                                          .fontFamily,
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  TextField(
                                    controller: _username,
                                    decoration: InputDecoration(
                                      hintText: "اسم المستخدم",
                                      hintStyle:
                                          Get.textTheme.bodyMedium!.copyWith(
                                        color: Colors.grey,
                                        fontFamily: GoogleFonts.notoKufiArabic()
                                            .fontFamily,
                                      ),
                                      suffixIcon: const Icon(
                                        FontAwesomeIcons.solidUser,
                                        size: 18,
                                        color: kColorPrimary,
                                      ),
                                    ),
                                    style: style,
                                  ),
                                  const SizedBox(height: 15),
                                  TextField(
                                    controller: _password,
                                    decoration: InputDecoration(
                                      hintText: "كلمة المرور",
                                      hintStyle:
                                          Get.textTheme.bodyMedium!.copyWith(
                                        color: Colors.grey,
                                        fontFamily: GoogleFonts.notoKufiArabic()
                                            .fontFamily,
                                      ),
                                      suffixIcon: const Icon(
                                        FontAwesomeIcons.lock,
                                        size: 18,
                                        color: kColorPrimary,
                                      ),
                                    ),
                                    style: style,
                                  ),
                                  const SizedBox(height: 15),
                                  TextField(
                                    controller: _url,
                                    decoration: InputDecoration(
                                      hintText: "http://url.domain.net:8080",
                                      hintStyle:
                                          Get.textTheme.bodyMedium!.copyWith(
                                        color: Colors.grey,
                                      ),
                                      suffixIcon: const Icon(
                                        FontAwesomeIcons.link,
                                        size: 18,
                                        color: kColorPrimary,
                                      ),
                                    ),
                                    style: style,
                                  ),
                                  const SizedBox(height: 15),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.solidCircle,
                                          color: Colors.white70,
                                          size: 12.sp,
                                        ),
                                        const SizedBox(width: 8),
                                        InkWell(
                                          onTap: () async {
                                            var url = Uri.parse(kPrivacy);
                                            await launchUrl(url,
                                                mode: LaunchMode
                                                    .externalApplication);
                                          },
                                          child: Text(
                                            'سياسة الخصوصية ',
                                            style: Get.textTheme.bodyMedium!
                                                .copyWith(
                                              color: kColorPrimary
                                                  .withOpacity(.70),
                                              fontWeight: FontWeight.bold,
                                              fontFamily:
                                                  GoogleFonts.notoKufiArabic()
                                                      .fontFamily,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'من خلال التسجيل، فإنك توافق على ',
                                          style: Get.textTheme.bodyMedium!
                                              .copyWith(
                                            color: Colors.white70,
                                            fontFamily:
                                                GoogleFonts.notoKufiArabic()
                                                    .fontFamily,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: CardTallButton(
                              label: "إضافة مستخدم",
                              isLoading: isLoading,
                              onTap: () {
                                if (_username.text.isNotEmpty &&
                                    _password.text.isNotEmpty &&
                                    _url.text.isNotEmpty) {
                                  if (isValidServer(_url.text.trim())) {
                                    context.read<AuthBloc>().add(AuthRegister(
                                          _username.text,
                                          _password.text,
                                          _url.text,
                                        ));
                                  } else {
                                    showWarningToast(
                                      context,
                                      'اشتراك غير صالح',
                                      // Title: Invalid subscription
                                      'اشتراكك ليس من HassonTV. يرجى الحصول على اشتراكك من hassontv.com',
                                      // Message
                                    );
                                  }
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
