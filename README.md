# rrkit_release
RRKit is a simple library that gets thrown in scripts or into autoexec for ease of use. It wraps the rconsole completely.

# Lua Color Codes
[Here are all of the colorcodes I've discovered so far!](https://github.com/RobloxArchiver/luacolor/blob/main/misc/color_codes.txt)

# Documentation (Simple)

# Console Functions

## `console.print(text, colorcode)`
Colorcode defaults to the default colorcode if not chosen
Text defaults to `""` if not chosen

```lua
console.print("Hello, World!", 45)
```
This prints it with a magenta background.

## `console.error(text)`
This function is used just to separate error messages to normal messages, I only wrote this for my own use but I encourage you to use it to keep code cleaner and easier to read.

```lua
console.error("We did a goofy!")
```

## `console.success(text)`
This function is the same with error, used just to separate different types of messages. This prints out in a green color.

```lua
console.error("We undid the goofy!")
```

## `console.clear()`
This takes no arguments, was used in development once again. Kept it since it resets EVERYTHING.

```lua
console.clear()
```

## `console.set(name, sdk)`
This takes two arguments, `name` is the name you'd like to change the console to and `sdk` a special tag that adds `SDK Version` to the top with the current version. I would recommend not using it unless you like the tag.

```lua
console.set("Console", true)
```
The name is now `Console - SDK Version: 1.0`

# Handler Functions

## `handler:add(command, callback)`
Using the handler is simple as pi. Command is the name of the function, example would be `"help"` or `"hello"`. Callback is the function that gets called when the command is used. It is a function and is simple to use.

Currently due to my own limitations I do not know how to add strings or numbers to the handler. Another note is that `command` cannot have spaces, just text and numbers and certain characters. Every space is a new argument, currently it has support for 3 arguments. 

```lua
handler:add("print", function(...)
    console.print(...)
end)
```

## `handler:request()`
It takes a argument but it's recommanded to just keep it empty. I added a `pcall` to make sure in the event of an error it won't exit. I hope this actually works out and errors stopping it don't become a problem.

```lua
handler:request()
```
In the backend all the magic happens at the handler. It's very simple and took little time to make.

# rrkit_sdk functions

## `rrkit_sdk:terminate()`
The name says it all, this function is used to nil out rrkit_sdk. 
