/*
2017 Kevin Foley. All Rights Reserved.
This program is free software. You can redistribute and/or modify it in accordance with the terms of the accompanying 
license agreement.
*/

package kevinfoley.addonsforfeathers.helpers {
	import feathers.data.ListCollection;
	import kevinfoley.addonsforfeathers.localization.IStringMap;
	import kevinfoley.addonsforfeathers.localization.StringMap;
	
	/**
	 * Provides static helper methods to create Button ListCollections with less boilerplate
	 * 
	 * @usage
	 *		var closeAlert:Alert = Alert.show("Something went wrong!", "Error", ButtonLCHelper.close());
	 * 
	 *		var retryCancelAlert:Alert = Alert.show("Connection failed", "Error", ButtonLCHelper.retryCancel(retryButton_handler));
	 * 
	 * @author Kevin Foley
	 */
	public class ButtonLCHelper {
		
		private static var _stringMap:IStringMap;
		
		private static function initStringMap():void {
			_stringMap = new StringMap();
			_stringMap.add("ok", "OK");
			_stringMap.add("close", "Close");
			_stringMap.add("dismiss", "Dismiss");
			_stringMap.add("submit", "Submit");
			_stringMap.add("continue", "Continue");
			_stringMap.add("cancel", "Cancel");
			_stringMap.add("retry", "Retry");
			_stringMap.add("yes", "Yes");
			_stringMap.add("no", "No");
			_stringMap.add("save", "Save");
		}
		/** The StringMap containing the labels for the different button types.
		 * @see kevinfoley.addonsforfeathers.helpers.ButtonLCHelper#initStringMap
		 */
		public static function get stringMap():IStringMap {
			if (!_stringMap) {
				initStringMap();
			}
			return _stringMap;
		}
		public static function set stringMap(value:IStringMap):void {
			_stringMap = value;
		}
		
		//--------------------------------------------------------------------------------------------------------------
		
		public static function ok(callback:Function = null):ListCollection {
			return createButton(stringMap.retrieve("ok"), callback);
		}
		
		public static function close(callback:Function = null):ListCollection {
			return createButton(stringMap.retrieve("close"), callback);
		}
		
		public static function dismiss(callback:Function = null):ListCollection {
			return createButton(stringMap.retrieve("dismiss"), callback);
		}
		
		public static function submit(callback:Function = null):ListCollection {
			return createButton(stringMap.retrieve("submit"), callback);
		}
		
		public static function retryCancel(retryCallback:Function, cancelCallback:Function = null):ListCollection {
			return createTwoButtons(stringMap.retrieve("retry"), retryCallback, stringMap.retrieve("cancel"), cancelCallback);
		}
		
		public static function okCancel(okCallback:Function, cancelCallback:Function = null):ListCollection {
			return createTwoButtons(stringMap.retrieve("ok"), okCallback, stringMap.retrieve("cancel"), cancelCallback);
		}
		
		public static function submitCancel(submitCallback:Function, cancelCallback:Function = null):ListCollection {
			return createTwoButtons(stringMap.retrieve("submit"), submitCallback, stringMap.retrieve("cancel"), cancelCallback);
		}
		
		public static function continueCancel(continueCallback:Function, cancelCallback:Function = null):ListCollection {
			return createTwoButtons(stringMap.retrieve("continue"), continueCallback, stringMap.retrieve("cancel"), cancelCallback);
		}
		
		public static function yesNo(yesCallback:Function, noCallback:Function = null):ListCollection {
			return createTwoButtons(stringMap.retrieve("yes"), yesCallback, stringMap.retrieve("no"), noCallback);
		}
		
		public static function saveCancel(saveCallback:Function, noCallback:Function = null):ListCollection {
			return createTwoButtons(stringMap.retrieve("save"), saveCallback, stringMap.retrieve("no"), noCallback);
		}
		
		public static function createButton(label:String, callback:Function = null):ListCollection {
			return new ListCollection( [ createButtonObject(label, callback) ] );
		}
		
		public static function createTwoButtons(label1:String, callback1:Function, label2:String, callback2:Function = null):ListCollection {
			return new ListCollection( [ createButtonObject(label1, callback1), createButtonObject(label2, callback2) ] );
		}
		
		//-- Helpers ---------------------------------------------------------------------------------------------------
		
		private static function createButtonObject(label:String, callback:Function):Object {
			var button:Object = { label: label };
			if (callback is Function) button.triggered = callback;
			return button;
		}
	}

}