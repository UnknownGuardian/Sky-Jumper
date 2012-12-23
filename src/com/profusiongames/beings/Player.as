package com.profusiongames.beings 
{
	import com.profusiongames.util.Vector2D;
	import flash.display.Bitmap;
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
		private var _animation:MovieClip;
		private var _animationForward:MovieClip;
		private var _animationLeft:MovieClip;
		private var _animationRight:MovieClip;
		private var _animationBack:MovieClip;
		private var _speed:Vector2D;
		public static var GRAVITY:Number = 0.2;
		private var _maxYSpeed:Number = 30; //going down
		private var _minYSpeed:Number = -30; //going up
		private var _maxXSpeed:Number = 5;
		
		//for scaling/spinning when traveling
		private var _spinSpeed:Number = 0;
		private var _scaleIncrease:Boolean = false;
		
		public function Player() 
		{			
			var texture:Texture = Texture.fromBitmap(new _animTexture());
			var xmlData:XML = XML(new _animXML());
			var textureAtlas:TextureAtlas = new TextureAtlas(texture, xmlData);
			_animation = new MovieClip(textureAtlas.getTextures("boy_"), 20);
			_animationForward = new MovieClip(textureAtlas.getTextures("boy_forward_"), 20);
			_animationLeft = new MovieClip(textureAtlas.getTextures("boy_left_"), 20);
			_animationRight = new MovieClip(textureAtlas.getTextures("boy_right_"), 20);
			_animationBack = new MovieClip(textureAtlas.getTextures("boy_back_"), 20);
			//addChild(_animation);
			addChild(_animationForward);
			
			//Starling.juggler.add(_animation);
			Starling.juggler.add(_animationForward);
			
			x = 200;
			y = 300;
			pivotX = _animation.width / 2;
			pivotY = _animation.height / 2;
			_speed = new Vector2D(0, -2);
		}
		
		override public function frame():void
		{
			super.frame();
			move();
			scale();
		}
		
		private function scale():void 
		{
			_spinSpeed = Math.max(Math.abs(_speed.y) / 100,0.05);
			
			if (_scaleIncrease )
			{
				scaleX += _spinSpeed;
				
				if (scaleX >= 1)
				{
					_scaleIncrease = false;
					scaleX = 1;
				}
			}
			else
			{
				scaleX -= _spinSpeed;
				
				if (scaleX <= -1)
				{
					_scaleIncrease = true;
					scaleX = -1;
				}
			}
			FlashConnect.atrace("SpinSpeed: ", _spinSpeed, " ScaleX: ", scaleX, " Scale Increase: ", _scaleIncrease);
		}
		
		private function move():void 
		{
			if (_speed.y > _maxYSpeed)
				_speed.y = _maxYSpeed;
			else if (_speed.y < _minYSpeed)
				_speed.y = _minYSpeed;
			x += _speed.x;
			y += _speed.y;
			_speed.x *= 0.99;
			_speed.y += GRAVITY;
		}
		
		public function bounce(amount:Number):void
		{
			_speed.y -= amount;
		}
		
		public function get isFalling():Boolean
		{
			return _speed.y > 0;
		}
		
		public function moveHorizontallyTowards(xPos:Number):void
		{
			
			//x = xPos;
			if (xPos > x)
			{
				_speed.x = _maxXSpeed;
				if (xPos < x + _speed.x)
					_speed.x = xPos - x;
			}
			else
			{
				_speed.x = -_maxXSpeed;
				if (xPos > x + _speed.x)
					_speed.x = xPos - x;
			}
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