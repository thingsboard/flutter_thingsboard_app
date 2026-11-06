package de.petersen.nico.esp_provisioning_softap;

import androidx.annotation.NonNull;

import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

import javax.crypto.Cipher;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

/** EspSoftapProvisioningPlugin */
public class EspSoftapProvisioningPlugin implements FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  private Cipher cipher;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), "esp_provisioning_softap");
    channel.setMethodCallHandler(this);
  }


  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("init")) {
      byte[] key = call.argument("key");
      byte[] iv = call.argument("iv");

      IvParameterSpec ivParameterSpec = new IvParameterSpec(iv);
      SecretKeySpec secretKeySpec = new SecretKeySpec(key, 0, key.length, "AES");
      try {
        this.cipher = Cipher.getInstance("AES/CTR/NoPadding");
        this.cipher.init(Cipher.ENCRYPT_MODE, secretKeySpec, ivParameterSpec);
      } catch (NoSuchAlgorithmException e) {
        e.printStackTrace();
      } catch (InvalidKeyException e) {
        e.printStackTrace();
      } catch (InvalidAlgorithmParameterException e) {
        e.printStackTrace();
      } catch (NoSuchPaddingException e) {
        e.printStackTrace();
      }

      result.success(true);
    } else if (call.method.equals("crypt")) {
      byte[] data = call.argument("data");
      byte[] ret = cipher.update(data);
      result.success(ret);
    } else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
}
