import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class Metodo1Page extends StatefulWidget {
  @override
  _Metodo1PageState createState() => _Metodo1PageState();
}

class _Metodo1PageState extends State<Metodo1Page> {
  
  AssetsAudioPlayer _assetsAudioPlayer;

  @override
  void initState() {
    super.initState();
    _assetsAudioPlayer = AssetsAudioPlayer();
  }

  @override
  void dispose() {
    _assetsAudioPlayer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.amber,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                  child: Icon(Icons.play_arrow),
                  onPressed: () {
                    _assetsAudioPlayer.open('assets/music/girassol.mp3');
                    _assetsAudioPlayer.playOrPause();
                  })
            ],
          ),
        ));
  }
}
