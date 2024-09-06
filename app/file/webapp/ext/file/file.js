sap.ui.define([
    "sap/m/MessageToast"
], function(MessageToast) {
    'use strict';

    return {
        file: function(oEvent) {
            MessageToast.show("Custom handler invoked.");
        }
    };
});
