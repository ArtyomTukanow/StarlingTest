package engine.Net {
import flash.events.EventDispatcher;
import flash.external.ExternalInterface;

public class VKConnector extends EventDispatcher{

    private static var _instance:VKConnector = new VKConnector();
    public static function get Instance():VKConnector { return _instance; }

    private var _isInited:Boolean = false;//показывает подключено ли приложение к ВК

    public function VKConnector() {
        if(ExternalInterface.available) {
            ExternalInterface.addCallback("successfulInit", successfulInit);
            ExternalInterface.addCallback("successfulRequest", successfulRequest);
            ExternalInterface.call("initVK");
        } else {
            trace("ExternalInterface is not available");
        }
    }

    private function successfulInit():void {
        _isInited = true;
        for(var i:int = 0; i < _vkApiQueue.length; i ++) {
            vkApi(_vkApiQueue[i].methodName,_vkApiQueue[i].params,_vkApiQueue[i].callback);
        }
        _vkApiQueue = null;
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
//        if(data && data["error"]) {
//            buildErrorMessage(data.error, "error");
//            alert(_errorMessage);
//            _errorMessage = "";
//        }
        _functionQueue[callbackId](data);
        _functionQueue[callbackId] = null;
    }

//    private var _errorMessage:String = "";
//    private function buildErrorMessage(error:Object, objectName:String):void {
//        var isObj:Boolean = false;
//        for (var s:String in error) {
//            isObj = true;
//            _errorMessage += " { ";
//            buildErrorMessage(error[s], s);
//            _errorMessage += " } ";
//        }
//        if(!isObj)
//            _errorMessage += objectName + ": " + error + " ";
//    }

    //получает список друзей c полями id, first_name, online, photo_50
    public function getFriends(callback:Function):void {
        vkApi("friends.get", {fields:"id, first_name, online, photo_50"}, callback);
    }

    //Создает список друзей, который будет использоваться при отправке пользователем приглашений в приложение (не играют в игру)
    public function appsGetInviteFriendsList(callback:Function):void {
        vkApi("apps.getFriendsList", {extended:1, type:"invite", fields:"id, first_name, online, photo_50"}, callback);
    }

    //Создает список друзей, который будет использоваться при отправке пользователем игровых запросов (уже играют)
    public function appsGetRequestFriendsList(callback:Function):void {
        vkApi("apps.getFriendsList", {extended:1, type:"request", fields:"id, first_name, online, photo_50"}, callback);
    }

    //Создает список друзей, который будет использоваться при отправке пользователем игровых запросов (уже играют)
    public function appsSendRequest(userId:String, requestType:String, callback:Function):void {
        if(requestType == "request")
            vkApi("apps.sendRequest", {type:"request", user_id:userId, text:"Войди в приложение!", name:"Login"}, callback);
        else
            vkApi("apps.sendRequest", {type:"invite", user_id:userId, text:"Зарегистрируйся в приложение!", name:"Register"}, callback);
    }

    public function showRequestBox(userId:int, onComplete:Function, onError:Function):void {
        _functionQueue[_idCounter] = onComplete;
        _functionQueue[_idCounter+1] = onError;
        ExternalInterface.call("showRequestBox", userId, "Заходи в игру!", "loginKey", _idCounter, _idCounter+1);
        _idCounter += 2;
    }

    public function showInviteBox(onComplete:Function, onError:Function):void {
        _functionQueue[_idCounter] = onComplete;
        _functionQueue[_idCounter+1] = onError;
        ExternalInterface.call("showInviteBox", _idCounter, _idCounter+1);
        _idCounter += 2;
    }



    //Создает список друзей, который будет использоваться при отправке пользователем игровых запросов (уже играют)
    public function postOnTheWall(userId:String, callback:Function):void {
            vkApi("wall.post", {owner_id:userId, message:"Войди в приложение!", attachments:"https://vk.com/app6717724"}, callback);
    }

    public function alert(message:String):void {
        ExternalInterface.call("Alert", message);
    }
}
}
