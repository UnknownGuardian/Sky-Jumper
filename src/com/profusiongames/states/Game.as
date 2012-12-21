package com.profusiongames.states 
{
	import com.profusiongames.beings.Player;
	import com.profusiongames.containers.ScrollingContainer;
	import com.profusiongames.platforms.CloudPlatform;
	import com.profusiongames.platforms.Platform;
	import flash.geom.Rectangle;
	import org.flashdevelop.utils.FlashConnect;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author UnknownGuardian
	 */
	public class Game extends State
	{
		private var _player:Player = new Player();
		private var _cloud:CloudPlatform = new CloudPlatform();
		private var _scrollingContainer:ScrollingContainer = new ScrollingContainer();
		private var _platformList:Vector.<Platform> = new Vector.<Platform>();
		public function Game() 
		{
			addChild(_scrollingContainer);
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.ENTER_FRAME, frame);
			
			_scrollingContainer.addChild(_player);
			_platformList.push(_cloud);
			_scrollingContainer.addChild(_cloud);
		}
		
		private function frame(e:Event):void 
		{
			_player.frame();
			checkForPlatformCollision();
			_scrollingContainer.centerOn(_player);
			
		}
		
		private function checkForPlatformCollision():void 
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
					FlashConnect.atrace("collision");
				}
			}
		}
		
	}

}