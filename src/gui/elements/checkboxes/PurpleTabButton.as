package gui.elements.checkboxes {
import gui.assets.AssetManager;
import gui.assets.StandardAssets;
import gui.elements.checkboxes.base.CheckboxBase;
import starling.events.Event;
import starling.textures.Texture;

public class PurpleTabButton extends CheckboxBase {

    private var _purpleNormDis:Texture;
    private var _purpleNormEn:Texture;
    private var _purpleOverDis:Texture;
    private var _purpleOverEn:Texture;

    public function PurpleTabButton(x:int, y:int, text:String = "", onMouseDown:Function = null) {
        super (x, y, text, onMouseDown);
        _purpleNormDis = AssetManager.Instance.standardAssets.getAtlasTexture(StandardAssets.ATLAS, StandardAssets.BTN_PURPLE_NORM_DIS);
        _purpleNormEn = AssetManager.Instance.standardAssets.getAtlasTexture(StandardAssets.ATLAS, StandardAssets.BTN_PURPLE_NORM_EN);
        _purpleOverDis = AssetManager.Instance.standardAssets.getAtlasTexture(StandardAssets.ATLAS, StandardAssets.BTN_PURPLE_OVER_DIS);
        _purpleOverEn = AssetManager.Instance.standardAssets.getAtlasTexture(StandardAssets.ATLAS, StandardAssets.BTN_PURPLE_OVER_EN);
        this.width = _purpleOverDis.width;
        this.height = _purpleOverDis.height;
        update();
    }

    protected override function onCheck(event:Event):void {
        if(!_checked) {
            super.onCheck(event);
        }
    }

    public override function update():void {
        if(_checked) {
            this.upState = _purpleNormEn;
            this.downState = _purpleNormEn;
            this.overState = _purpleOverEn;
        } else {
            this.upState = _purpleNormDis;
            this.downState = _purpleNormDis;
            this.overState = _purpleOverDis;
        }
    }
}
}
