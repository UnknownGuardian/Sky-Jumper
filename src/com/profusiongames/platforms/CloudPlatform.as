package com.profusiongames.platforms 
{
	import starling.display.Image;
	import starling.textures.Texture;
	/**
	 * ...
	 * @author UnknownGuardian
	 */
	public class CloudPlatform extends Platform 
	{
		[Embed(source = "../../../../lib/Graphics/cloud.png")]private var _cloud:Class;
		private var _image:Image;
		public function CloudPlatform() 
		{
			_image = new Image(Texture.fromBitmap(new _cloud()));
			addChild(_image);
		}
		
	}

}