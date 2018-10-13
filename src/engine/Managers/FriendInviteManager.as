package engine.Managers {
import engine.Net.VKConnector;

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

    public function getUsers(onUsersDataUpdated:Function):void {
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
            onUsersDataUpdated();
        });
    }

    public function sendRequest(userData:Object, onComplete:Function, onError:Function):void {
        VKConnector.Instance.showRequestBox(userData.id, onComplete, onError);
    }

    public function postOnTheWall(userData:Object, onComplete:Function, onError:Function):void {
        VKConnector.Instance.postOnTheWall(userData.id, function (data:Object) {
            if(data.error)
                onError(data.error);
            else
                onComplete();
        });
    }
}
}
