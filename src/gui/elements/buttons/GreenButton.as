package gui.elements.buttons {
import flash.geom.Rectangle;
import starling.display.Button;
import starling.events.Event;
import gui.assets.AssetManager;
import gui.assets.StandardAssets;
import starling.text.TextFormat;

public class GreenButton extends Button{

    function GreenButton(x:int, y:int, text:String, onMouseDown:Function = null) {
        super (AssetManager.Instance.standardAssets.getAtlasTexture(StandardAssets.ATLAS, StandardAssets.WIN_BTN_GREEN_NORM),
                text,
                AssetManager.Instance.standardAssets.getAtlasTexture(StandardAssets.ATLAS, StandardAssets.WIN_BTN_GREEN_NORM),
                AssetManager.Instance.standardAssets.getAtlasTexture(StandardAssets.ATLAS, StandardAssets.WIN_BTN_GREEN_OVER));
        this.x = x;
        this.y = y;
        this.textFormat = new TextFormat(StandardAssets.GREENFONT, 22, 0xFFFFFF);

        this.textBounds = new Rectangle(0, -5, this.width, this.height);//особенность шрифта

        if(onMouseDown != null)
            this.addEventListener(Event.TRIGGERED, onMouseDown)
    }
}
}
