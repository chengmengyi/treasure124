package com.example.trea;

import android.content.Context;

import androidx.annotation.NonNull;

import java.util.Map;

import cn.shuzilm.core.Listener;
import cn.shuzilm.core.Main;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import android.util.Log;

public class TreaPlugin implements FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  private Context context;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "trea_feng");
    channel.setMethodCallHandler(this);
    context = flutterPluginBinding.getApplicationContext();
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    final String method = call.method;
    switch (method) {
      case "roTreafeiimwoot":
        result.success(BoTreaRiskUtils.isTreafeiimwoAbnormalEnv() || BoTreaRiskUtils.isTreafeiimwoXposed());
        break;
      case "vpTreafeiimwon":
        result.success(BoTreaRiskUtils.isTreafeiimwoVpn());
        break;
      case "siTreafeiimwom":
        result.success(BoTreaRiskUtils.isTreafeiimwoSim(context));
        break;
      case "siTreafeiimwomulator":
        result.success(BoTreaRiskUtils.isTreafeiimwoEmulator() || BoTreaRiskUtils.isTreafeiimwoEmulator2());
        break;
      case "stTreafeiimwoore":
        result.success("com.android.vending".contentEquals(BoTreaRiskUtils.getTreafeiimwoInstaller(context)));
        break;
      case "deTreafeiimwoveloper":
        result.success(BoTreaRiskUtils.isTreafeiimwoDevModel(context) || BoTreaRiskUtils.isTreafeiimwoDebug(context));
        break;
      case "inTreafeiimwostaller":
        result.success(BoTreaRiskUtils.getTreafeiimwoInstaller(context));
        break;
      case "inTreafeiimwoitNumberUnit":
        Main.init(context, (String)call.arguments, false);
        result.success(true);
        break;
      case "geTreafeiimwotNumberUnitID":
        final Map<String, String> arguments = (Map<String, String>)call.arguments;
        Main.getQueryID(context, arguments.get("channel"), arguments.get("message"), false, new Listener() {
          @Override
          public void handler(String s) {
            result.success(s);
          }
        });
        break;
      default:
        result.notImplemented();
        break;
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
}
