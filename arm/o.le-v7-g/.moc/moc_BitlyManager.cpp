/****************************************************************************
** Meta object code from reading C++ file 'BitlyManager.h'
**
** Created by: The Qt Meta Object Compiler version 63 (Qt 4.8.6)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../src/BitlyManager/BitlyManager.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'BitlyManager.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.6. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_BitlyManager[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       8,   14, // methods
       3,   54, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       3,       // signalCount

 // signals: signature, parameters, type, tag, flags
      14,   13,   13,   13, 0x05,
      34,   13,   13,   13, 0x05,
      55,   13,   13,   13, 0x05,

 // slots: signature, parameters, type, tag, flags
      81,   73,   13,   13, 0x08,

 // methods: signature, parameters, type, tag, flags
     120,  111,   13,   13, 0x02,
     153,  149,   13,   13, 0x02,
     176,  149,   13,   13, 0x02,
     206,  200,   13,   13, 0x02,

 // properties: name, type, flags
     232,  224, 0x0a495103,
     243,  224, 0x0a495103,
     260,  255, 0x01495103,

 // properties: notify_signal_id
       0,
       1,
       2,

       0        // eod
};

static const char qt_meta_stringdata_BitlyManager[] = {
    "BitlyManager\0\0shortenUrlChanged()\0"
    "expandedUrlChanged()\0urlValidChanged()\0"
    "p_Reply\0proccessReply(QNetworkReply*)\0"
    "url,type\0sendRequest(QString,QString)\0"
    "url\0setShortenUrl(QString)\0"
    "setExpandedUrl(QString)\0valid\0"
    "setUrlValid(bool)\0QString\0shortenUrl\0"
    "expandedUrl\0bool\0urlValid\0"
};

void BitlyManager::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        BitlyManager *_t = static_cast<BitlyManager *>(_o);
        switch (_id) {
        case 0: _t->shortenUrlChanged(); break;
        case 1: _t->expandedUrlChanged(); break;
        case 2: _t->urlValidChanged(); break;
        case 3: _t->proccessReply((*reinterpret_cast< QNetworkReply*(*)>(_a[1]))); break;
        case 4: _t->sendRequest((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2]))); break;
        case 5: _t->setShortenUrl((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 6: _t->setExpandedUrl((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 7: _t->setUrlValid((*reinterpret_cast< const bool(*)>(_a[1]))); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData BitlyManager::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject BitlyManager::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_BitlyManager,
      qt_meta_data_BitlyManager, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &BitlyManager::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *BitlyManager::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *BitlyManager::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_BitlyManager))
        return static_cast<void*>(const_cast< BitlyManager*>(this));
    return QObject::qt_metacast(_clname);
}

int BitlyManager::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 8)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 8;
    }
#ifndef QT_NO_PROPERTIES
      else if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QString*>(_v) = getShortenUrl(); break;
        case 1: *reinterpret_cast< QString*>(_v) = getExpandedUrl(); break;
        case 2: *reinterpret_cast< bool*>(_v) = getUrlValid(); break;
        }
        _id -= 3;
    } else if (_c == QMetaObject::WriteProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: setShortenUrl(*reinterpret_cast< QString*>(_v)); break;
        case 1: setExpandedUrl(*reinterpret_cast< QString*>(_v)); break;
        case 2: setUrlValid(*reinterpret_cast< bool*>(_v)); break;
        }
        _id -= 3;
    } else if (_c == QMetaObject::ResetProperty) {
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 3;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void BitlyManager::shortenUrlChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, 0);
}

// SIGNAL 1
void BitlyManager::expandedUrlChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, 0);
}

// SIGNAL 2
void BitlyManager::urlValidChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, 0);
}
QT_END_MOC_NAMESPACE
