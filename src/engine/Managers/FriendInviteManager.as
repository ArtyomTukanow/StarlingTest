package engine.Managers {
import engine.Utils.NetLoader;
import flash.display.Bitmap;
import flash.events.Event;

public class FriendInviteManager {

    private static var _instance:FriendInviteManager = new FriendInviteManager();
    public static function get Instance():FriendInviteManager { return _instance; }

    public function FriendInviteManager() {
        if(_instance) {
            throw new Error("Instance already created");
        }
    }

    private var offlineFriendsData:Object = [
        {name:"Alex", id:"0", avatar:"https://pp.userapi.com/yUTl2JgdJyhKAh3w0RnTpbzfL4YsVuqdhWPeAw/huXiaPxzCfU.jpg?ava=1"},
        {name:"Илья", id:"0", avatar:"https://vk.com/images/camera_50.png?ava=1"},
        {name:"Антон", id:"0", avatar:"https://vk.com/images/camera_50.png?ava=1"},
        {name:"Ирина", id:"0", avatar:"https://pp.userapi.com/c850128/v850128188/116a1/ZEbM284CB3w.jpg?ava=1"},
        {name:"Юлия", id:"0", avatar:"https://pp.userapi.com/c849232/v849232985/90099/usv63y5Evg0.jpg?ava=1"},
        {name:"Станислав", id:"0", avatar:"https://vk.com/images/camera_50.png?ava=1"},
        {name:"Leshka", id:"0", avatar:"https://pp.userapi.com/c840639/v840639818/58e2a/uzl8p9AjZCA.jpg?ava=1"},
        {name:"Георгий", id:"0", avatar:"https://pp.userapi.com/c636526/v636526006/1a3f7/-23YCxTBmpg.jpg?ava=1"},
        {name:"Михаил", id:"0", avatar:"https://pp.userapi.com/c846123/v846123296/83d97/ogcmZuCjUcY.jpg?ava=1"},
        {name:"Валерия", id:"0", avatar:"https://pp.userapi.com/c639921/v639921760/58a8a/-DfrXczm47I.jpg?ava=1"},
        {name:"Елена", id:"0", avatar:"https://pp.userapi.com/c846122/v846122622/2b2fe/6ONh5V6MqgU.jpg?ava=1"},
        {name:"Дмитрий", id:"0", avatar:"https://pp.userapi.com/c849128/v849128187/456dd/k_j23Fb5F6c.jpg?ava=1"},
        {name:"Николай", id:"0", avatar:"https://pp.userapi.com/c639322/v639322879/44313/RBvTjNmv8vE.jpg?ava=1"},
        {name:"Наталья", id:"0", avatar:"https://pp.userapi.com/c851124/v851124528/3416/JPm62ODq87c.jpg?ava=1"},
        {name:"Ваня", id:"0", avatar:"https://pp.userapi.com/c850020/v850020236/28ea5/mnncYFhlJ6A.jpg?ava=1"},
        {name:"Slava", id:"0", avatar:"https://pp.userapi.com/c845522/v845522883/5b5cd/GhJcCSyfHw4.jpg?ava=1"},
        {name:"Иван", id:"0", avatar:"https://pp.userapi.com/c844721/v844721115/e2560/ez1lFDZ4jWk.jpg?ava=1"}
    ];

    private var onlineFriendsData:Object = [
        {name:"Андрей", id:"0", avatar:"https://pp.userapi.com/c845216/v845216193/e13f9/7BHCT4Jl-R0.jpg?ava=1"},
        {name:"Данил", id:"0", avatar:"https://pp.userapi.com/c840025/v840025839/71df1/fZH4Nw0Nhy0.jpg?ava=1"},
        {name:"Федор", id:"0", avatar:"https://pp.userapi.com/c639321/v639321997/3ceaa/j5SfDgKOtqk.jpg?ava=1"},
        {name:"Сергей", id:"0", avatar:"https://pp.userapi.com/c849520/v849520091/8a341/UNEypEVMjk4.jpg?ava=1"},
        {name:"Коля", id:"0", avatar:"https://pp.userapi.com/c626422/v626422976/4e0a5/A2Mx4xjY_IY.jpg?ava=1"},
        {name:"Татьяна", id:"0", avatar:"https://pp.userapi.com/c624419/v624419942/5074b/FZKyiBP2IM0.jpg?ava=1"}
    ];

    public function getOnlineFriendsData():Array {
        return onlineFriendsData as Array;
    }

    public function getOfflineFriendsData():Array {
        return offlineFriendsData as Array;
    }


    public function getAvatarTexture(friendData:Object, onTextureLoaded:Function):void {
        NetLoader.loadTextureFromURL(friendData.avatar, onTextureLoaded);
    }
}
}
