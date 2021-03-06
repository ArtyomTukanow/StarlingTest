package gui.elements.tabs {
import gui.assets.AssetManager;
import gui.assets.FriendInviteAssets;
import gui.assets.StandardAssets;
import gui.elements.checkboxes.PurpleTabButton;
import starling.display.Image;
import starling.display.Sprite;
import starling.events.Event;

public class FriendInviteTab extends Sprite{

    private var _tabButtons:Vector.<PurpleTabButton> = new Vector.<PurpleTabButton>(2);
    private var _tabs:Vector.<Sprite> = new Vector.<Sprite>(2);
    public function getTab(tabId:int):Sprite {return _tabs[tabId]; }
    private var _background:Image;

    private var _currentTabId:int = 0;

    public function FriendInviteTab() {
        this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }

    private function onAddedToStage(event:Event):void {

        var mouseW:Image = new Image(AssetManager.Instance.friendInviteAssets.getAtlasTexture(FriendInviteAssets.ATLAS, FriendInviteAssets.WIN_GIFT_MOUSE_W));
        var mouseB:Image = new Image(AssetManager.Instance.friendInviteAssets.getAtlasTexture(FriendInviteAssets.ATLAS, FriendInviteAssets.WIN_GIFT_MOUSE_B));
        mouseB.x = -75;
        mouseB.y = 160;
        mouseW.x = 410;
        mouseW.y = -200;

        this.addChild(mouseW);

        _tabButtons[0] = new PurpleTabButton(20, -35, "Друзья online", onTabButtonChecked, false);
        this.addChild(_tabButtons[0]);

        _tabButtons[1] = new PurpleTabButton(230, -35, "Друзья offline", onTabButtonChecked, false);
        this.addChild(_tabButtons[1]);

        _background = new Image(AssetManager.Instance.standardAssets.getAtlasTexture(StandardAssets.ATLAS, StandardAssets.BG_BIG_PURPLE_BOARD_GIFT));
        this.addChild(_background);

        this.addChild(mouseB);

        for (var i:int = 0; i < _tabs.length; i ++) {
            _tabs[i] = new Sprite();
            this.addChild(_tabs[i]);
        }
        _tabButtons[_currentTabId].checked = true;

        update();
    }

    private function update():void {
        for(var i:int = 0; i < _tabs.length; i ++)
            _tabs[i].visible = _tabButtons[i].checked;
    }

    private function onTabButtonChecked(object:Object):void {
        var tab:PurpleTabButton = object.target as PurpleTabButton;
        for(var i:int = 0; i < _tabButtons.length; i ++) {
            if(tab != _tabButtons[i]) {
                (_tabButtons[i] as PurpleTabButton).checked = false;
            }
        }
        update();
    }
}
}
