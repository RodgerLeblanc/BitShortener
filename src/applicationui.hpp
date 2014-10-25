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

#ifndef ApplicationUI_HPP_
#define ApplicationUI_HPP_

#include "Commons.h"
#include "src/Settings/Settings.h"
#include "src/UpFront/UpFront.h"
#include <src/BitlyManager/BitlyManager.h>

#include <QObject>
#include <bb/device/HardwareInfo>
#include <bb/system/Clipboard>

namespace bb
{
    namespace cascades
    {
        class LocaleHandler;
    }
}

class QTranslator;

/*!
 * @brief Application UI object
 *
 * Use this object to create and init app UI, to create context objects, to register the new meta types etc.
 */
class ApplicationUI : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int appFontSize READ getAppFontSize WRITE setAppFontSize NOTIFY appFontSizeChanged);
    Q_PROPERTY(int activeFrameFontSize READ getActiveFrameFontSize WRITE setActiveFrameFontSize NOTIFY activeFrameFontSizeChanged);

public:
    ApplicationUI();
    virtual ~ApplicationUI() {}

    Q_INVOKABLE int designUnits(const double& units);
    Q_INVOKABLE void sendToUpFront(const QString& message);
    Q_INVOKABLE bool copyToClipboard(const QString& url);

private slots:
    void onSystemLanguageChanged();
private:
    void addApplicationCover();

    int getAppFontSize() { return m_appFontSize; }
    void setAppFontSize(int appFontSize);
    int getActiveFrameFontSize() { return m_activeFrameFontSize; }
    void setActiveFrameFontSize(int activeFrameFontSize);

    QTranslator* m_pTranslator;
    bb::cascades::LocaleHandler* m_pLocaleHandler;

    bb::device::HardwareInfo* device;
    Settings* settings;
    UpFront* upFront;
    BitlyManager* bitlyManager;

    bb::system::Clipboard clipboard;

    int m_appFontSize;
    int m_activeFrameFontSize;

signals:
    void appFontSizeChanged();
    void activeFrameFontSizeChanged();
};

#endif /* ApplicationUI_HPP_ */
