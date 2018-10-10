package gui.elements.covers {
import gui.assets.AssetManager;
import gui.assets.StandardAssets;
import starling.display.Image;
import starling.display.Sprite;
import starling.events.Event;
import starling.text.TextField;

public class CoverBase extends Sprite{

    private var _background:Image;
    private var _title:Image;
    private var _titleTextField:TextField;
    private var _titleString:String;

    public function CoverBase(title:String) {
        this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        _titleString = title;
    }

    private function onAddedToStage(event:Event):void {
        _background = new Image(AssetManager.Instance.standardAssets.getAtlasTexture(StandardAssets.ATLAS, StandardAssets.BG_BIG_PURPLE));
        this.addChild(_background);
        _title = new Image(AssetManager.Instance.standardAssets.getAtlasTexture(StandardAssets.ATLAS, StandardAssets.BG_BIG_PURPLE_TITLE));
        _title.x = 230;
        this.addChild(_title);
        _titleTextField = new TextField(_title.width, _title.height, _titleString);
        _titleTextField.x = _title.x;
        _titleTextField.y = _title.y;
        this.addChild(_titleTextField);
    }
}
}
