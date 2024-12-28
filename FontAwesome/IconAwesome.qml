import FontAwesome

/**
 * IconAwesome can show any FontAwesome icon and switch between them.
 *
 * While it is possible to use `Text {}` to show any icon, changing them on runtime
 * may cause **Qt font exceptions**. That is because different icons have
 * different `font.weight` and `font.family` values. This component takes care of that.
 */
 
Item {
	property var name: ""
	property int size: 18
	property color color: "white"
	property color styleColor: "#88000000"
	property int style: Text.Outline
	
	width: size
	height: size
	
	function _patch(key, value) {
		for (let i = 0; i < _mdl.count; i++) {
			const item = _mdl.get(i);
			item[key] = value;
		}
	}
	
	// Font independent props are patched in-place.
	onSizeChanged: _patch("size", size)
	onColorChanged: _patch("color", color)
	onStyleColorChanged: _patch("styleColor", styleColor)
	onStyleChanged: _patch("style", style)
	
	// Changing `name` will spawn a new `Text` for the new icon.
	// This prevents unhandled font exceptions.
	onNameChanged: {
		let isFound = false;
		for (let i = 0; i < _mdl.count; i++) {
			const item = _mdl.get(i);
			item.visible = item.name === name;
			
			if (item.visible) {
				isFound = true;
			}
		}
		
		if (isFound || !name) {
			return;
		}
		
		const family = FontAwesome.getFamily(name);
		const weight = FontAwesome.getWeight(name);
		const text = FontAwesome.getText(name);
		
		if (!text) {
			console.log("FontAwesome icon missing:", "'" + name + "'");
			return;
		}
		
		_mdl.append({
			visible: true,
			name: name,
			family, weight, text,
			color, styleColor, style,
		});
	}
	
	Repeater {
		model: ListModel { id: _mdl }
		delegate: Text {
			anchors.centerIn: parent
			font.pointSize: Math.ceil(size * 0.75)
			visible: model.visible
			font.family: model.family
			font.weight: model.weight
			text: model.text
			color: model.color
			styleColor: model.styleColor
			style: model.style
		}
	}
}
