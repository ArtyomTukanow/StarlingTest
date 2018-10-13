package gui.elements.checkboxes {
import flash.geom.Rectangle;
import gui.assets.AssetManager;
import gui.assets.StandardAssets;
import gui.elements.checkboxes.base.CheckboxBase;
import starling.text.TextFormat;
import starling.textures.Texture;

public class PurpleTabButton extends CheckboxBase {

    private var _purpleNormDis:Texture;
    private var _purpleNormEn:Texture;
    private var _purpleOverDis:Texture;
    private var _purpleOverEn:Texture;

    public function PurpleTabButton(x:int, y:int, text:String = "", onMouseDown:Function = null, uncheckable:Boolean = true) {
        super (x, y, text, onMouseDown, uncheckable);
        _purpleNormDis = AssetManager.Instance.standardAssets.getAtlasTexture(StandardAssets.ATLAS, StandardAssets.BTN_PURPLE_NORM_DIS);
        _purpleNormEn = AssetManager.Instance.standardAssets.getAtlasTexture(StandardAssets.ATLAS, StandardAssets.BTN_PURPLE_NORM_EN);
        _purpleOverDis = AssetManager.Instance.standardAssets.getAtlasTexture(StandardAssets.ATLAS, StandardAssets.BTN_PURPLE_OVER_DIS);
        _purpleOverEn = AssetManager.Instance.standardAssets.getAtlasTexture(StandardAssets.ATLAS, StandardAssets.BTN_PURPLE_OVER_EN);
        this.width = _purpleOverDis.width;
        this.height = _purpleOverDis.height;
        this.textFormat = new TextFormat(StandardAssets.DEFAULT_FONT, 18, 0x553371);
        this.textBounds = new Rectangle(0, -5, this.width, this.height);//особенность шрифта
        update();
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
