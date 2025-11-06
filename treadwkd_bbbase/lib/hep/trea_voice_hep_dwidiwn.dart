import 'package:audioplayers/audioplayers.dart';
import 'package:treadwkd_bbbase/hep/trea_firebase_hep_nievnie.dart';

enum SoundType{
  bgm,bigReward,bubble,button,click,fail,fan,gua,smallReward,
}

class TreaVoiceHepDwidiwn{
  static final TreaVoiceHepDwidiwn _dwidiwn=TreaVoiceHepDwidiwn();
  static TreaVoiceHepDwidiwn get instance => _dwidiwn;

  final AudioPlayer _bgm=AudioPlayer();

  initVoicehidjow()async{
    final audioContext = AudioContext(
      android: const AudioContextAndroid(
        isSpeakerphoneOn: true,
        stayAwake: false,
        contentType: AndroidContentType.music,
        usageType: AndroidUsageType.media,
        audioFocus: AndroidAudioFocus.none,
      ),
      iOS: AudioContextIOS(
        category: AVAudioSessionCategory.playback,
        options: {
          AVAudioSessionOptions.mixWithOthers
        },
      ),
    );
    await AudioPlayer.global.setAudioContext(audioContext);
  }

  setMusichdiwhid(){
    if(bPlayMusic.getData()){
      bPlayMusic.saveData(false);
      _bgm.pause();
    }else{
      bPlayMusic.saveData(true);
      playBgmdwmodwo();
    }
  }

  playBgmdwmodwo(){
    if(bPlayMusic.getData()){
      _bgm.setReleaseMode(ReleaseMode.loop);
      _bgm.play(AssetSource("${SoundType.bgm.name}.mp3"));
    }
  }

  pauseBgmdwodpw(){
    if(_bgm.state==PlayerState.playing){
      _bgm.pause();
    }
  }

  playSound(SoundType soundType){
    if(bPlaySound.getData()){
      AudioPlayer audio=AudioPlayer();
      audio.onPlayerStateChanged.listen((state){
        if(state==PlayerState.completed){
          audio.dispose();
        }
      });
      audio.play(AssetSource("${soundType.name}.mp3"));
    }
  }
}