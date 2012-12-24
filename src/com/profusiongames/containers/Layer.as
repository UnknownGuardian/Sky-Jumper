package com.profusiongames.containers 
{
	import starling.display.Sprite;
	
	/**
	 * ...
	 * @author UnknownGuardian
	 */
	public class Layer extends Sprite 
	{
		private var _scrollScale:int = 1;
		public function Layer(scrollScale:int = 1) 
		{
			_scrollScale = scrollScale;
		}
		
		public function get scrollScale():int 
		{
			return _scrollScale;
		}
		
		public function changeScreenToRelativeCoordinates(s:Sprite):void
		{
			//s.y -= y/scrollScale;
		}
	}

}