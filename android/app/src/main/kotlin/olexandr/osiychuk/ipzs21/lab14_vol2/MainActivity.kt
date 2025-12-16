package olexandr.osiychuk.ipzs21.lab14_vol2
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.text.SimpleDateFormat
import java.util.Locale
import java.util.Date

class MainActivity : FlutterActivity(){

    private val CHANNEL = "com.example/lab14"


    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->
            if (call.method == "getNativeData") {
                val formatter = SimpleDateFormat("HH:mm:ss", Locale.getDefault())
                val time = formatter.format(Date())
                result.success(time)
            } else {
                result.notImplemented()
            }

        }
    }

}
