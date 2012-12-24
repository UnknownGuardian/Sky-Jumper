package com.profusiongames.platforms 
{
	import starling.display.Sprite;
	/**
	 * ...
	 * @author UnknownGuardian
	 */
	public class Platform extends Sprite
	{
		private var _bouncePower:Number = 12;
		public function Platform() 
		{
			
		}
		
		public function get bouncePower():Number 
		{
			return _bouncePower;
		}
		
		public function set bouncePower(value:Number):void 
		{
			_bouncePower = value;
		}
		
	}

}