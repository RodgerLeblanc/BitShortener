BitShortener(beginner)
=========

This BB10 app is a Bit.ly client. Use at your own risk!


Features :
- Compatible with 10.2 and up (can be compatible with 10.0 if you want, I don't have API lower than 10.2 installed)
- Complete rewrite, tried to use the best coding practice I know (SIGNAL/SLOT, Q_PROPERTY, property, classes, custom QML components, #define, etc.)
- Added 'About', 'More Apps' and 'Settings' options
- Touch keyboard users can change tab by swiping either left or right on their keyboard
- At first run only, SystemToast will tell users with a touch enabled keyboard they can swipe between tabs
- 10.3 users can change the theme immediatly without an app restart
- Active frame support (no small active frame for Passport, waiting for Derek' explanation on how to do this with a 10.2 build)
- Font size is customizable for main app and active frame
- Connects to UpFront
- Connects to ConsoleDebug (hidden feature : double tap 2 times anywhere in Settings page to enable/disable)
- URL can be sent to Pebble Smartwatch 

What needs to be done :
- Add icons and splashscreens
- Include barcode
- Make the app invokable as a card 
- Make a 'Contact us' option (really easy, but totally forgot)
- Add qsTr() and tr() at some place + translations
- Make it prettier



LICENSE
--------------
This app doesn't have a license, but it doesn't mean it can be used freely. Here's what GitHub says about it :
"Generally speaking, the absence of a license means that the default copyright laws apply. This means that you retain all rights to your source code and that nobody else may reproduce, distribute, or create derivative works from your work. This might not be what you intend."

In fact, that's what I intend. You can look at the code and learn from it, but YOU ARE NOT ALLOWED TO COPY, REPRODUCE OR PUBLISH THIS CODE ON YOUR OWN NAME.

If you want to use this code inside one of your app, please contat me by email. My email address can be found here :
https://github.com/RodgerLeblanc
