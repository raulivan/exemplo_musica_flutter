import 'dart:io';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/src/foundation/constants.dart';

class Metodo2Page extends StatefulWidget {
  @override
  _Metodo2PageState createState() => _Metodo2PageState();
}

class _Metodo2PageState extends State<Metodo2Page> {
  String musica = 'assets/music/girassol.mp3';
  String caminho_musica;
  String titulo = 'Nenhum música';
  String progresso = '00:00:00';
  String tamanho = '00:03:00';

  AudioPlayer audioPlayer;
  AudioCache audioCache = AudioCache();
  AudioPlayerState _audioPlayerState;
  Duration _duracao;
  Duration _posicao;


  Future carregarMusica() async {
    final dir = await getApplicationDocumentsDirectory();
    var bytes;
    File(musica).readAsBytes().then((valor){
      bytes = valor;
    });

    final file = File('${dir.path}/audio.mp3');
    await file.writeAsBytes(bytes);

    if (await file.exists()) {
      setState(() {
        caminho_musica = file.path;
      });
    }
  }

  void initAudioPlayer() {
    audioPlayer = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);

    audioPlayer.onDurationChanged.listen((duracao) {
      setState(() {
        _duracao = duracao;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((posicao) {
      setState(() {
        _posicao = posicao;
      });
    });

    audioPlayer.onPlayerStateChanged.listen((estado) {
      setState(() {
        _audioPlayerState = estado;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    carregarMusica();
    initAudioPlayer();
  }

  @override
  void dispose() {
    audioPlayer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blueGrey,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Titulo: $titulo',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                    onPressed: () {
                      debugPrint('Load');
                    },
                    child: Icon(
                      Icons.folder_open,
                      size: 100,
                      color: Colors.white,
                    )),
                FlatButton(
                    onPressed: () {
                      debugPrint('Play');
                      audioPlayer.play(caminho_musica, position: _posicao);
                    },
                    child: Icon(
                      Icons.play_arrow,
                      size: 100,
                      color: Colors.white,
                    )),
                FlatButton(
                    onPressed: () {
                      debugPrint('Pause');
                    },
                    child: Icon(
                      Icons.pause,
                      size: 100,
                      color: Colors.white,
                    )),
                FlatButton(
                    onPressed: () {
                      debugPrint('Stop');
                    },
                    child: Icon(
                      Icons.stop,
                      size: 100,
                      color: Colors.white,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                executando(),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '$progresso/$tamanho',
                  style: TextStyle(fontSize: 30, color: Colors.white70),
                ),
              ],
            )
          ],
        )));
  }

  Widget executando() {
    return CircularProgressIndicator();
  }
}
