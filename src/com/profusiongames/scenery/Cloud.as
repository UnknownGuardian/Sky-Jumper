package com.profusiongames.scenery 
{
	import starling.display.Image;
	import starling.textures.Texture;
	/**
	 * ...
	 * @author UnknownGuardian
	 */
	public class Cloud extends Scenery
	{
		//[Embed(source = "../../../../lib/Graphics/cloud.png")]private var _cloud:Class;
		[Embed(source="../../../../lib/Graphics/cloud_side_shadow.png")]private var _cloud:Class;
		private var _image:Image;
		public function Cloud() 
		{
			_image = new Image(Texture.fromBitmap(new _cloud()));
			addChild(_image);
			pivotX = _image.width / 2;
		}
		
	}

}