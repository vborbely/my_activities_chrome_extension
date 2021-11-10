# My Activities 
__It is a sample Google Chrome browser extension__

The extension was built in Flutter Web.

### How to build

`% cd /path/to/project/root`

`% flutter build web --web-renderer html --csp`

This will generate a `/build/web` folder in the root of the project.

## How to install in Chrome browser

_Note: this is not an official package, not published via Google Extension Market.
If you feel uncomfortable to play with it, then stop here. For the rest, have fun! :)_

1. Download the ZIPed extensions package from [here](/release/MyActivities_Chrome_Extension.zip).

2. Unpack it into a folder and remember the path.

3. In Chrome menu open the __Settings -> Extensions__ page

(Shorter way: type into the browser address bar: `chrome://extensions/` )

4. Enable the `Developer mode` switch in the top right.
Then 3 new buttons will appear, chose the first one: `Load unpacked elements ...`

5. Locate the unpacked ZIP folder and select the folder to load.

6. The extension is loaded.

7. Open a new browser window, and click the extensions icon (puzzle icon) on the top right: 
![img.png](img.png)

Pin it:

![img_1.png](img_1.png)

8. Open/Close it by clicking on the icon

![img_2.png](img_2.png)

