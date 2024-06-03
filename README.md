# pluto


**How to add this plugin to Neovim**:  
```
$ git clone git@github.com:benodiwal/pluto.git
```

1. **Using packer**:

 Add this code inside packer.lua in your configration:
 ```lua
   use {
       'path/to/cloned/repo',
        config = function ()
                require("pluto")
        end
    }
 ```
