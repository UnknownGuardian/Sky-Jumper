package com.profusiongames.util 
{
	import flash.text.Font;
	/**
	 * ...
	 * @author UnknownGuardian
	 */
	public class FontUtil 
	{
		[Embed(source = "../../../../lib/Fonts/SF_Cartoonist/SF_Cartoonist_Hand.ttf", embedAsCFF="false", mimeType="application/x-font", fontFamily="Cartoonist")]private static var CartoonistFont:Class;
		public function FontUtil() 
		{
			
		}
		
		public static function init():void
		{
			var a:Font = new CartoonistFont();
			
		}
		
	}

}