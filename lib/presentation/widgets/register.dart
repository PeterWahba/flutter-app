part of 'widgets.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _urlController = TextEditingController();
  final TextStyle style =
      TextStyle(fontSize: 16); // Customize the text style as needed

  // List of allowed server URLs
  final List<String> allowedUrls = [
    'http://max84.a8slate.com:2052',
    'http://speed.manef2025.xyz:80',
    'http://speed4k.pro:80',
    'http://larache.pro:80',
    'http://max.amigo00.com:2052',
  ];

  // Validate the URL input
  bool validateUrl(String url) {
    return allowedUrls.contains(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Registration")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _urlController,
              decoration: InputDecoration(
                hintText: "http://url.domain.net:8080",
                hintStyle: Get.textTheme.bodyMedium!.copyWith(
                  color: Colors.grey,
                ),
                suffixIcon: const Icon(
                  FontAwesomeIcons.link,
                  size: 18,
                  color: Colors.blue, // Update with your color
                ),
                errorText: validateUrl(_urlController.text)
                    ? null
                    : "Invalid URL, please enter a valid server.",
              ),
              style: style,
              onChanged: (value) {
                setState(() {});
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String input = _urlController.text;
                if (validateUrl(input)) {
                  // Proceed with the valid URL
                  print('Valid URL: $input');
                  // You can also navigate to another screen here if necessary
                } else {
                  // Show an error message or handle accordingly
                  print('Invalid URL');
                }
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
