import QtQuick 2.15
import QtLocation
import QtPositioning

Rectangle
{
    id:window

    property double latitude: -6.313465349245249
    property double longitude: 112.72720018600343

    property Component locationmarker: locmarker
    Plugin
    {
        id:mapPlugin
        name:"osm"
    }
    Map
    {
        id:mapview
        anchors.fill: parent
        plugin: mapPlugin
        center: QtPositioning.coordinate(latitude,longitude)
        zoomLevel: 20
    }

    function on_setCenterPosition(lati, longi)
    {
        mapview.pan(latitude-lati,longitude-longi)
        latitude = lati
        longitude = longi
    }
    function on_setLocationMarking(lati, longi)
    {
        var item = locationmarker.createObject(window, {
                                               coordinate:QtPositioning.coordinate(lati, longi)
                                               })
        mapview.addMapItem(item)
    }
    Component
    {
        id:locmarker
        MapQuickItem
        {
            id:markerImg
            anchorPoint.x: image.width/4
            anchorPoint.y: image.height
            coordinate: position
            sourceItem: Image {
                id: image
                width: 20
                height: 20
                source: "https://www.pngarts.com/files/3/Map-Marker-Pin-PNG-Image-Background.png"
            }
        }
    }
}
