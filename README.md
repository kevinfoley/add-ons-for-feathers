# Add-Ons for Feathers 0.1.0
by Kevin Foley

The very cleverly named "Add-Ons For Feathers" library contains a variety of controls, helpers, and utility classes that
are useful in nearly any app that uses the open-source Feathers UI library for AS3/Starling.

## Features

### Helpers

#### ButtonLCHelper

Are you sick of typing `new ListCollection([ { label: "Ok" } ])` every time you create an `Alert`? I know I am! 
`ButtonLCHelper` (short for 'ButtonListCollectionHelper' provides convenient methods to define ButtonGroup data
providers with less boilerplate!

    Alert.show("Please fill out all fields", "Form incomplete", ButtonLCHelper.ok());
    
    Alert.show("Connection attempt failed", "Network error", ButtonLCHelper.retryCancel(retry_handler));
	
Standard English labels are used by default, but you can override the button labels by replacing the default StringMap.

    ButtonLCHelper.stringMap = spanishStrings;

### New controls

All of the new controls can be styled in a Feathers theme.

#### TextInputAlert
As you might guess from the name, `TextInputAlert` is an `Alert` with a `TextInput`, useful for things like save 
dialogs. Wrapper methods let you style the `TextInput` and access its text.

    function showSaveDialog():void {
        saveDialog = TextInputAlert.show("Please enter a file name", "Save file", ButtonLCHelper.saveCancel(save_handler));
        saveDialog.prompt = "Enter a file name";
    }
	
    function save_handler(e:Event):void {
        var fileName:String = saveDialog.text;
        if (fileName.length > 0) {
            saveFile(fileName);
        }
    }

#### CheckboxAlert
`CheckboxAlert` is an Alert with a `Check`(box), useful for dialogs where you want to have a "Don't ask again" checkbox.
Wrapper methods let you style the `Check` and access its `isSelected` value.

    function askToDelete():void {
        deleteDialog = CheckboxAlert.show("Are you sure?", "Delete file", ButtonLCHelper.okCancel(confirmDelete_handler));
        deleteDialog.checkLabel = "Don't ask again";
    }
	
    function confirmDelete_handler(e:Event):void {
        if (deleteDialog.isSelected) {
            UserPreferences.askBeforeDeletingFiles = false;
        }
    }

### Localization

#### StringMap

You've got plenty of options for string localization; why not add one more? `StringMap` wraps a dictionary to provide a
convenient place for storing and retrieving strings by key. Missing a string? You can either return a placeholder, or
throw an error.

    var stringMap:StringMap = new StringMap();
	stringMap.add("welcome-message", "Welcome to our app!");
	stringMap.add("error-title", "Error");
	stringMap.retrieve("error-title"); //returns "Error"
	stringMap.retrieve("error-title", true); //returns "ERROR"
	stringMap.placeholder = "{{missing string}}";
	stringMap.retrieve("nonexistent-key", false, false); //returns "{{missing string}}";
	stringMap.retrieve("nonexistent-key", false, true); //throws an error

## Links
- [Feathers website](https://feathersui.com/)
- [Starling website](https://gamua.com/starling/)

	
_"Add-Ons For Feathers" is not affiliated with or endorsed by Bowler Hat LLC, the author of the Feathers UI library._
