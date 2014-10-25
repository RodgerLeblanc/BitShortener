import bb.cascades 1.3

Container {
    layout: StackLayout {
        orientation: LayoutOrientation.LeftToRight
    }
    Label {
        text: "Send URL to Pebble Smartwatch"
        verticalAlignment: VerticalAlignment.Center
    }
    ImageButton {
        id: sendToT2wImageButton
        defaultImageSource: (_settings.value("sendToT2w", false)) ? "asset:///images/icons/checked.png" : "asset:///images/icons/notChecked.png" 
        minWidth: _app.designUnits(8.1)
        minHeight: minWidth
        verticalAlignment: VerticalAlignment.Center
        onClicked: {
            _settings.setValue("sendToT2w", !_settings.value("sendToT2w", false))
            defaultImageSource = (_settings.value("sendToT2w", false)) ? "asset:///images/icons/checked.png" : "asset:///images/icons/notChecked.png"
        }
    }    
}
