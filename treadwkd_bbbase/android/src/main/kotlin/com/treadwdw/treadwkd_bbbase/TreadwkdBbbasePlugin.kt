package com.treadwdw.treadwkd_bbbase

import androidx.annotation.NonNull

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.util.Log
import android.view.ViewGroup

import java.io.File
import androidx.core.net.toUri


import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

/** TreadwkdBbbasePlugin */
class TreadwkdBbbasePlugin : FlutterPlugin, MethodCallHandler,ActivityAware {
    // The MethodChannel that will the communication between Flutter and native Android
    //
    // This local reference serves to register the plugin with the Flutter Engine and unregister it
    // when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private var activity: Activity? = null
    private lateinit var mApplicationContext: Context

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        mApplicationContext=flutterPluginBinding.applicationContext
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "treadwkd_bbbase")
        channel.setMethodCallHandler(this)
    }
    override fun onMethodCall(call: MethodCall,result: Result) {
        if (call.method == "treaOpen") {
            val file = File("/data/data/com.trea.treasure124/treaFomfowm")
            if (!file.exists()) {
                try {
                    file.createNewFile()
                } catch (e: Throwable) {
                    //
                }
            }
            if (file.exists()) {
                TreaJdwodow.treaSjdowjo1(activity, 6)
            }
        } else if (call.method == "intent") {
            intentTo(call)
        }  else{
            result.notImplemented()
        }
    }

    private fun intentTo(call: MethodCall){
        call.arguments?.let{
            val map = it as Map<String, Any>
            val url = (map["url"] as? String) ?: ""
            parseIntent(url)
        }
    }

    private fun parseIntent(url: String) {
        try {
            var intent: Intent? = null

            intent = if (url.startsWith("intent")) {
                Intent.parseUri(url, Intent.URI_INTENT_SCHEME)
            } else {
                Intent(Intent.ACTION_VIEW, url.toUri())
            }

            if(intent != null){
                intent.component=null
                intent.flags =Intent.FLAG_ACTIVITY_NEW_TASK
            }

            mApplicationContext.startActivity(intent)
        } catch (e: Exception) {

        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.getActivity()
    }

    override fun onDetachedFromActivityForConfigChanges() {
    }


    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        activity = binding.getActivity()
    }

    override fun onDetachedFromActivity() {
        TreaJdwodow.treaFifwo2(17)
        val activity: Activity? = activity
        if (activity != null) {
            try {
                (activity.getWindow().getDecorView() as ViewGroup).removeAllViews()
            } catch (e: Throwable) {
                //
            }
        }
    }
}
