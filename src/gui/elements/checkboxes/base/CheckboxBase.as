package gui.elements.checkboxes.base {
import gui.assets.AssetManager;
import gui.assets.StandardAssets;
import starling.display.Button;
import starling.events.Event;

public class CheckboxBase extends Button {

    protected var _uncheckable:Boolean = true;
    protected var _checked:Boolean = false;
    public function get checked():Boolean {
        return _checked;
    }
    public function set checked(value:Boolean){
        if(_checked == value) return;
        _checked = value;
        update();
    }
    protected var _onMouseDown:Function;

    public function CheckboxBase(x:int, y:int, text:String = "", onMouseDown:Function = null, uncheckable:Boolean = true) {
        super (AssetManager.Instance.standardAssets.getAtlasTexture(StandardAssets.ATLAS, StandardAssets.CHECKBOX_NORM),
                text,
                AssetManager.Instance.standardAssets.getAtlasTexture(StandardAssets.ATLAS, StandardAssets.CHECKBOX_NORM),
                AssetManager.Instance.standardAssets.getAtlasTexture(StandardAssets.ATLAS, StandardAssets.CHECKBOX_OVER)
        );
        _uncheckable = uncheckable;
        this.x = x;
        this.y = y;
        if(onMouseDown != null)
            _onMouseDown = onMouseDown;
        this.addEventListener(Event.TRIGGERED, onCheck)
    }

    protected function onCheck(event:Event):void {
        if(_checked && !_uncheckable)
            return;
        _checked = !_checked;
        if(_onMouseDown != null) {
            var obj:Object = {target:this};
            _onMouseDown(obj);
        }
        update();
    }

    public function update():void {

    }
}
}
