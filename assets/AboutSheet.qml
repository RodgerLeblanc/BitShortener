import bb.cascades 1.0
import bb.system 1.0

Sheet {
    id: aboutSheet
    Page {
        titleBar: TitleBar {
            title: qsTr("About")
            acceptAction: ActionItem {
                title: qsTr("Ok")
                onTriggered: {
                    aboutSheet.close()
                }
            }
        }
        ScrollView {
            Container {
                topPadding: _app.designUnits(3)
                leftPadding: topPadding
                rightPadding: topPadding
                bottomPadding: topPadding
                layout: DockLayout {}
                horizontalAlignment: HorizontalAlignment.Fill
                verticalAlignment: VerticalAlignment.Fill
                Container {
                    horizontalAlignment: HorizontalAlignment.Center
                    verticalAlignment: VerticalAlignment.Center
                    Label {
                        horizontalAlignment: HorizontalAlignment.Center
                        text: Application.applicationName + " " + Application.applicationVersion
                        textStyle.base: SystemDefaults.TextStyles.BigText
                    }
                    Label {
                        horizontalAlignment: HorizontalAlignment.Center
                        text: qsTr("Powered by ") + "<html><a href=\"http://bitly.com\">Bitly</a></html>"
                        multiline: true
                        textStyle.base: SystemDefaults.TextStyles.BodyText
                        textFormat: TextFormat.Html
                    }
                }
            }
        }
    }
}
