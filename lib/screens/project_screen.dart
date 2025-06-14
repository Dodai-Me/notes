import 'package:flutter/material.dart';
import 'package:provider_practice/constants.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: kPaddedText,
          child: ListView(
            children: [
              Text.rich(
                TextSpan(
                  text: '1. Weather App\n',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                  children: [
                    TextSpan(
                      text:
                          'This is my first official project. In it I was able to learn: \n\n'
                          '\t\t- About async/await functions and hava a good understanding of APIs as the app fetches real time data from OpenWeatherMap\'s API.'
                          '\n\n\t\t- Decoding JSONs from the APIs to get the needed data . It uses a city search feature to check the temperature of other areas.'
                          '\n\n\t\t- About accessing location permissions from user(s) by editing the AndroidManifest.xml file for android and the info.plist file for iOS.\n',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              Text('Github: ', style: TextStyle(fontSize: 20)),
              SelectableText(
                'https://github.com/Dodai-Me/weather-app',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 30),
              Text.rich(
                TextSpan(
                  text: '2. Notes App\n',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                  children: [
                    TextSpan(
                      text:
                          'This is well the notes app, I just decided to add a drawer to the app and amke use of it, hence this information. Anyways I learnt a lot from this app and they are as follows: \n\n'
                          '\t\t- The use of provider to manage state.'
                          '\n\n\t\t- The use of the consumer widget.'
                          '\n\n\t\t- Using Hive to store data locally.\n',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              Text('Github: ', style: TextStyle(fontSize: 20)),
              SelectableText(
                'https://github.com/Dodai-Me/notes',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
