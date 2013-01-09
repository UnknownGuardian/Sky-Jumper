package com.profusiongames.items 
{
	import com.profusiongames.platforms.Platform;
	import starling.display.Image;
	import starling.textures.Texture;
	/**
	 * ...
	 * @author UnknownGuardian
	 */
	public class Coin extends Item 
	{
		[Embed(source="../../../../lib/Graphics/items/coin/coin.png")]private var _coin:Class;
		private var _image:Image;
		
		public function Coin() 
		{
			_image = new Image(Texture.fromBitmap(new _coin()));
			addChild(_image);
			pivotX = _image.width / 2;
			pivotY = _image.height / 2;
			
			monetaryValue = 1;
			isCollectable = true;
		}
	}

}