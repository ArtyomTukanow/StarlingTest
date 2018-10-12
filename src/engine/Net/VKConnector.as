package engine.Net {
import flash.events.EventDispatcher;
import flash.external.ExternalInterface;
import gui.windows.GameWindow;
public class VKConnector extends EventDispatcher{

    private static var _instance:VKConnector = new VKConnector();
    public static function get Instance():VKConnector { return _instance; }

    private var _isInited:Boolean = false;//показывает подключено ли приложение к ВК

    public function VKConnector() {
        if(ExternalInterface.available) {
            ExternalInterface.addCallback("localTrace", localTrace);
            ExternalInterface.addCallback("successfulInit", successfulInit);
            ExternalInterface.addCallback("successfulRequest", successfulRequest);
            ExternalInterface.call("initVK");
        } else {
            trace("ExternalInterface is not available");
        }
    }

    private var _vkApiQueue:Array = [];
    private var _functionQueue:Object = {};
    private var _idCounter:int = 0;

    private function vkApi(methodName:String, params:Object, callback:Function):void {
        if(!_isInited) {
            _vkApiQueue.push({methodName:methodName, params:params, callback:callback});
            return;
        }
        _functionQueue[_idCounter] = callback;
        ExternalInterface.call("vkApi", methodName, params, _idCounter);
        _idCounter ++;
    }

    private function successfulRequest(callbackId:int, data:Object):void {
        _functionQueue[callbackId](data);
        _functionQueue[callbackId] = null;
    }

    //получает список друзей c полями id, first_name, online, photo_50
    public function getFriends(callback:Function):void {
        vkApi("friends.get", {fields:"id, first_name, online, photo_50"}, callback);
    }

    //Создает список друзей, который будет использоваться при отправке пользователем приглашений в приложение (не играют в игру)
    public function appsGetInviteFriendsList(callback:Function):void {
        vkApi("friends.get", {type:"invite", fields:"id, first_name, online, photo_50"}, callback);
    }

    //Создает список друзей, который будет использоваться при отправке пользователем игровых запросов (уже играют)
    public function appsGetRequestFriendsList(callback:Function):void {
        vkApi("friends.get", {type:"request", fields:"id, first_name, online, photo_50"}, callback);
    }

    //Создает список друзей, который будет использоваться при отправке пользователем игровых запросов (уже играют)
    public function appsSendRequest(userId:String, requestType:String, callback:Function):void {
        if(requestType == "request")
            vkApi("apps.sendRequest", {type:"request", user_id:userId, text:"Войди в приложение!", name:"Login"}, callback);
        else
            vkApi("apps.sendRequest", {type:"invite", user_id:userId, text:"Зарегистрируйся в приложение!", name:"Register"}, callback);
    }



    //JavaScript callbacks

    private function localTrace(message:String):void {
        GameWindow.friendInviteWindow.trace(message);
    }

    private function successfulInit():void {
        _isInited = true;
        for(var i:int = 0; i < _vkApiQueue.length; i ++) {
            vkApi(_vkApiQueue[i].methodName,_vkApiQueue[i].params,_vkApiQueue[i].callback);
        }
        _vkApiQueue = null;
    }
}
}
