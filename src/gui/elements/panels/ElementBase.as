package gui.elements.panels {
import gui.elements.panels.PagePanelBase;

import starling.display.Sprite;
import starling.events.Event;

public class ElementBase extends Sprite {
    private var _data:Object;
    protected var _parent:PagePanelBase;

    public function get data():Object {
        return _data;
    }
    public function set data(value:Object):void {
        _data = value;
        update();
    }

    public function ElementBase(parent:PagePanelBase) {
        _parent = parent;
        this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }

    protected function onAddedToStage(event:Event):void {

    }

    public function update():void {

    }
}
}
