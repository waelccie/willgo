import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'privacy_page.dart';
import 'terms_condition.dart';
import '../Widget/widget.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isPushNotificationEnabled = false;
  bool isLocationEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  // Profile Section
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, bottom: 8),
                      child: Text(
                        'PROFILE',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: const Color(0xff878787),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  buildListTileSettings(
                    'Push Notification',
                    Switch(
                      value: isPushNotificationEnabled,
                      onChanged: (value) {
                        setState(() {
                          isPushNotificationEnabled = value;
                          if (isPushNotificationEnabled) {
                            enableNotifications();
                          } else {
                            disableNotifications();
                          }
                        });
                      },
                      activeColor: Colors.white, // لون السويتش في حالة "تشغيل"
                      activeTrackColor:
                      Colors.blue[100], // لون المسار في حالة "تشغيل"
                      inactiveThumbColor:
                      Colors.white, // لون السويتش في حالة "إيقاف"
                      inactiveTrackColor: const Color(
                          0xffDFE0F3), // لون المسار في حالة "إيقاف"
                    ),
                  ),
                  buildListTileSettings(
                    'Location',
                    Switch(
                      value: isLocationEnabled,
                      onChanged: (value) {
                        setState(() {
                          isLocationEnabled = value;
                          if (isLocationEnabled) {
                            enableLocation();
                          } else {
                            disableLocation();
                          }
                        });
                      },
                      activeColor: Colors.white, // لون السويتش في حالة "تشغيل"
                      activeTrackColor: const Color(
                          0xff01A0E2), // لون المسار في حالة "تشغيل"
                      inactiveThumbColor:
                      Colors.grey, // لون السويتش في حالة "إيقاف"
                      inactiveTrackColor:
                      Colors.grey[300], // لون المسار في حالة "إيقاف"
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      show(context);
                    },
                    child: buildListTileSettings(
                      'Language',
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Support Section
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, bottom: 8),
                      child: Text(
                        'Support',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: const Color(0xff878787),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: buildListTileSettings(
                      'About Ticketis',
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PrivacyPage(),
                        ),
                      );
                    },
                    child: buildListTileSettings(
                      'Privacy Policy',
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ConditionPage(),
                        ),
                      );
                    },
                    child: buildListTileSettings(
                      'Terms and Conditions',
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void enableNotifications() {
    print('Push Notifications Enabled');
  }

  void disableNotifications() {
    print('Push Notifications Disabled');
  }


    Future<void> enableLocation() async {
      final permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }

      if (!await Geolocator.isLocationServiceEnabled()) {
        await Geolocator.openLocationSettings();
        return;
      }

      try {
        final position = await Geolocator.getCurrentPosition();
        print('Current location: ${position.latitude}, ${position.longitude}');
      } catch (e) {
        print('Error getting location: $e');
      }
    }

    Future<void> disableLocation() async {
      await Geolocator.openLocationSettings();
    } }