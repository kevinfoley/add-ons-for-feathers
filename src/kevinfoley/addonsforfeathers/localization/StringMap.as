/*
2017 Kevin Foley. All Rights Reserved.
This program is free software. You can redistribute and/or modify it in accordance with the terms of the accompanying 
license agreement.
*/

package kevinfoley.addonsforfeathers.localization {
	import flash.utils.Dictionary;
	import kevinfoley.addonsforfeathers.localization.IStringMap;
	
	/**
	 * Wraps a Dictionary to manage a collection of Strings
	 * @author Kevin Foley
	 */
	public class StringMap implements IStringMap {
		
		/** An optional placeholder string to return in place of missing strings
		 * @see #retrieve()
		 * */
		public var placeholder:String = "{{missing string}}";
		
		private var dict:Dictionary;
		private var _name:String;
		
		/**
		 * Create a new intance of StringMap
		 * @param	name (optional) The name of this StringMap
		 */
		public function StringMap(name:String = null) {
			this._name = name;
			
			clear();
		}
		
		/**
		 * Add the given key and value to the mapping
		 * @param	key		A key used to retrieve the String
		 * @param	value	A String we will want to retrieve later
		 */
		public function add(key:String, value:String):void {
			dict[key] = value;
		}
		
		/**
		 * Retrieve the String for the given key
		 * @param	key				The key of the String to retrieve
		 * @param	allCaps			If true, we will call toLocaleUpperCase() on the String before returning it
		 * @param	errorOnMissing	If true, we will throw an error if the key is not present in the mapping. If false,
		 * we will return <code>placeholder</code>
		 * @see		placeholder
		 */
		public function retrieve(key:String, allCaps:Boolean = false, errorOnMissing:Boolean = false):String {
			var value:String = dict[key];
			if (value == null) {
				if (errorOnMissing) {
					throw new Error("Couldn't find a string with key " + key);
				} else {
					value = placeholder;
				}
			}
			if (allCaps && value != null) {
				value = value.toLocaleUpperCase();
			}
			return value;
		}
		
		/**
		 * Remove the given key from the mapping, if present
		 * @param	key
		 */
		public function remove(key:String):void {
			delete dict[key];
		}
		
		/**
		 * Clear all keys and values from the mapping
		 */
		public function clear():void {
			dict = new Dictionary();
		}
		
		public function get name():String {
			return _name;
		}
		
	}

}