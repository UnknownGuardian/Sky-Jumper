package com.profusiongames.states 
{
	import com.profusiongames.beings.Player;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author UnknownGuardian
	 */
	public class Game extends State
	{
		private var _player:Player = new Player();
		public function Game() 
		{
			addChild(_player);
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(Event.ENTER_FRAME, frame);
		}
		
		private function frame(e:Event):void 
		{
			_player.frame();
		}
		
	}

}