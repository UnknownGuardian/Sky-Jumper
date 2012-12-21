package com.profusiongames.states 
{
	import com.profusiongames.beings.Player;
	import com.profusiongames.containers.ScrollingContainer;
	import com.profusiongames.platforms.CloudPlatform;
	import com.profusiongames.platforms.Platform;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import org.flashdevelop.utils.FlashConnect;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	/**
	 * ...
	 * @author UnknownGuardian
	 */
	public class Game extends State
	{
		private var _player:Player = new Player();
		private var _scrollingContainer:ScrollingContainer = new ScrollingContainer();
		private var _platformList:Vector.<Platform> = new Vector.<Platform>();
		private var _platformsToCreate:int = 0;
		private var _minPlatformDensity:int = 50;
		private var _platformDensity:int = 250;
		private var _minHeightToGeneratePlatforms:int = -150; //what height to stop generating platforms at.
		private var _mouseX:Number = 0;
		private var _mouseY:Number = 0;
		public function Game() 
		{
			addChild(_scrollingContainer);
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.ENTER_FRAME, frame);
			stage.addEventListener(TouchEvent.TOUCH, onTouch);
			generateInitialPlatforms();
			_scrollingContainer.addChild(_player);
		}
		
		private function generateInitialPlatforms():void 
		{
			var h:int = Main.HEIGHT;
			
			//start from the bottom and generate up, ending 150 px above the player
			while (h > _minHeightToGeneratePlatforms)
			{
				h -= Math.random() * _platformDensity + _minPlatformDensity;
				FlashConnect.atrace(h);
				generatePlatformAt(h);
				var p:CloudPlatform = generatePlatformAt(h);
				_scrollingContainer.addChild(p);
				_platformList.push(p);
			}
		}
		
		private function generatePlatformAt(h:int):CloudPlatform 
		{
			var p:CloudPlatform = new CloudPlatform();
			p.x = Math.random() * 500 - 250;
			p.y = h;
			return p;
		}
		
		private function onTouch(e:TouchEvent):void 
		{
			var touch:Touch = e.getTouch(stage);
			var mp:Point = touch.getLocation(_scrollingContainer);
			if (touch)
			{
				_mouseX = mp.x;//touch.globalX;// +_scrollingContainer.x;
				_mouseY = mp.y;// touch.globalY;// +_scrollingContainer.y;
				//FlashConnect.atrace(_mouseX, _mouseY);
				if(touch.phase == TouchPhase.BEGAN)
				{
					
				}
				else if(touch.phase == TouchPhase.ENDED)
				{
					_player.bounce(5);
				}
				else if(touch.phase == TouchPhase.MOVED)
				{
					
				}
			}
		}
		
		private function frame(e:Event):void 
		{
			checkForPlatformsToBeRemoved();
			addPlatforms();
			_player.moveHorizontallyTowards(_mouseX);
			_player.frame();
			checkForPlatformCollision();
			_scrollingContainer.centerOn(_player);
		}
		
		private function addPlatforms():void
		{
			/*for (var i:int = 0; i < _platformsToCreate; i++)
			{
				var h:int = _platformList[_platformList.length - 1].y;
				while (h < _minHeightToGeneratePlatforms)
				{
					
				}
				generatePlatformAt(h);
				var p:CloudPlatform = generatePlatformAt(h);
				_scrollingContainer.addChild(p);
				_platformList.push(p);
			}
			_platformsToCreate = 0;*/
			FlashConnect.atrace(_platformList.length);
			if (_platformList.length == 0)
				return;
			
			var highest:int = _platformList[_platformList.length - 1].y;
			while (highest > _player.y - Main.HEIGHT/2 + _minHeightToGeneratePlatforms)
			{
				highest -= Math.random() * _platformDensity  + _minPlatformDensity;;
				var p:CloudPlatform  = generatePlatformAt(highest);
				_scrollingContainer.addChild(p);
				_platformList.push(p);
			}
			
			
		}
		
		private function checkForPlatformCollision():void 
		{
			if (_player.isFalling)
			{
				var playerBounds:Rectangle = _player.getBounds(_scrollingContainer);
				var platform:Platform;
				for (var i:int = 0; i < _platformList.length; i++)
				{
					platform = _platformList[i];
					var platformBounds:Rectangle = platform.getBounds(_scrollingContainer);
					if (playerBounds.intersects(platformBounds))
					{
						_player.bounce(platform.bouncePower);
						//FlashConnect.atrace("collision");
					}
				}
			}
		}
		
		private function checkForPlatformsToBeRemoved():void 
		{
			var xClipMin:int = -500 + _player.x;
			var xClipMax:int = 500 +  _player.x;
			var yClipMin:int = -600 +  _player.y;
			var yClipMax:int = 600 +  _player.y;
			var platform:Platform;
			for (var i:int = 0; i < _platformList.length; i++)
			{
				platform = _platformList[i];
				var xPos:int = platform.x;
				var yPos:int = platform.y;
				FlashConnect.atrace(xPos, yPos, yClipMin, yClipMax);
				if (xPos > xClipMax || xPos < xClipMin || yPos < yClipMin || yPos > yClipMax)
				{
					FlashConnect.atrace("kill");
					_scrollingContainer.removeChild(platform);
					platform.dispose();
					_platformList.splice(i, 1);
					i--;
					_platformsToCreate++;
				}
			}
		}
		
	}

}