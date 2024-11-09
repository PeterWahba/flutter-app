part of '../screens.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30.h),
              child: Image.asset('assets/images/logo.png', width: 40.w),
            ),
            SizedBox(height: 8.h),
            Text(
              'محتوى ترفيهي حصري',
              style: Get.textTheme.headlineLarge!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24.sp,
                fontFamily: GoogleFonts.notoKufiArabic().fontFamily,
              ),
            ),
            Text(
              'خصيصاً لك',
              style: Get.textTheme.headlineLarge!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24.sp,
                fontFamily: GoogleFonts.notoKufiArabic().fontFamily,
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 6.h,
                    child: ElevatedButton(
                      onPressed: () => Get.toNamed(screenRegister),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2196F3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: Text(
                        'تسجيل بيانات الاشتراك',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontFamily: GoogleFonts.notoKufiArabic().fontFamily,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  SizedBox(
                    width: double.infinity,
                    height: 6.h,
                    child: ElevatedButton(
                      onPressed: () async {
                        const whatsappUrl = 'https://wa.me/+966537445160';
                        if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
                          await launchUrl(Uri.parse(whatsappUrl));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2196F3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: Text(
                        'احصل على تجربة مجاناً',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontFamily: GoogleFonts.notoKufiArabic().fontFamily,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  SizedBox(
                    width: double.infinity,
                    height: 6.h,
                    child: ElevatedButton(
                      onPressed: () async {
                        const websiteUrl = 'https://hassontv.com';
                        if (await canLaunchUrl(Uri.parse(websiteUrl))) {
                          await launchUrl(Uri.parse(websiteUrl));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2196F3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: Text(
                        'اشتراك الان',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontFamily: GoogleFonts.notoKufiArabic().fontFamily,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 2.h),
          ],
        ),
      ),
    );
  }
}
