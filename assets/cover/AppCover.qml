/* Copyright (c) 2013 BlackBerry Limited.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import bb.cascades 1.0

SceneCover {
    property string shortenUrl: _bitlyManager.shortenUrl
    property string expandedUrl: _bitlyManager.expandedUrl
    property int activeFrameFontSize: _app.activeFrameFontSize
        
    content: Container {        
        layout: DockLayout {}
        horizontalAlignment: HorizontalAlignment.Fill
        verticalAlignment: VerticalAlignment.Fill    
        background: Color.Black
        
        Container {
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
            Label {
                id: shortenLabel
                text: (shortenUrl == "") ? "No URL shorten yet" : "Shorten URL :\n" + shortenUrl
                textStyle.fontSize: FontSize.PointValue
                textStyle.fontSizeValue: activeFrameFontSize
                textStyle.color: Color.White
                multiline: true
                horizontalAlignment: HorizontalAlignment.Center
                onTextChanged: {
                    if ((shortenUrl != "") || (expandedUrl != ""))
                        _app.sendToUpFront(shortenLabel.text + "\n\n" + expandedLabel.text)
                }
            }
            Divider {}
            Label {
                id: expandedLabel
                text: (expandedUrl == "") ? "No URL expanded yet" : "Expanded URL :\n" + expandedUrl
                textStyle.fontSize: FontSize.PointValue
                textStyle.fontSizeValue: activeFrameFontSize
                textStyle.color: Color.White
                multiline: true
                horizontalAlignment: HorizontalAlignment.Center
                onTextChanged: {
                    if ((shortenUrl != "") || (expandedUrl != ""))
                        _app.sendToUpFront(shortenLabel.text + "\n\n" + expandedLabel.text)
                }
            }
        }
    } 
} //  SceneCover
