# GTA_NOTIF
Notification using html/css/js and lua.

## Screen :

![GTA_NOTIFICATION V1.2](https://cdn.discordapp.com/attachments/554479498721099787/812709004152799232/Capture_decran_2021-02-20_163515.png)

![GTA_NOTIFICATION V1.3](https://cdn.discordapp.com/attachments/554479498721099787/814497163438325820/unknown.png)


## Information 
you can copy the function and past it into your code.
```lua
     exports.GTA_Notif:GTA_NUI_ShowNotification({
        text = "Your Text, Hello World !",
        type = "success", --> Your type between error/success/warning
        icon = "fab fa-angellist fa-2x", --> here is your icon for e.g i added a peace icon. zoomed x2.
        position = "row-reverse" --> here is your icon position between row/row-reverse.
    })
```
dont forgot to add the GTA_Notif into your server.cfg 
like : 
    
    ensure GTA_Notif


## Features
# You can select the type of your notification pop pup between : 
<ul>
    <li>error</li>
    <li>warning</li>
    <li>success</li>
</ul>

# You can select the value of the icon position between : 
<ul>
    <li>"row"</li>
    <li>"row reverse"</li>
</ul>

row = position right
row-reverse = position left

Change the timer of the pop pup display in the js file.
use the notification by event useful for server-side.

## License :
@SuperCoolNinja