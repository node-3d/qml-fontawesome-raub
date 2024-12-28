import IconAwesome


Rectangle {
	id: _awesomeHelper
	anchors.fill: parent
	z: 999
	color: 'black'
	
	Component.onCompleted: {
		FontAwesome.list.forEach(name => {
			iconList.append({ name });
		});
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
					onTextChanged: {
						iconList.clear();
						FontAwesome.list.filter(x => x.includes(text)).forEach(name => {
							iconList.append({ name });
						});
					}
				}
			}
		}
		
		ScrollView {
			Layout.fillWidth: true
			Layout.fillHeight: true
			
			GridLayout {
				width: parent.width
				columnSpacing: 6
				rowSpacing: 6
				columns: Math.floor((_awesomeHelper.width - 30 - 6) / (32 + 6))
				Repeater {
					id: subbookView

					model: ListModel {
						id: iconList
					}

					delegate: Rectangle {
						width: 32
						height: 32
						color: "#333"
						radius: 4
						
						MouseArea {
							id: mouse
							anchors.fill: parent
							onPressed: {
								console.log(model.name)
							}
						}
						
						IconAwesome {
							name: model.name
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
