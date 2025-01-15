import QtQuick.Layouts
import FontAwesome


Rectangle {
	id: _root
	anchors.fill: parent
	
	function _shuffleArray(array) {
		const result = array.slice();
		for (let i = result.length - 1; i >= 0; i--) {
			const j = Math.floor(Math.random() * (i + 1));
			[result[i], result[j]] = [result[j], result[i]];
		}
		return result;
	}
	
	color: "black"
	
	Rectangle {
		id: _game
		color: "grey"
		anchors.top: parent.top
		anchors.right: parent.right
		anchors.left: parent.left
		height: 72
		
		property bool _isRunning: false
		
		RowLayout {
			anchors.centerIn: parent
			spacing: 16
			Rectangle {
				id: _box1
				property int i: Math.round(Math.random() * FontAwesome.icons.length)
				property var shuffled: _root._shuffleArray(FontAwesome.list)
				color: "white"
				Layout.preferredWidth: 42
				Layout.preferredHeight: 42
				IconAwesome {
					style: Text.Normal
					anchors.centerIn: parent
					name: _box1.shuffled[_box1.i]
					color: "black"
				}
				
				Timer {
					interval: 120
					running: _game._isRunning
					repeat: true
					onTriggered: _box1.i = (_box1.i + 1) % FontAwesome.list.length
				}
			}
			Rectangle {
				id: _box2
				property int i: Math.round(Math.random() * FontAwesome.icons.length)
				property var shuffled: _root._shuffleArray(FontAwesome.list)
				color: "white"
				Layout.preferredWidth: 42
				Layout.preferredHeight: 42
				IconAwesome {
					style: Text.Normal
					anchors.centerIn: parent
					name: _box2.shuffled[_box2.i]
					color: "black"
				}
				
				Timer {
					interval: 140
					running: _game._isRunning
					repeat: true
					onTriggered: _box2.i = (_box2.i + 1) % FontAwesome.list.length
				}
			}
			Rectangle {
				id: _box3
				property int i: Math.round(Math.random() * FontAwesome.icons.length)
				property var shuffled: _root._shuffleArray(FontAwesome.list)
				color: "white"
				Layout.preferredWidth: 42
				Layout.preferredHeight: 42
				IconAwesome {
					style: Text.Normal
					anchors.centerIn: parent
					name: _box3.shuffled[_box3.i]
					color: "black"
				}
				
				Timer {
					interval: 100
					running: _game._isRunning
					repeat: true
					onTriggered: _box3.i = (_box3.i + 1) % FontAwesome.list.length
				}
			}
			Rectangle {
				Layout.preferredWidth: 42
				Layout.preferredHeight: 42
				
				color: _game._isRunning ? "red" : "green"
				radius: 21
				
				IconAwesome {
					anchors.centerIn: parent
					name: _game._isRunning ? "fa_stop" : "fa_play"
					color: "white"
				}
				MouseArea {
					anchors.fill: parent
					onPressed: {
						_game._isRunning = !_game._isRunning;
					}
				}
			}
		}
	}
	
	Rectangle {
		anchors.top: _game.bottom
		anchors.right: parent.right
		anchors.bottom: parent.bottom
		anchors.left: parent.left
		
		color: "yellow"
		
		IconAwesomeHelper {
		
		}
	}
}
