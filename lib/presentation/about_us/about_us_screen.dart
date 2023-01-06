import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  AboutUsPageState createState() => AboutUsPageState();
}

class AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'About Us',
          style: GoogleFonts.comfortaa(color: Colors.white, fontSize: 28),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Welcome to our About Us page!',
              style: GoogleFonts.comfortaa(color: Colors.black, fontSize: 20),
            ),
            SizedBox(
              child: Lottie.network(
                  'https://assets8.lottiefiles.com/packages/lf20_lstcbn9k.json'),
            ),
            const SizedBox(height: 16.0),
            Text(
                'At Beauty, we believe that beauty should be accessible to everyone. That\'s why we have developed a range of high-quality, affordable cosmetics that cater to a variety of skin tones, skin types, and makeup preferences. Our products are formulated with nourishing, natural ingredients and are never tested on animals. We are committed to providing our customers with exceptional products and service, and we strive to continuously improve and expand our offerings. Thank you for choosing Beauty and for supporting our mission to make beauty accessible for all.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.comfortaa()),
            const SizedBox(height: 30.0),
            Text(
              'Thank you for using our app!',
              style: GoogleFonts.comfortaa(color: Colors.black, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
