package com.profusiongames.items 
{
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	/**
	 * ...
	 * @author UnknownGuardian
	 */
	public class SilverCoin extends Coin 
	{
		[Embed(source = "../../../../lib/Graphics/char/boy_frames.png")]private var _animTexture:Class;
		[Embed(source = "../../../../lib/Graphics/char/boy_frames.xml", mimeType = "application/octet-stream")]private var _animXML:Class;
		private var _animation:MovieClip;
		public function SilverCoin() 
		{
			var texture:Texture = Texture.fromBitmap(new _animTexture());
			var xmlData:XML = XML(new _animXML());
			var textureAtlas:TextureAtlas = new TextureAtlas(texture, xmlData);
			_animation = new MovieClip(textureAtlas.getTextures("silver_coin"), 30);
			_animation.play();
			addChild(_animation);
			Starling.juggler.add(_animation);
			pivotX = int(_animation.width / 2);
			pivotY = int(_animation.height / 2);
			
			monetaryValue = 3;
		}
		
	}

}