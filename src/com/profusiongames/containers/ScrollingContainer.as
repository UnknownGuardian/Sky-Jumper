package com.profusiongames.containers 
{
	import starling.display.Sprite;
	
	/**
	 * ...
	 * @author UnknownGuardian
	 */
	public class ScrollingContainer extends Sprite 
	{
		
		public function ScrollingContainer() 
		{
			
		}
		
		public function centerOn(s:Sprite):void
		{
			x = -s.x + 500 / 2;
			y = -s.y + 600 / 2;
		}
		
	}

}