/* Copyright 2013 RealVNC ltd.
 * Portions Copyright 2011-2013 Car Connectivity Consortium LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.mirrorlink.android.commonapi;

import android.os.Bundle;

import android.os.Parcelable;

/**
 * Provides the interface related to 4.5 Display - Callbacks.
 * <br>
 * This is the interface for callbacks coming from {@link IDisplayManager}.
 */
oneway interface IDisplayListener {
    /**
     * 4.5.2 Display Configuration Callback.
     *
     * <br>
     * <i>Function reference 0x0402.</i>
     * <br>
     * Display Configuration has changed.
     * 
     * @param displayConfiguration the display configuration of the MirrorLink Client. The
     * fields available in the data type are in {@link Defs.DisplayConfiguration}.
     */
    void onDisplayConfigurationChanged(in Bundle displayConfiguration);

    /**
     * 4.5.4 Client Pixel Format Callback.
     *
     * <br>
     * <i>Function reference 0x0404.</i>
     * <br>
     * Pixel format has changed.
     *
     * @param pixelFormat the pixel format of the framebuffer data. A Bundle with the fields defined
     * in {@link Defs.ClientPixelFormat}.
     */
    void onPixelFormatChanged(in Bundle pixelFormat);

    /**
     * 4.5.6 Switch Framebuffer Orientation Callback.
     *
     * <br>
     * <i>Function reference 0x0406.</i>
     * <br>
     * MirrorLink Server requests a framebuffer orientation switch from the application. The actual
     * switch will happen via regular OS/platform mechanisms.
     *
     * @param framebufferOrientation Orientation of the Application Framebuffer. The possible values
     * are defined in {@link Defs.FramebufferOrientation}.
     */
    void onServerDisplayConfigurationChanged(in int framebufferOrientation);
}
