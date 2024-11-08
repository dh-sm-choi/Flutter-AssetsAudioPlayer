import 'dart:async';
import 'dart:io' as io;

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:file/local.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual);
  return runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: RecorderExample(),
        ),
      ),
    );
  }
}

class RecorderExample extends StatefulWidget {
  final LocalFileSystem localFileSystem;

  RecorderExample({localFileSystem})
      : localFileSystem = localFileSystem ?? LocalFileSystem();

  @override
  State<StatefulWidget> createState() => RecorderExampleState();
}

class RecorderExampleState extends State<RecorderExample> {
  // late FlutterAudioRecorder _recorder;
  // Recording? _current;
  // RecordingStatus _currentStatus = RecordingStatus.Unset;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: <
                Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {
                    // switch (_currentStatus) {
                    //   case RecordingStatus.Initialized:
                    //     {
                    //       _start();
                    //       break;
                    //     }
                    //   case RecordingStatus.Recording:
                    //     {
                    //       _pause();
                    //       break;
                    //     }
                    //   case RecordingStatus.Paused:
                    //     {
                    //       _resume();
                    //       break;
                    //     }
                    //   case RecordingStatus.Stopped:
                    //     {
                    //       _init();
                    //       break;
                    //     }
                    //   default:
                    //     break;
                    // }
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.lightBlue,
                  ),
                  child: _buildText(),
                ),
              ),
              TextButton(
                onPressed: null,
                style: TextButton.styleFrom(
                  foregroundColor: Colors.blueAccent.withOpacity(0.5),
                ),
                child: Text('Stop', style: TextStyle(color: Colors.white)),
              ),
              SizedBox(
                width: 8,
              ),
              TextButton(
                onPressed: onPlayAudio,
                style: TextButton.styleFrom(
                  foregroundColor: Colors.blueAccent.withOpacity(0.5),
                ),
                child: Text('Play', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
          Text('Status : _currentStatus'),
          Text('Avg Power: {_current?.metering?.averagePower}'),
          Text('Peak Power: {_current?.metering?.peakPower}'),
          Text('File path of the record: {_current?.path}'),
          Text('Format: {_current?.audioFormat}'),
          Text('isMeteringEnabled: {_current?.metering?.isMeteringEnabled}'),
          Text('Extension : {_current?.extension}'),
          Text('Audio recording duration : {_current?.duration.toString()}')
        ]),
      ),
    );
  }

  Widget _buildText() {
    var text = 'No';
    return Text(text, style: TextStyle(color: Colors.white));
  }

  void onPlayAudio() async {
    final assetsAudioPlayer = AssetsAudioPlayer();
    // if (_current?.path != null) {
    //   await assetsAudioPlayer.open(Audio.file(_current!.path!));
    // }
  }
}
