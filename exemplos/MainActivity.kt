package com.exemplo.meuapp

import com.pontotel.bateponto.sdk.BatePontoSdk
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            "com.pontotel.bateponto/sdk"
        ).setMethodCallHandler { call, result ->
            if (call.method != "open") {
                result.notImplemented()
            } else {
                try {
                    BatePontoSdk.open(this)
                    result.success(null)
                } catch (error: Exception) {
                    result.error(
                        "OPEN_FAILED",
                        "Não foi possível abrir o BatePonto.",
                        null
                    )
                }
            }
        }
    }
}
