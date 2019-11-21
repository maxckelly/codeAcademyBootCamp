# Max's Notes

## Local Storage

- Local storage is a way to store data locally in the browser, this is stored in the browser until you do a clear. 
- NOTE: Local storage can only store strings and has a maximum of 50mgb
- To store in the browser you can do `localStorage["roddy"]`.
- The way to get around the storage of the string is to put an object into the JSON file. You can do this by following the below:
  - The below creates an object called `anObject` 
  - You then create a key `"myObject"` and create a JSON file from `anObject`. This assigns the object into the local storage.
  - You can then call local storage and see the object at the bottom. 
  
```
anObject = {myKey: 11, myValue: "This is a value string", somethingElse: 11.5};
localStorage["myObject"] = JSON.stringify(anObject);
localStorage;
```