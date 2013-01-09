package com.profusiongames.beings 
{
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	/**
	 * ...
	 * @author UnknownGuardian
	 */
	public class Spike extends Enemy 
	{
		[Embed(source = "../../../../lib/Graphics/char/boy_frames.png")]private var _animTexture:Class;
		[Embed(source = "../../../../lib/Graphics/char/boy_frames.xml", mimeType = "application/octet-stream")]private var _animXML:Class;
		private var _animation:MovieClip;
		public function Spike() 
		{
			var texture:Texture = Texture.fromBitmap(new _animTexture());
			var xmlData:XML = XML(new _animXML());
			var textureAtlas:TextureAtlas = new TextureAtlas(texture, xmlData);
			_animation = new MovieClip(textureAtlas.getTextures("mine_"), 20);
			_animation.play();
			addChild(_animation);
			Starling.juggler.add(_animation);
			
			bouncePower = -10;
			_widthShrink = 10;
			_heightShrink = 10;
		}
		override public function frame():void
		{
			super.frame();
			move();
		}
		
		private function move():void 
		{
			
		}
	}

}