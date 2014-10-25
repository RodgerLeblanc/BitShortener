/*
 * ConsoleDebugSettings.cpp
 *
 *  Created on: 2014-10-20
 *      Author: Roger
 */

#include <src/ConsoleDebug/ConsoleDebugSettings.h>
#include <QFile>

ConsoleDebugSettings::ConsoleDebugSettings()
{
    // If the settings file doesn't exists, create it
    QFile jsonFile(SETTINGS_FILE);
    if (!jsonFile.exists())
        jda.save(QVariant(settings), SETTINGS_FILE);

    jsonFile.deleteLater();

    settings = jda.load(SETTINGS_FILE).toMap();
}

ConsoleDebugSettings::~ConsoleDebugSettings()
{
}

QVariant ConsoleDebugSettings::value(const QString &key, const QVariant &defaultValue)
{
    // Returns the value associated with the key key.
    // If the settings file contains no item with key key,
    // the function returns defaultValue.

    // Return on empty key.
    if (key.trimmed().isEmpty())
        return QVariant();

    if (settings.contains(key)) {
        return settings.value(key);
    }
    else
        return defaultValue;
}
