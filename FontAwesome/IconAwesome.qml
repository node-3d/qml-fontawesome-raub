import FontAwesome

/**
 * IconAwesome can show any FontAwesome icon and switch between them.
 *
 * While it is possible to use `Text {}` to show any icon, changing them on runtime
 * may cause **Qt font exceptions**. That is because different icons have
 * different `font.weight` and `font.family` values. This component takes care of that.
 */
 
Item {
	id: _root
	
	property var name: ""
	property int size: 18
	property color color: "white"
	property color styleColor: "#88000000"
	property int style: Text.Outline
	
	width: size
	height: size
	
	property int _pointSize: Math.ceil(_root.size * 0.75)
	
	Text {
		id: _regular
		anchors.centerIn: parent
		font.pointSize: _root._pointSize
		visible: FontAwesome.getFamily(_root.name) === FontAwesome.fonts.regular.family
		font.family: FontAwesome.fonts.regular.family
		font.weight: FontAwesome.fonts.regular.weight
		text: {
			if (FontAwesome.getFamily(_root.name) !== FontAwesome.fonts.regular.family) {
				return "";
			}
			return FontAwesome.getText(name);
		}
		color: _root.color
		styleColor: _root.styleColor
		style: _root.style
	}
	
	Text {
		id: _solid
		anchors.centerIn: parent
		font.pointSize: _root._pointSize
		visible: FontAwesome.getFamily(_root.name) === FontAwesome.fonts.solid.family
		font.family: FontAwesome.fonts.solid.family
		font.weight: FontAwesome.fonts.solid.weight
		text: {
			if (FontAwesome.getFamily(_root.name) !== FontAwesome.fonts.solid.family) {
				return "";
			}
			return FontAwesome.getText(name);
		}
		color: _root.color
		styleColor: _root.styleColor
		style: _root.style
	}
	
	Text {
		id: _brands
		anchors.centerIn: parent
		font.pointSize: _root._pointSize
		visible: FontAwesome.getFamily(_root.name) === FontAwesome.fonts.brands.family
		font.family: FontAwesome.fonts.brands.family
		font.weight: FontAwesome.fonts.brands.weight
		text: {
			if (FontAwesome.getFamily(_root.name) !== FontAwesome.fonts.brands.family) {
				return "";
			}
			return FontAwesome.getText(name);
		}
		color: _root.color
		styleColor: _root.styleColor
		style: _root.style
	}
}
