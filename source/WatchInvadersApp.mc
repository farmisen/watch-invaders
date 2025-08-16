using Toybox.Application;
using Toybox.WatchUi;

class WatchInvadersApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    function onStart(state) {
    }

    function onStop(state) {
    }

    function getInitialView() {
        var view = new WatchInvadersView();
        var delegate = new WatchInvadersDelegate();
        delegate.setView(view);
        return [ view, delegate ];
    }
}

function getApp() {
    return Application.getApp();
}