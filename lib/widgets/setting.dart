import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class MySettings extends StatefulWidget {
  const MySettings({Key? key}) : super(key: key);
  @override
  State<MySettings> createState() => _MySettings();
}

class _MySettings extends State<MySettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cài đặt",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
            wordSpacing: 2,
            color: Colors.white,
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20)),
        ),
      ),
      body: Center(
        child: Container(
          child: SettingsList(
            sections: [
              SettingsSection(
                title: Text('Common'),
                tiles: <SettingsTile>[
                  SettingsTile.navigation(
                    leading: Icon(Icons.language),
                    title: Text('Language'),
                    value: Text('English'),
                  ),
                  SettingsTile.switchTile(
                    onToggle: (value) {},
                    initialValue: true,
                    leading: Icon(Icons.format_paint),
                    title: Text('Enable custom theme'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
