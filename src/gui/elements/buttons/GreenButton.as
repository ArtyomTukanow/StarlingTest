package gui.elements.buttons {
import starling.display.Button;
import starling.events.Event;
import gui.assets.AssetManager;
import gui.assets.StandardAssets;

public class GreenButton extends Button{

    function GreenButton(x:int, y:int, text:String, onMouseDown:Function = null) {
        super (AssetManager.Instance.standardAssets.getAtlasTexture(StandardAssets.ATLAS, StandardAssets.WIN_BTN_GREEN_NORM),
                text,
                null,
                AssetManager.Instance.standardAssets.getAtlasTexture(StandardAssets.ATLAS, StandardAssets.WIN_BTN_GREEN_OVER));
        this.x = x;
        this.y = y;
//        this.width = 250;
//        this.height = 50;
        if(onMouseDown != null)
            this.addEventListener(Event.TRIGGERED, onMouseDown)
    }
}
}
