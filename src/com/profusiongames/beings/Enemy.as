package com.profusiongames.beings 
{
	import com.profusiongames.notifications.EnemySign;
	/**
	 * ...
	 * @author UnknownGuardian
	 */
	public class Enemy extends Being 
	{
		public var bouncePower:Number = 10;
		public var warning:EnemySign = new EnemySign();
		public function Enemy() 
		{
			
		}
		
		
		override public function dispose():void
		{
			warning.dispose();
			if (warning.parent) 
				warning.parent.removeChild(warning);
			super.dispose();
		}
	}

}