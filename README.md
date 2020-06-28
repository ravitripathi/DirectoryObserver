# DirectoryObserver
<a href="https://raw.githubusercontent.com/ravitripathi/DirectoryObserver/master/LICENSE"><img src="https://img.shields.io/github/license/ravitripathi/DirectoryObserver"></a>
<a href="https://swift.org/package-manager/"><img src="https://img.shields.io/badge/SPM-Supported-blue?style=flat"></a>


Pass a directory URL, and the observer listens for changes inside it. Used by [ScriptDeck](https://github.com/ravitripathi/ScriptDeck) for responding to folder events.

## Integration 

Add this repo via SwiftPM, or copy `DirectoryObserver` and `FSObserver` in your project.

## Usage

- Initilaize the observer:

`try DirectoryObserver(atFolderURL: url)` 

or

`try DirectoryObserver(atFolderURL: url, fileSystemEvent: DispatchSource.FileSystemEvent)`

-  Set the delegate

`observer.delegate = self`

- Conform to `DirectoryObserverDelegate`

That's it! The `didChange(currentUrls:)` delegate is triggered when a file system event occurs (default is `.all`, which responds to all events)