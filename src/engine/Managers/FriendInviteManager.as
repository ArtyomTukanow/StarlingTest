package engine.Managers {
import engine.Net.VKConnector;
import engine.Net.NetLoader;
import gui.windows.GameWindow;

public class FriendInviteManager {

    private static var _instance:FriendInviteManager = new FriendInviteManager();
    public static function get Instance():FriendInviteManager { return _instance; }

    public function FriendInviteManager() {
        if(_instance) {
            throw new Error("Instance already created");
        }
    }

    private var _offlineFriendsData:Array = [];

    private var _onlineFriendsData:Array = [];

    public function get onlineFriendsData():Array {
        return _onlineFriendsData;
    }

    public function get offlineFriendsData():Array {
        return _offlineFriendsData;
    }


    public function getTexture(url:String, onTextureLoaded:Function):void {
        NetLoader.loadTextureFromURL(url, onTextureLoaded);
    }

    public function getUsers():void {
        VKConnector.Instance.getFriends(function (data:Object):void {
            while(_onlineFriendsData.length > 0) _onlineFriendsData.removeAt(0);
            while(_offlineFriendsData.length > 0) _offlineFriendsData.removeAt(0);
            for each (var friend:Object in data.response.items) {
                if(friend.online) {
                    _onlineFriendsData.push(friend);
                } else {
                    _offlineFriendsData.push(friend);
                }
            }
            GameWindow.friendInviteWindow.updateFriendPanels();
        });
    }
}
}
