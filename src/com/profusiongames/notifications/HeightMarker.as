package com.profusiongames.notifications 
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author UnknownGuardian
	 */
	public class HeightMarker extends Sprite 
	{
		[Embed(source = "../../../../lib/Graphics/notifications/height_marker.png")]private var _marker:Class;
		private var _image:Image;
		public function HeightMarker() 
		{
			_image = new Image(Texture.fromBitmap(new _marker()));
			addChild(_image);
			pivotY = int(height / 2);
		}
		
	}

}