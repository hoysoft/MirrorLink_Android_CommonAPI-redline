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

/**
 * Provides the interface related to 4.9 Context Information - Callbacks.
 *
 * This is the interface for callbacks coming from {@link IContextManager}.
 */
oneway interface IContextListener {

    /**
     * 4.9.2 Framebuffer Blocking Information Callback.
     *
     * Framebuffer is blocked from the MirrorLink Client; in case the application has indicated that
     * it will handle the blocking it MUST remove the blocked content.
     *
     * The application MUST switch to an activity with updated context information.  If the not, the
     * MirrorLink Server will unblock the framebuffer by terminating the application.
     *
     * @param reason Reason for Framebuffer blocking
     *        Note: Blocking because of the wrong framebuffer orientation, is not reported via this function.
     * @param framebufferArea Framebuffer rectangle for the specified region.
     *
     */
    void onFramebufferBlocked(in int reason, in Rect framebufferArea);

    /**
     * 4.9.4 Audio Blocking Information.
     *
     * Audio is blocked from the MirrorLink Client; in case the application has indicated that
     * it will handle the blocking it MUST remove the blocked content.
     *
     * @param reason Reason for Audio blocking
     */
    void onAudioBlocked(in int reason);
}
