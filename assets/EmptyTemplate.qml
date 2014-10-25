import bb.cascades 1.0
import bb.system 1.0

Container {
    property string bitlyService
    property bool copiedToClipboard: false
    property string shortenUrl: _bitlyManager.shortenUrl
    property string expandedUrl: _bitlyManager.expandedUrl
    property bool urlValid: _bitlyManager.urlValid
    property int appFontSize: _app.appFontSize
    
    onUrlValidChanged: {
        console.log("onUrlValidChanged : " + urlValid)
        if (!urlValid) {
            systemToast.body = "This URL is not valid"
            systemToast.show()
            _bitlyManager.setUrlValid(true)
        }
    }   
    
    onCopiedToClipboardChanged: {
        console.log("onCopiedToClipboardChanged: " + copiedToClipboard)
        if (copiedToClipboard) {
            systemToast.body = "Copied link to clipboard"
            systemToast.show()
        }
    }        

    horizontalAlignment: HorizontalAlignment.Center
    verticalAlignment: VerticalAlignment.Center
    
    Container {
        id: inputContainer
        layout: StackLayout {
            orientation: LayoutOrientation.LeftToRight
        }
        topPadding: _app.designUnits(3)
        bottomPadding: topPadding
        leftPadding: topPadding
        rightPadding: topPadding
        
        TextField {
            id: inputTextField
            hintText: qsTr("URL to " + bitlyService.toLowerCase())
            enabled: !outputContainer.visible
            input.submitKey: SubmitKey.Send
            inputMode: TextFieldInputMode.Url
            input {
                onSubmitted: {
                    bitlyServiceImageButton.clicked()
                }
            }             
        }
        ImageButton {
            id: bitlyServiceImageButton
            maxHeight: _app.designUnits(8.1)
            maxWidth: maxHeight
            defaultImageSource: (bitlyService == "Shorten") ? "asset:///images/icons/shrinkIcon_dark.png" : "asset:///images/icons/expandIcon_dark.png" 
            visible: !outputContainer.visible
            onClicked: {
                console.log(bitlyService + " button triggered by user")
                
                inputTextField.text = inputTextField.text.trim()
                
                if ((inputTextField.text.indexOf(".") < 0) || (inputTextField.text == "")) {
                    systemToast.body = "This URL is not valid"
                    systemToast.show()
                    return 
                }
                
                if (inputTextField.text.toLowerCase().substring(0, 4) != "http")
                    inputTextField.text = "http://" + inputTextField.text
                
                _bitlyManager.sendRequest(inputTextField.text, bitlyService)
            }
        }
        ImageButton {
            id: restartImageButton
            maxHeight: _app.designUnits(8.1)
            maxWidth: maxHeight
            defaultImageSource: "asset:///images/icons/ic_delete.png" 
            visible: outputContainer.visible
            onClicked: {
                console.log("Restart button triggered by user")
                inputTextField.text = ""
                if (bitlyService == "Shorten")
                    _bitlyManager.setShortenUrl("")
                else 
                    _bitlyManager.setExpandedUrl("")
            }
        }
    }
    
    Container {
        id: outputContainer
        visible: (outputLabel.text != "")
        layout: StackLayout {
            orientation: LayoutOrientation.LeftToRight
        }
        topPadding: _app.designUnits(3)
        bottomPadding: topPadding
        leftPadding: topPadding
        rightPadding: topPadding
        horizontalAlignment: HorizontalAlignment.Center
        verticalAlignment: VerticalAlignment.Center
        
        Label {
            id: outputLabel
            text: (bitlyService == "Shorten") ? shortenUrl : expandedUrl 
            verticalAlignment: VerticalAlignment.Center
            multiline: true
            textStyle.color: Color.Red
            textStyle.fontSize: FontSize.PointValue
            textStyle.fontSizeValue: appFontSize
            onTextChanged: {
                console.log(bitlyService + " label text changed : " + text)
                copiedToClipboard = false
            }
        }
        ImageButton {
            id: shareImageButton
            maxHeight: _app.designUnits(8.1)
            maxWidth: maxHeight
            defaultImageSource: "asset:///images/icons/ic_share_dark.png" 
            verticalAlignment: VerticalAlignment.Center
            onClicked: {
                invoke.query.data = outputLabel.text
                invoke.query.mimeType = "text/plain"
                invoke.query.invokeActionId = "bb.action.SHARE"
                invoke.query.updateQuery()
            }
        }
        ImageButton {
            id: copyImageButton
            maxHeight: _app.designUnits(8.1)
            maxWidth: maxHeight
            defaultImageSource: "asset:///images/icons/ic_copy.png" 
            verticalAlignment: VerticalAlignment.Center
            enabled: !copiedToClipboard
            onClicked: {
                console.log("Copy button triggered by user")
                copiedToClipboard = _app.copyToClipboard(outputLabel.text)
            }
        }
    }
    attachedObjects: [
        Invocation {
            id: invoke
            onArmed: {
                console.log("Sharing this text : " + query.data)
                trigger("bb.action.SHARE")
            }
        },
        SystemToast {
            id: systemToast
        }
    ]
}
