/*
 * BitLyManager.cpp
 *
 *  Created on: 2014-10-24
 *      Author: Roger
 */

#include <src/BitlyManager/BitlyManager.h>

BitlyManager::BitlyManager() :
    QObject(),
    m_NetworkManager(new QNetworkAccessManager())
{
    setShortenUrl("");
    setExpandedUrl("");
    setUrlValid(true);
}

BitlyManager::~BitlyManager() {
    m_NetworkManager->deleteLater();
}

void BitlyManager::sendRequest(const QString& url, const QString& type) {
    qDebug() << "BitlyManager::sendRequest() :" << url << type;

    QString requestUrl;
    m_requestType = type;

    if (type == "Shorten")
        requestUrl = ("%1%2" + url + "%3").arg(BITLY_API_URL, BITLY_SHORTEN_STRING, BITLY_ACCESSTOKEN_STRING);
    else
        requestUrl = ("%1%2" + url + "%3").arg(BITLY_API_URL, BITLY_EXPAND_STRING, BITLY_ACCESSTOKEN_STRING);

    qDebug() << "requestUrl :" << requestUrl;

    QNetworkRequest myRequest = QNetworkRequest(QUrl(requestUrl));
    m_NetworkManager->get(myRequest);
    QObject::connect(m_NetworkManager, SIGNAL(finished(QNetworkReply*)), SLOT(proccessReply(QNetworkReply*)));
}

void BitlyManager::proccessReply(QNetworkReply* p_Reply){
    qDebug() << "BitlyManager::processReply()";

    QVariant jsonReply = m_JsonHandler.loadFromBuffer(p_Reply->readAll());

    if (m_requestType== "Shorten") {
        QString url = jsonReply.toMap()["data"].toMap()["url"].toString();
        setShortenUrl(url);
        if (url.isEmpty())
            setUrlValid(false);
    }
    else if (m_requestType == "Expand"){
        QString url = jsonReply.toMap()["data"].toMap()["expand"].toList().first().toMap()["long_url"].toString();
        setExpandedUrl(url);
        if (url.isEmpty())
            setUrlValid(false);
    }

    m_requestType.clear();
}

void BitlyManager::setShortenUrl(const QString& url) {
    qDebug() << "BitlyManager::setShortenUrl() : " << url;

    if (m_shortenUrl != url) {
        m_shortenUrl = url;
        emit shortenUrlChanged();
    }
}

void BitlyManager::setExpandedUrl(const QString& url) {
    qDebug() << "BitlyManager::setExpandedUrl() : " << url;

    if (m_expandedUrl != url) {
        m_expandedUrl = url;
        emit expandedUrlChanged();
    }
}

void BitlyManager::setUrlValid(const bool& valid) {
    qDebug() << "BitlyManager::setUrlValid() : " << valid;

    if (m_urlValid != valid) {
        m_urlValid = valid;
        emit urlValidChanged();
    }
}
