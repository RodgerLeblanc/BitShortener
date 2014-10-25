# Config.pri file version 2.0. Auto-generated by IDE. Any changes made by user will be lost!
BASEDIR = $$quote($$_PRO_FILE_PWD_)

device {
    CONFIG(debug, debug|release) {
        profile {
            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        } else {
            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        }

    }

    CONFIG(release, debug|release) {
        !profile {
            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        }
    }
}

simulator {
    CONFIG(debug, debug|release) {
        !profile {
            CONFIG += \
                config_pri_assets \
                config_pri_source_group1
        }
    }
}

config_pri_assets {
    OTHER_FILES += \
        $$quote($$BASEDIR/assets/AboutSheet.qml) \
        $$quote($$BASEDIR/assets/ActiveFrameFontSizeContainer.qml) \
        $$quote($$BASEDIR/assets/EmptyTemplate.qml) \
        $$quote($$BASEDIR/assets/KeyboardListener.qml) \
        $$quote($$BASEDIR/assets/MainAppFontSizeContainer.qml) \
        $$quote($$BASEDIR/assets/SendToT2wContainer.qml) \
        $$quote($$BASEDIR/assets/SettingsSheet.qml) \
        $$quote($$BASEDIR/assets/ThemeContainer.qml) \
        $$quote($$BASEDIR/assets/cover/AppCover.qml) \
        $$quote($$BASEDIR/assets/images/19Z6pTK.png) \
        $$quote($$BASEDIR/assets/images/icons/checked.png) \
        $$quote($$BASEDIR/assets/images/icons/expandIcon.png) \
        $$quote($$BASEDIR/assets/images/icons/expandIcon_dark.png) \
        $$quote($$BASEDIR/assets/images/icons/ic_copy.png) \
        $$quote($$BASEDIR/assets/images/icons/ic_delete.png) \
        $$quote($$BASEDIR/assets/images/icons/ic_info.png) \
        $$quote($$BASEDIR/assets/images/icons/ic_share.png) \
        $$quote($$BASEDIR/assets/images/icons/ic_share_dark.png) \
        $$quote($$BASEDIR/assets/images/icons/notChecked.png) \
        $$quote($$BASEDIR/assets/images/icons/shrinkIcon.png) \
        $$quote($$BASEDIR/assets/images/icons/shrinkIcon_dark.png) \
        $$quote($$BASEDIR/assets/main.qml) \
        $$quote($$BASEDIR/assets/mindw0h0du/KeyboardListener.qml) \
        $$quote($$BASEDIR/assets/mindw0h0du/ThemeContainer.qml)
}

config_pri_source_group1 {
    SOURCES += \
        $$quote($$BASEDIR/src/BitlyManager/BitlyManager.cpp) \
        $$quote($$BASEDIR/src/ConsoleDebug/Console.cpp) \
        $$quote($$BASEDIR/src/ConsoleDebug/ConsoleDebugSettings.cpp) \
        $$quote($$BASEDIR/src/Settings/Settings.cpp) \
        $$quote($$BASEDIR/src/UpFront/UpFront.cpp) \
        $$quote($$BASEDIR/src/applicationui.cpp) \
        $$quote($$BASEDIR/src/main.cpp)

    HEADERS += \
        $$quote($$BASEDIR/src/BitlyManager/BitlyManager.h) \
        $$quote($$BASEDIR/src/Commons.h) \
        $$quote($$BASEDIR/src/ConsoleDebug/Console.h) \
        $$quote($$BASEDIR/src/ConsoleDebug/ConsoleDebugSettings.h) \
        $$quote($$BASEDIR/src/Settings/Settings.h) \
        $$quote($$BASEDIR/src/UpFront/UpFront.h) \
        $$quote($$BASEDIR/src/applicationui.hpp)
}

CONFIG += precompile_header

PRECOMPILED_HEADER = $$quote($$BASEDIR/precompiled.h)

lupdate_inclusion {
    SOURCES += \
        $$quote($$BASEDIR/../src/*.c) \
        $$quote($$BASEDIR/../src/*.c++) \
        $$quote($$BASEDIR/../src/*.cc) \
        $$quote($$BASEDIR/../src/*.cpp) \
        $$quote($$BASEDIR/../src/*.cxx) \
        $$quote($$BASEDIR/../src/BitlyManager/*.c) \
        $$quote($$BASEDIR/../src/BitlyManager/*.c++) \
        $$quote($$BASEDIR/../src/BitlyManager/*.cc) \
        $$quote($$BASEDIR/../src/BitlyManager/*.cpp) \
        $$quote($$BASEDIR/../src/BitlyManager/*.cxx) \
        $$quote($$BASEDIR/../src/ConsoleDebug/*.c) \
        $$quote($$BASEDIR/../src/ConsoleDebug/*.c++) \
        $$quote($$BASEDIR/../src/ConsoleDebug/*.cc) \
        $$quote($$BASEDIR/../src/ConsoleDebug/*.cpp) \
        $$quote($$BASEDIR/../src/ConsoleDebug/*.cxx) \
        $$quote($$BASEDIR/../src/Settings/*.c) \
        $$quote($$BASEDIR/../src/Settings/*.c++) \
        $$quote($$BASEDIR/../src/Settings/*.cc) \
        $$quote($$BASEDIR/../src/Settings/*.cpp) \
        $$quote($$BASEDIR/../src/Settings/*.cxx) \
        $$quote($$BASEDIR/../src/UpFront/*.c) \
        $$quote($$BASEDIR/../src/UpFront/*.c++) \
        $$quote($$BASEDIR/../src/UpFront/*.cc) \
        $$quote($$BASEDIR/../src/UpFront/*.cpp) \
        $$quote($$BASEDIR/../src/UpFront/*.cxx) \
        $$quote($$BASEDIR/../assets/*.qml) \
        $$quote($$BASEDIR/../assets/*.js) \
        $$quote($$BASEDIR/../assets/*.qs) \
        $$quote($$BASEDIR/../assets/cover/*.qml) \
        $$quote($$BASEDIR/../assets/cover/*.js) \
        $$quote($$BASEDIR/../assets/cover/*.qs) \
        $$quote($$BASEDIR/../assets/images/*.qml) \
        $$quote($$BASEDIR/../assets/images/*.js) \
        $$quote($$BASEDIR/../assets/images/*.qs) \
        $$quote($$BASEDIR/../assets/images/icons/*.qml) \
        $$quote($$BASEDIR/../assets/images/icons/*.js) \
        $$quote($$BASEDIR/../assets/images/icons/*.qs) \
        $$quote($$BASEDIR/../assets/mindw0h0du/*.qml) \
        $$quote($$BASEDIR/../assets/mindw0h0du/*.js) \
        $$quote($$BASEDIR/../assets/mindw0h0du/*.qs)

    HEADERS += \
        $$quote($$BASEDIR/../src/*.h) \
        $$quote($$BASEDIR/../src/*.h++) \
        $$quote($$BASEDIR/../src/*.hh) \
        $$quote($$BASEDIR/../src/*.hpp) \
        $$quote($$BASEDIR/../src/*.hxx)
}

TRANSLATIONS = $$quote($${TARGET}.ts)
