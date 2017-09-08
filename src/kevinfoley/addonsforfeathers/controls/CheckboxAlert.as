/*
2017 Kevin Foley. All Rights Reserved.
This program is free software. You can redistribute and/or modify it in accordance with the terms of the accompanying 
license agreement.
*/

package kevinfoley.addonsforfeathers.controls {
	import feathers.controls.Alert;
	import feathers.controls.Check;
	import feathers.data.ListCollection;
	import feathers.skins.IStyleProvider;
	import starling.display.DisplayObject;
	
	/**
	 * Extends Alert to add a Check
	 * 
	 * @usage
	 * 		checkboxAlert = CheckboxAlert.show("Are you sure?", "Delete file", 
	 * 			ButtonLCHelper.okCancel(okButton_handler));
	 * 		checkboxAlert.checkLabel = "Don't ask again";
	 * 		[...]
	 * 		function okButton_handler(e:Event):void {
	 * 			if (checkboxAlert.isSelected) {
	 * 				UserPreferences.askBeforeDeletingFiles = false;
	 * 			}
	 * 		}
	 * 
	 * @author Kevin Foley
	 */
	public class CheckboxAlert extends Alert {
		
		//-- Static ----------------------------------------------------------------------------------------------------
		
		public static var globalStyleProvider:IStyleProvider;
		
		/**
		 * Create and display a CheckboxAlert
		 * @see feathers.controls.Alert#show() 
		 */
		public static function show(message:String, title:String, buttons:ListCollection, icon:DisplayObject = null, 
			isModal:Boolean = true, isCentered:Boolean = true):CheckboxAlert 
		{
			return Alert.show(message, title, buttons, icon, isModal, isCentered, factory) as CheckboxAlert;
		}
		
		private static function factory():Alert {
			return new CheckboxAlert();
		}
		
		//-- Instance --------------------------------------------------------------------------------------------------
		
		protected var _check:Check;
		protected var _checkLabel:String;
		protected var _customCheckStyleName:String;
		protected var _isSelected:Boolean;
		
		/**
		 * Create a new instance of CheckboxAlert
		 */
		public function CheckboxAlert() {
			super();
		}
		
		override protected function createMessage():void {
			super.createMessage();
			
			//we add the Check in createMessage() so that we can give it the desired child index
			_check = new Check();
			if (_customCheckStyleName != null) _check.styleName = _customCheckStyleName;
			_check.label = _checkLabel;
			_check.isSelected = _isSelected;
			addChildAt(_check, 1);
		}
		
		/**
		 * The text displayed on the Check's label
		 */
		public function get checkLabel():String {
			return _checkLabel;
		}
		public function set checkLabel(value:String):void {
			_checkLabel = value;
			if (_check) _check.label = value;
		}
		
		/**
		 * A custom style name to use for the Check
		 */
		public function get customCheckStyleName():String {
			return _customCheckStyleName;
		}
		public function set customCheckStyleName(value:String):void {
			_customCheckStyleName = value;
			if (_check) _check.styleName = value;
		}
		
		/** 
		 * Whether the Check is selected
		 */
		public function get isSelected():Boolean {
			return _isSelected;
		}
		public function set isSelected(value:Boolean):void {
			_isSelected = value;
			if (_check) _check.isSelected = value;
		}
		
		override protected function get defaultStyleProvider():IStyleProvider {
			if (!CheckboxAlert.globalStyleProvider) {
				return Alert.globalStyleProvider;
			}
			return CheckboxAlert.globalStyleProvider;
		}
	}
}