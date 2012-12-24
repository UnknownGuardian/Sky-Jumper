package com.profusiongames.platforms 
{
	import starling.display.Image;
	import starling.textures.Texture;
	/**
	 * ...
	 * @author UnknownGuardian
	 */
	public class GroundPlatform extends Platform 
	{
		[Embed(source="../../../../lib/Graphics/Platforms/ground level/ground_tile_big.png")]private var _ground:Class;
		private var _image:Image;
		public function GroundPlatform() 
		{
			_image = new Image(Texture.fromBitmap(new _ground()));
			addChild(_image);
			pivotX = _image.width / 2;
		}
		
	}

}