/*
 * Copyright (c) 2011-2014 BlackBerry Limited.
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
import bb.system 1.0
import bb.device 1.0

TabbedPane {
    id: tabbedPane
    showTabsOnActionBar: true

    property string isPassport: thisDevice.modelName == "Passport"
    
    onCreationCompleted: {
        if (_settings.value("firstRun", true))
            if (isPassport)
                systemToast.show()
    }

    Tab { //First tab
        id: shortenTab
        title: qsTr("Shorten") + Retranslate.onLocaleOrLanguageChanged
        imageSource: "asset:///images/icons/shrinkIcon.png"
        Page {        
            titleBar: TitleBar {
                title: "URL Shortener"
                kind: TitleBarKind.Default
                appearance: TitleBarAppearance.Default
            }

            Container {
                layout: DockLayout {}
                horizontalAlignment: HorizontalAlignment.Fill
                verticalAlignment: VerticalAlignment.Fill
                KeyboardListener {
                    haveFocus: true
                    horizontalMinimalSwipeInDU: 20
                    onSwipeLeft: tabbedPane.activeTab = expandTab
                    onSwipeRight: tabbedPane.activeTab = expandTab
                }
                EmptyTemplate {
                    bitlyService: "Shorten"
                }
            }
        }
    } //End of first tab
    Tab { //Second tab
        id: expandTab
        title: qsTr("Expand") + Retranslate.onLocaleOrLanguageChanged
        imageSource: "asset:///images/icons/expandIcon.png"
        Page {        
            titleBar: TitleBar {
                title: "Bit.ly Expander"
                kind: TitleBarKind.Default
                appearance: TitleBarAppearance.Default
            }

            Container {
                layout: DockLayout {}
                horizontalAlignment: HorizontalAlignment.Fill
                verticalAlignment: VerticalAlignment.Fill
                KeyboardListener {
                    haveFocus: true
                    horizontalMinimalSwipeInDU: 20
                    onSwipeLeft: tabbedPane.activeTab = shortenTab
                    onSwipeRight: tabbedPane.activeTab = shortenTab
                }
                EmptyTemplate {
                    bitlyService: "Expand"
                }
            }
        }
    } //End of second tab
    
    Menu.definition: MenuDefinition {
        settingsAction: [
            SettingsActionItem {
                ActionBar.placement: ActionBarPlacement.OnBar
                onTriggered: {
                    settingsSheet.open()
                }
            }
        ]
        
        actions: [
            ActionItem {
                title: qsTr("About")
                ActionBar.placement: ActionBarPlacement.OnBar
                imageSource: "asset:///images/icons/ic_info.png"
                onTriggered: {
                    aboutSheet.open()
                }
            },
            ActionItem {
                title: qsTr("More apps")
                ActionBar.placement: ActionBarPlacement.OnBar
                imageSource: "asset:///images/icons/ic_share.png"
                onTriggered: {
                    invoke.trigger("bb.action.OPEN");
                }
            }
        ]      
    } // end of MenuDefinition
    
    attachedObjects: [
        AboutSheet {
            id: aboutSheet
        },
        SettingsSheet {
            id: settingsSheet
        },
        ComponentDefinition {
            id: menu
        },
        Invocation {
            id: invoke
            query {
                invokeTargetId: "sys.appworld"
                uri: "appworld://vendor/70290"
            }
        },
        SystemToast {
            id: systemToast
            body: "Tabs can be controlled with your touch enabled keyboard!"
            position: SystemUiPosition.TopCenter
            button.label: "Ok"
            onFinished: _settings.setValue("firstRun", false)
        },
        HardwareInfo {
            id: thisDevice
        }
    ]

}
