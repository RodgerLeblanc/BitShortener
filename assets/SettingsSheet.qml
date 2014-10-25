import bb.cascades 1.0
import bb.system 1.0

Sheet {
    id: settingsSheet

    Page {
        titleBar: TitleBar {
            title: qsTr("Settings")
            acceptAction: ActionItem {
                title: qsTr("Ok")
                onTriggered: {
                    settingsSheet.close()
                }
            }
        }
        ScrollView {
            Container {
                id: mainContainer
                layout: DockLayout {}
                horizontalAlignment: HorizontalAlignment.Fill
                verticalAlignment: VerticalAlignment.Fill

                property double numberOfDoubleTaps: 0

                gestureHandlers: [
                    DoubleTapHandler {
                        onDoubleTapped: {
                            mainContainer.numberOfDoubleTaps++
                            if (mainContainer.numberOfDoubleTaps == 2) {
                                mainContainer.numberOfDoubleTaps = 0
                                _settings.setValue("sendToConsoleDebug", !_settings.value("sendToConsoleDebug", false))
                                systemToast.body = "ConsoleDebug mode set to " + (_settings.value("sendToConsoleDebug", false) ? "ON" : "OFF")
                                systemToast.show()
                            }
                        }
                        attachedObjects: [
                            SystemToast {
                                id: systemToast
                            }
                        ]
                    }
                ]

                Container {
                    topPadding: _app.designUnits(3)
                    leftPadding: topPadding
                    rightPadding: topPadding
                    ThemeContainer {
                        topPadding: _app.designUnits(3)
                        leftPadding: topPadding
                        rightPadding: topPadding
                    }
                    MainAppFontSizeContainer {
                        topPadding: _app.designUnits(3)
                        leftPadding: topPadding
                        rightPadding: topPadding
                    }
                    ActiveFrameFontSizeContainer {
                        topPadding: _app.designUnits(3)
                        leftPadding: topPadding
                        rightPadding: topPadding
                    }
                    SendToT2wContainer {
                        topPadding: _app.designUnits(3)
                        leftPadding: topPadding
                        rightPadding: topPadding
                        horizontalAlignment: HorizontalAlignment.Center
                    }
                }
            }            
        }
    }         
}
