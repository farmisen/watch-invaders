using Toybox.WatchUi;
using Toybox.System;

class WatchInvadersDelegate extends WatchUi.BehaviorDelegate {

    var view;

    function initialize() {
        BehaviorDelegate.initialize();
        view = null;
    }
    
    function setView(v) {
        view = v;
    }

    function onMenu() {
        return true;
    }

    function onKey(keyEvent) {
        var key = keyEvent.getKey();
        
        if (key == WatchUi.KEY_ENTER || key == WatchUi.KEY_START) {
            view.fire();
            return true;
        } else if (key == WatchUi.KEY_UP) {
            view.fire();
            return true;
        } else if (key == WatchUi.KEY_DOWN) {
            view.fire();
            return true;
        } else if (key == WatchUi.KEY_ESC) {
            return false;
        }
        
        return false;
    }

    function onSwipe(swipeEvent) {
        var direction = swipeEvent.getDirection();
        
        if (direction == WatchUi.SWIPE_LEFT) {
            view.moveLeft();
            return true;
        } else if (direction == WatchUi.SWIPE_RIGHT) {
            view.moveRight();
            return true;
        }
        
        return false;
    }
    
    function onTap(clickEvent) {
        var coords = clickEvent.getCoordinates();
        var deviceSettings = System.getDeviceSettings();
        var screenWidth = deviceSettings.screenWidth;
        
        if (coords[0] < screenWidth / 2) {
            view.moveLeft();
        } else {
            view.moveRight();
        }
        
        return true;
    }
    
    function onNextPage() {
        view.moveRight();
        return true;
    }
    
    function onPreviousPage() {
        view.moveLeft();
        return true;
    }
    
    function onSelect() {
        view.fire();
        return true;
    }
}