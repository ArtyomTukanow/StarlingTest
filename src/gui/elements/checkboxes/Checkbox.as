package gui.elements.checkboxes {
import gui.assets.AssetManager;
import gui.assets.StandardAssets;
import gui.elements.checkboxes.base.CheckboxBase;
import starling.display.Image;

public class Checkbox extends CheckboxBase{

    protected var _checkImage:Image;

    public function Checkbox(x:int, y:int, onMouseDown:Function = null, uncheckable:Boolean = true) {
        super(x,y, "", onMouseDown, uncheckable);
            _checkImage = new Image(AssetManager.Instance.standardAssets.getAtlasTexture(StandardAssets.ATLAS, StandardAssets.CHECK));
            _checkImage.x = this.width / 2 - _checkImage.width / 2;
            _checkImage.y = this.height / 2 - _checkImage.height / 2;
        this.addChild(_checkImage);
            update();
    }

    public override function update():void {
        _checkImage.visible = _checked;
    }
}
}
