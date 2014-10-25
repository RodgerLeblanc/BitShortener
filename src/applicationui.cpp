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

#include "applicationui.hpp"

#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>
#include <bb/cascades/SceneCover>
#include <bb/cascades/LocaleHandler>

#include <bb/ApplicationInfo>

using namespace bb::cascades;

ApplicationUI::ApplicationUI() :
        QObject(),
        device(new bb::device::HardwareInfo()),
        settings(new Settings(this)),
        upFront(new UpFront(this)),
        bitlyManager(new BitlyManager())
{
    setAppFontSize(settings->value("appFontSize", DEFAULT_APP_FONT_SIZE).toDouble());
    setActiveFrameFontSize(settings->value("activeFrameFontSize", DEFAULT_ACTIVE_FRAME_FONT_SIZE).toDouble());

    // prepare the localization
    m_pTranslator = new QTranslator(this);
    m_pLocaleHandler = new LocaleHandler(this);

    bool res = QObject::connect(m_pLocaleHandler, SIGNAL(systemLanguageChanged()), this, SLOT(onSystemLanguageChanged()));
    // This is only available in Debug builds
    Q_ASSERT(res);
    // Since the variable is not used in the app, this is added to avoid a
    // compiler warning
    Q_UNUSED(res);

    // initial load
    onSystemLanguageChanged();

    qmlRegisterType<BitlyManager>("BitlyManager.library", 1, 0, "BitlyManager");

    // Create scene document from main.qml asset, the parent is set
    // to ensure the document gets destroyed properly at shut down.
    QmlDocument *qml = QmlDocument::create("asset:///main.qml").parent(this);
    qml->setContextProperty("_app", this);
    qml->setContextProperty("_settings", settings);
    qml->setContextProperty("_bitlyManager", bitlyManager);

    // Create root object for the UI
    AbstractPane *root = qml->createRootObject<AbstractPane>();

    // Set created root object as the application scene
    Application::instance()->setScene(root);

    addApplicationCover();
}

void ApplicationUI::onSystemLanguageChanged()
{
    QCoreApplication::instance()->removeTranslator(m_pTranslator);
    // Initiate, load and install the application translation files.
    QString locale_string = QLocale().name();
    QString file_name = QString("BitShortener_%1").arg(locale_string);
    if (m_pTranslator->load(file_name, "app/native/qm")) {
        QCoreApplication::instance()->installTranslator(m_pTranslator);
    }
}

void ApplicationUI::addApplicationCover()
{
    QmlDocument *qmlCover = QmlDocument::create("asset:///cover/AppCover.qml").parent(this);
    qmlCover->setContextProperty("_app", this);
    qmlCover->setContextProperty("_settings", settings);
    qmlCover->setContextProperty("_bitlyManager", bitlyManager);

    if (!qmlCover->hasErrors()) {
        AbstractCover* cover = qmlCover->createRootObject<SceneCover>();

        Application::instance()->setCover(cover);
    }
}

int ApplicationUI::designUnits(const double& units)
{
    QString modelName = device->modelName();

    if (modelName == "Passport")
        return (14 * units);
    else if (modelName == "Z10")
        return (10 * units);
    else if ((modelName == "Q10") || (modelName == "Q5"))
        return (9 * units);
    else if ((modelName == "Z30") || (modelName == "Z3"))
        return (8 * units);
    else return (10 * units);
}

void ApplicationUI::sendToUpFront(const QString& message) {
    // Send to UpFront, fill backgroundZ image (url), image (url), title, message, color (bb::cascades::Color)
    bb::ApplicationInfo appInfo;
    QString backgroundZ = "";
    QString backgroundQ = backgroundZ;
    QString icon = "";
    QString seconds = ""; // leave blank
    QString sendToT2w = settings->value("sendToT2w", false).toString(); // leave blank
    QString textColor = "White"; // Choose any color available in QML
    QString other = "";

    QString command = appInfo.signingHash() + "##" + appInfo.title() + "##" + backgroundZ + "##" + backgroundQ + "##" + icon + "##" + message + "##" + seconds + "##" + sendToT2w + "##" + textColor + "##" + other;
    upFront->updateUpFront(command);
    qDebug() << "sendToUpFront:" << command;
}

bool ApplicationUI::copyToClipboard(const QString& url)
{
    clipboard.insert("text/plain", url.toAscii());
    return (clipboard.value("text/plain") == url);
}

void ApplicationUI::setAppFontSize(int appFontSize) {
    if (m_appFontSize != appFontSize) {
        m_appFontSize = appFontSize;
        settings->setValue("appFontSize", appFontSize);
        emit appFontSizeChanged();
    }
}

void ApplicationUI::setActiveFrameFontSize(int activeFrameFontSize) {
    if (m_activeFrameFontSize != activeFrameFontSize) {
        m_activeFrameFontSize = activeFrameFontSize;
        settings->setValue("activeFrameFontSize", activeFrameFontSize);
        emit activeFrameFontSizeChanged();
    }
}
