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

import com.mirrorlink.android.commonapi.IContextListener;

/**
 * Provides the interface related to 4.9 Context Information.
 * <br>
 * The callbacks are defined in {@link IContextListener}.
 *
 * <br>
 * <i>Module reference: 0x08</i>
 * <br>
 * <i>Server requirement: Mandatory</i>
 */
interface IContextManager {

    /**
     * 4.9.1 Framebuffer Context Information.
     *
     * <br>
     * <i>Function reference 0x0801.</i>
     * <br>
     * Provides information of the current framebuffer context; the MirrorLink Server MUST use the
     * application and content category values from the UPnP advertisements, unless otherwise stated
     * from the application using this function. The MirrorLink Server MUST use the given values
     * until a new set function is called. Unless set by the application, the MirrorLink Server MUST
     * treat the "Handle Blocking" flag as being set to a FALSE value.
     * <br>
     * If no explicit audio context information is set, then the server will behave as if the
     * appplication doesn't handle framebuffer blocking notifications.
     * <br>
     * Calling this will reset any previous information on the framebuffer context information, so
     * the application must ensure to always include all the context information each time it
     * invokes this call.
     *
     * @param applicationCategory Category of the application. Should be one defined in {@link
     * Defs.ContextInformation}.
     * @param contentCategoryInfo A list of rectangles with their context information. Any areas not
     * covered by the list will be treated as having the default context information. So if the list
     * is empty, then the server will just assume that the context information is the default one
     * for the whole application. Each element of the list is a pair consisting of a Bundle which
     * has the fields defined in {@link Defs.Rect} and an integer with one of the values defined in
     * {@link Defs.ContextInformation}. Each rectangle should have the absolute screen coordinates.
     * @param handleBlocking Flag indicating whether the application will take care of the blocking
     * if the MirrorLink Client blocks the content.
     */
    void setFramebufferContextInformation(in int applicationCategory,
            in List<Pair<Bundle, int>> contentCategoryInfo,
            in boolean handleBlocking);

    /**
     * 4.9.3 Audio Context Information.
     *
     * <br>
     * <i>Function reference 0x0803.</i>
     * <br>
     * Provides information of the current audio context and whether the application is currently
     * providing audio; The MirrorLink Server MUST use the application category value from the UPnP
     * advertisements, unless otherwise stated from the application using this SET function. The
     * MirrorLink Server MUST use the given values until a new SET function call is issued. The
     * application has to set the application context information prior to starting the audio
     * stream. Unless set by the application, the MirrorLink Server MUST treat the "Handle Blocking"
     * flag as being set to a FALSE value.
     * <br>
     * If no explicit audio context information is set, then the server will behave as if the
     * appplication doesn't handle audio blocking notifications.
     * <br>
     * Calling this will reset any previous information on the audio context information, so the
     * application must ensure to always include all the context information each time it invokes
     * this call.
     *
     * @param audioContent Application is providing Audio content
     *        If set to True, the application is creating an audio stream,
     *        which is potentially mixed with other audio sources. Should be one defined in {@link
     *        Defs.ContextInformation}.
     * @param audioCategories Categories of the audio stream. A list of cetegories defined in {@link
     * Defs.ContextInformation}. Usually an application will only have one category (for example
     * media), but if some applications have two or more audio sources contributing to the stream in
     * parallel (for example one application might stream media and navigation at the same time),
     * then it is possible to report both categories. The list should be ordered with the higher
     * priority category first.
     * @param handleBlocking Flag indicating whether the application will take care of the blocking
     * if the MirrorLink Client blocks the content.
     */
    void setAudioContextInformation(in boolean audioContent, in List<int> audioCategory,
            in boolean handleBlocking);

    /**
     * Notifies the Manager that the application is not using it anymore.
     * <br>
     * Applications are required to call this method when they no longer need to use the Manager.
     * Once called, if at a later point they need the Manager again, they can re-request access to
     * it from the {@link ICommonAPIService}.
     * <br>
     * Once unregister is received by the server, the application will not receive any more
     * callbacks from the Manager.
     */
    void unregister();
}
