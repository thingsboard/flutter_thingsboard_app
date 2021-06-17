package org.thingsboard.app

import android.app.Activity
import android.net.Uri
import android.os.Bundle

class TbWebCallbackActivity: Activity() {
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)

    val url = intent?.data
    val scheme = url?.scheme

    if (scheme != null) {
        TbWebAuthHandler.callbacks.remove(scheme)?.success(url.toString())
    }

    finish()
  }
}
