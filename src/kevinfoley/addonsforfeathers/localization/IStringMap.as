/*
2017 Kevin Foley. All Rights Reserved.
This program is free software. You can redistribute and/or modify it in accordance with the terms of the accompanying 
license agreement.
*/

package kevinfoley.addonsforfeathers.localization {
	
	/**
	 * ...
	 * @author Kevin Foley
	 */
	public interface IStringMap {
		
		function add(key:String, value:String):void;
		
		function retrieve(key:String, allCaps:Boolean = false, errorOnMissing:Boolean = false):String;
		
		function remove(key:String):void;
		
		function clear():void;
	}
	
}