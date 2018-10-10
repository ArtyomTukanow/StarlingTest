package gui.elements.buttons {
import starling.display.Button;
import starling.events.Event;
import gui.assets.AssetManager;
import gui.assets.StandardAssets;

public class CloseButton extends Button{

    function CloseButton(x:int, y:int, onMouseDown:Function = null) {
        super (AssetManager.Instance.standardAssets.getAtlasTexture(StandardAssets.ATLAS, StandardAssets.WIN_BTN_CLOSE_NORM),
                "",
                null,
                AssetManager.Instance.standardAssets.getAtlasTexture(StandardAssets.ATLAS, StandardAssets.WIN_BTN_CLOSE_OVER)
        );
        this.x = x;
        this.y = y;
        if(onMouseDown != null)
            this.addEventListener(Event.TRIGGERED, onMouseDown)
    }
}
}