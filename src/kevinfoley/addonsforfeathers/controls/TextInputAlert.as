/*
2017 Kevin Foley. All Rights Reserved.
This program is free software. You can redistribute and/or modify it in accordance with the terms of the accompanying 
license agreement.
*/

package kevinfoley.addonsforfeathers.controls {
	import feathers.controls.Alert;
	import feathers.controls.TextInput;
	import feathers.data.ListCollection;
	import feathers.skins.IStyleProvider;
	import starling.display.DisplayObject;
	
	/**
	 * Extends Alert to add a TextInput
	 * 
	 * @usage
	 *		function showSaveDialog():void {
	 * 			saveDialog = TextInputAlert.show("Please enter a file name", "Save file", ButtonLCHelper.saveCancel(save_handler));
	 * 			saveDialog.prompt = "Enter a file name";
	 *		}
	 *		function save_handler(e:Event):void {
	 * 			var fileName:String = saveDialog.text;
	 * 			if (fileName.length > 0) saveFile(fileName);
	 * 		}
	 * 
	 * @author Kevin Foley
	 */
	public class TextInputAlert extends Alert {
		
		//-- Static ----------------------------------------------------------------------------------------------------
		
		public static var globalStyleProvider:IStyleProvider;
		
		/**
		 * Create and display a TextInputAlert
		 * @see feathers.controls.Alert#show() 
		 */
		public static function show(message:String, title:String, buttons:ListCollection, icon:DisplayObject = null, 
			isModal:Boolean = true, isCentered:Boolean = true):TextInputAlert 
		{
			return Alert.show(message, title, buttons, icon, isModal, isCentered, factory) as TextInputAlert;
		}
		
		private static function factory():Alert {
			return new TextInputAlert();
		}
		
		//-- Instance --------------------------------------------------------------------------------------------------
		
		protected var _textInput:TextInput;
		protected var _prompt:String;
		protected var _text:String;
		protected var _customTextInputStyleName:String;
		
		/**
		 * Create a new instance of TextInputAlert
		 */
		public function TextInputAlert() {
			super();
		}
		
		override protected function createMessage():void {
			super.createMessage();
			
			//we add the TextInput in createMessage() so that we can give it the desired child index
			_textInput = new TextInput();
			_textInput.prompt = _prompt;
			_textInput.text = _text;
			if (_customTextInputStyleName != null) _textInput.styleName = _customTextInputStyleName;
			addChildAt(_textInput, 1);
		}
		
		/** 
		 * The prompt displayed on the TextInput
		 * @see feathers.controls.TextInput#get prompt()
		 */
		public function get prompt():String {
			if (_prompt) return _prompt;
			else return "";
		}
		public function set prompt(value:String):void {
			_prompt = value;
			if (_textInput) _textInput.prompt = value;
		}
		
		/** 
		 * The text currently entered in the TextInput
		 * @see feathers.controls.TextInput#get text()
		 */
		public function get text():String {
			if (_textInput) return _textInput.text;
			else if (_text) return _text;
			else return "";
		}
		public function set text(value:String):void {
			_text = value;
			if (_textInput) _textInput.text = value;
		}
		
		/**
		 * A custom style name to use for the TextInput
		 */
		public function get customTextInputStyleName():String {
			return _customTextInputStyleName;
		}
		public function set customTextInputStyleName(value:String):void {
			_customTextInputStyleName = value;
			if (_textInput) _textInput.styleName = value;
		}
		
		override protected function get defaultStyleProvider():IStyleProvider {
			if (!TextInputAlert.globalStyleProvider) {
				return Alert.globalStyleProvider;
			}
			return TextInputAlert.globalStyleProvider;
		}
	}
}