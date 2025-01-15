import QtQuick.Layouts
import QtQuick.Controls

Rectangle {
	id: _root
	anchors.fill: parent
	z: 999
	color: 'black'
	
	property var filtered: {
		const text = _filterInput.text;
		if (text.length < 2) {
			return FontAwesome.list;
		}
		return FontAwesome.list.filter(x => x.includes(text));
	}
	
	ColumnLayout {
		anchors.fill: parent
		anchors.margins: 15
		spacing: 20
		
		RowLayout {
			Layout.fillWidth: true
			Layout.minimumHeight: 42
			Layout.maximumHeight: 42
			
			spacing: 10
			Text {
				text: 'Filter:'
				color: 'white'
				font.pixelSize: 18
			}
			Rectangle {
				Layout.fillWidth: true
				Layout.fillHeight: true
				color: 'white'
				border.color: "grey"
				border.width: 2
				radius: 4
				
				TextInput {
					id: _filterInput
					anchors.fill: parent
					padding: 10
					text: ''
					font.pixelSize: 18
					color: 'black'
				}
			}
		}
		
		ScrollView {
			Layout.fillWidth: true
			Layout.fillHeight: true
			
			ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
			ScrollBar.vertical.policy: ScrollBar.AlwaysOn
			
			GridLayout {
				width: parent.width
				columnSpacing: 6
				rowSpacing: 6
				columns: Math.floor((_root.width - 30 - 6) / (32 + 6))
				Repeater {
					model: _root.filtered
					
					delegate: Rectangle {
						id: _item
						required property string modelData
						
						width: 32
						height: 32
						color: "#333"
						radius: 4
						
						MouseArea {
							id: mouse
							anchors.fill: parent
							onPressed: {
								console.log(_item.modelData)
							}
						}
						
						IconAwesome {
							name: _item.modelData
							size: 20
							anchors.centerIn: parent
							color: '#EEDDFF'
						}
					}
				}
			}
		}
	}
}
