package gui.elements.panels {
import starling.events.Event;

public class FriendPanel extends PagePanelBase {

    protected override function get elementType():Class { return FriendElement; }

    public function FriendPanel(data:Vector.<Object>) {
        super(data,4,2);
        _columnsInterval = 250;
        _linesInterval = 65;
    }

    protected override function onAddedToStage(event:Event):void {
        super.onAddedToStage(event);
        _prefBtn.rotation = -Math.PI/2;
        _nextBtn.rotation = Math.PI/2;
        _prefBtn.y = _linesInterval*_lines/2-_prefBtn.height+_prefBtn.height/2;
        _nextBtn.y = _linesInterval*_lines/2-_nextBtn.height-_nextBtn.height/2;
        _prefBtn.x = -45;
        _nextBtn.x = _columnsInterval*(_columns+1)/2 + 120;
        create();
    }
}
}
