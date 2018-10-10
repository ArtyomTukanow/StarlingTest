package gui.windows.base {
import starling.display.Sprite;
import starling.events.Event;

public class WindowBase extends Sprite {

    public function WindowBase() {
        super();
        this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }

    private function onAddedToStage(event:Event):void {
        buildWindow();
    }

    //overriding function
    protected function buildWindow():void {
    }

}
}
