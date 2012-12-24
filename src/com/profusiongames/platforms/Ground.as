package com.profusiongames.platforms 
{
	import starling.display.Image;
	import starling.textures.Texture;
	/**
	 * ...
	 * @author UnknownGuardian
	 */
	public class Ground extends Platform 
	{
		[Embed(source = "../../../../lib/Graphics/Platforms/ground level/ground.png")]private var _ground:Class;
		private var _image:Image;
		public function Ground() 
		{
			_image = new Image(Texture.fromBitmap(new _ground()));
			addChild(_image);
		}
		
	}

}