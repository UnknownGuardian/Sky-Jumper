package com.profusiongames.windows 
{
	import starling.display.Button;
	import starling.textures.Texture;
	/**
	 * ...
	 * @author UnknownGuardian
	 */
	public class UpgradeButton extends Button
	{
		[Embed(source = "../../../../lib/Graphics/menus/upgrades menu/Button.png")]private var _button:Class;
		public function UpgradeButton() 
		{
			super(Texture.fromBitmap(new _button()));
		}
		
	}

}