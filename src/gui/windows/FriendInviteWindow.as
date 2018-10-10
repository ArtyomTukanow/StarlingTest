package gui.windows {
import gui.elements.checkboxes.Checkbox;
import gui.elements.covers.CoverBase;
import gui.elements.panels.FriendPanel;
import gui.elements.tabs.FriendInviteTab;
import starling.events.Event;
import gui.windows.base.WindowBase;
import gui.elements.buttons.CloseButton;
import gui.elements.buttons.GreenButton;

public class FriendInviteWindow extends WindowBase{

    private var _sendToAllBtn:GreenButton;
    private var _closeBtn:CloseButton;
    private var _cover:CoverBase;
    private var _friendInviteTab:FriendInviteTab;
    private var _friendPanel:FriendPanel;



    protected override function buildWindow():void {

        _cover = new CoverBase("Выберите друзей");
        this.addChild(_cover);

        _sendToAllBtn = new GreenButton(220, 505, "Отправить всем", onSendToAllBtnClick);
        _cover.addChild(_sendToAllBtn);

        _closeBtn = new CloseButton(610, 45);
        _cover.addChild(_closeBtn);



        _friendInviteTab = new FriendInviteTab();

        _friendInviteTab.x = 55;
        _friendInviteTab.y = 185;
        _cover.addChild(_friendInviteTab);
        _friendPanel = new FriendPanel(new Vector.<Object>(25));
        _friendPanel.x = 60;
        _friendPanel.y = 60;
        _friendInviteTab.getTab(0).addChild(_friendPanel);
        _friendInviteTab.getTab(1).addChild(new Checkbox(200,100));
        _friendInviteTab.getTab(1).addChild(new Checkbox(300,100));

    }

    private function onSendToAllBtnClick(event:Event) {
        trace("onSendToAllButtonClick");
    }
}
}
