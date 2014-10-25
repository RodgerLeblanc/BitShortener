/*
 * ConsoleDebugSettings.h
 *
 *  Created on: 2014-10-20
 *      Author: Roger
 */

#ifndef CONSOLEDEBUGSETTINGS_H_
#define CONSOLEDEBUGSETTINGS_H_

#include <bb/data/JsonDataAccess>

#define SETTINGS_FILE "data/settings.json"
#define SETTINGS_ERROR "ERROR IN KEY NAME"

class ConsoleDebugSettings
{
public:
    ConsoleDebugSettings();
    virtual ~ConsoleDebugSettings();

    QVariant value(const QString &key, const QVariant &defaultValue = QVariant());

private:
    bb::data::JsonDataAccess jda;
    QVariantMap settings;
};

#endif /* CONSOLEDEBUGSETTINGS_H_ */
