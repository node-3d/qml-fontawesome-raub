pragma Singleton

import "icons.js" as Icons
import "webfonts/icons.js" as Data


Item {
	property var _styles: Icons.categorize(Data.icons)
	
	property var icons: Icons.getAll(_styles)
	property var list: Icons.getList(_styles)
	property var listUnique: Icons.getUnique(_styles)
	
	FontLoader {
		id: _brands
		source: "./webfonts/Font Awesome 6 Brands-Regular-400.otf"
	}
	
	FontLoader {
		id: _regular
		source: "./webfonts/Font Awesome 6 Free-Regular-400.otf"
	}
	
	FontLoader {
		id: _solid
		source: "./webfonts/Font Awesome 6 Free-Solid-900.otf"
	}
	
	property var fonts: ({
		regular: {
			family: _regular.name,
			weight: Font.Normal,
		},
		solid: {
			family: _solid.name,
			weight: Font.Black,
		},
		brands: {
			family: _brands.name,
			weight: Font.Normal,
		},
	})
	
	function getFamily(name) {
		return Icons.getFamily(_styles, name, _solid.name, _regular.name, _brands.name);
	}
	
	function getWeight(name) {
		return Icons.getWeight(_styles, name);
	}
	
	function getText(name) {
		return Icons.getCode(_styles, name);
	}
}
