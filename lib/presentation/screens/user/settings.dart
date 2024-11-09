part of '../screens.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Ink(
        width: 100.w,
        height: 100.h,
        decoration: kDecorBackground,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthSuccess) {
              final userInfo = state.user;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppBarSettings(),
                  SizedBox(height: 5.h),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: kColorCardLight,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 20,
                                    horizontal: 20,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        dateNowWelcome(),
                                        style: GoogleFonts.notoKufiArabic(
                                          textStyle: Get.textTheme.titleSmall
                                              ?.copyWith(
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      if (userInfo.userInfo!.expDate != null)
                                        Text(
                                          "Expiration: ${expirationDate(userInfo.userInfo!.expDate)}",
                                          style: GoogleFonts.notoKufiArabic(
                                            textStyle: Get.textTheme.titleSmall
                                                ?.copyWith(
                                              color: kColorHint,
                                              fontSize: 16.sp,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: kColorCardLight,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 20,
                                    horizontal: 20,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "اسم المستخدم : ${userInfo.userInfo!.username}",
                                        style: GoogleFonts.notoKufiArabic(
                                          textStyle: Get.textTheme.titleSmall
                                              ?.copyWith(
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        "كلمة المرور : ${userInfo.userInfo!.password}",
                                        style: GoogleFonts.notoKufiArabic(
                                          textStyle: Get.textTheme.titleSmall
                                              ?.copyWith(
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      if (userInfo.serverInfo != null)
                                        Text(
                                          "${userInfo.serverInfo!.serverUrl} : الخادم ",
                                          style: GoogleFonts.notoKufiArabic(
                                            textStyle: Get.textTheme.titleSmall
                                                ?.copyWith(
                                              fontSize: 16.sp,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 30.w,
                                child: CardButtonWatchMovie(
                                  isFocused: true,
                                  title: "قم بتحديث كافة البيانات",
                                  onTap: () {
                                    // Your onTap logic here
                                  },
                                ),
                              ),
                              SizedBox(height: 5.h),
                              SizedBox(
                                width: 30.w,
                                child: CardButtonWatchMovie(
                                  title: "إضافة مستخدم جديد",
                                  onTap: () {
                                    context.read<AuthBloc>().add(AuthLogOut());
                                    Get.offAllNamed("/");
                                  },
                                ),
                              ),
                              SizedBox(height: 5.h),
                              SizedBox(
                                width: 30.w,
                                child: CardButtonWatchMovie(
                                  title: "تسجيل الخروج",
                                  onTap: () {
                                    context.read<AuthBloc>().add(AuthLogOut());
                                    Get.offAllNamed("/");
                                    Get.reload();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          await launchUrlString(
                            "https://www.fiverr.com/osmben",
                            mode: LaunchMode.externalApplication,
                          );
                        },
                        child: Text(
                          ' @Ossama Ben Mazzi ',
                          style: GoogleFonts.notoKufiArabic(
                            textStyle: Get.textTheme.titleSmall?.copyWith(
                              fontSize: 12.sp,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'تم الإنشاء بواسطة  ',
                        style: GoogleFonts.notoKufiArabic(
                          textStyle: Get.textTheme.titleSmall?.copyWith(
                            fontSize: 12.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
