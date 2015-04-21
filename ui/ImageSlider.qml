import QtQuick 2.4
import Qt.labs.folderlistmodel 2.1

Item {
    property alias source: image.source
    property int imageIndex: 0
    property alias folder: model.folder

    signal rollback()

    Image{
        id: image
        anchors.fill: parent
    }

    FolderListModel{
        id: model
        showDirs: false
        nameFilters: ["*.png", "*.jpg"]

        onCountChanged: image.source = folder + get(imageIndex, "fileName");
    }

    function gotoNext(){
        imageIndex++;
        if (imageIndex >= model.count) {
            rollback();
            imageIndex = 0;
        }
        image.source = folder + model.get(imageIndex, "fileName");
    }
}
