/*
 * BitLyManager.h
 *
 *  Created on: 2014-10-24
 *      Author: Roger
 */

#ifndef BITLYMANAGER_H_
#define BITLYMANAGER_H_

#include "src/Commons.h"

#include <QObject>
#include <QUrl>
#include <QVariant>
#include <QtNetwork/QNetworkAccessManager>
#include <QtNetwork/QNetworkReply>
#include <QtNetwork/QNetworkRequest>
#include <bb/data/JsonDataAccess>

class BitlyManager : public QObject{
    Q_OBJECT
    Q_PROPERTY(QString shortenUrl READ getShortenUrl WRITE setShortenUrl NOTIFY shortenUrlChanged);
    Q_PROPERTY(QString expandedUrl READ getExpandedUrl WRITE setExpandedUrl NOTIFY expandedUrlChanged);
    Q_PROPERTY(bool urlValid READ getUrlValid WRITE setUrlValid NOTIFY urlValidChanged);

public:
    BitlyManager();
    virtual ~BitlyManager();

    Q_INVOKABLE void sendRequest(const QString& url, const QString& type);
    Q_INVOKABLE void setShortenUrl(const QString& url);
    Q_INVOKABLE void setExpandedUrl(const QString& url);
    Q_INVOKABLE void setUrlValid(const bool& valid);

private slots:
    void proccessReply(QNetworkReply* p_Reply);

private:
    QString getShortenUrl() { return m_shortenUrl; }
    QString getExpandedUrl() { return m_expandedUrl; }
    bool getUrlValid() { return m_urlValid; }

    QNetworkAccessManager *m_NetworkManager;

    bb::data::JsonDataAccess m_JsonHandler;
    QString m_requestType;

    QString m_shortenUrl;
    QString m_expandedUrl;
    bool m_urlValid;

signals:
    void shortenUrlChanged();
    void expandedUrlChanged();
    void urlValidChanged();
};

#endif /* BITLYMANAGER_H_ */
