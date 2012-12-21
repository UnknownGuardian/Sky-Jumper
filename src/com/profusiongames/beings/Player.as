package com.profusiongames.beings 
{
	import flash.display.Bitmap;
	import fw.anim.AnimSprite;
	import fw.anim.AnimTextureSheet;
	import fw.anim.TileSheetHelper;
	import org.flashdevelop.utils.FlashConnect;
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	/**
	 * ...
	 * @author UnknownGuardian
	 */
	public class Player extends Being
	{
		[Embed(source = "../../../../lib/Graphics/char/boy_frames.png")]private var _animTexture:Class;
		[Embed(source = "../../../../lib/Graphics/char/boy_frames.xml", mimeType = "application/octet-stream")]private var _animXML:Class;
		private var animation:MovieClip;
		
		public function Player() 
		{			
			var texture:Texture = Texture.fromBitmap(new _animTexture());
			var xmlData:XML = XML(new _animXML());
			var textureAtlas:TextureAtlas = new TextureAtlas(texture, xmlData);
			animation = new MovieClip(textureAtlas.getTextures("boyf_"), 20);
			addChild(animation);
			Starling.juggler.add(animation);
			
			x = 200;
			y = 300;
		}
		
		override public function frame():void
		{
			super.frame();
		}
		
		
		private function createFrameArray(start:int = 0, count:int=0):Array
		{
			var arr:Array= []; // of int
			
			for (var j:int = start; j < count; j++) {
				arr.push(j);
			}
			FlashConnect.atrace(arr);
			return arr;
		}
	}

}