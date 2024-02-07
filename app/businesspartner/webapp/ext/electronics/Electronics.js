sap.ui.define([
    "sap/m/MessageToast"
], function(MessageToast) {
    'use strict';

    return {
        SetVendor: function (oBindingContext, aSelectedContexts) {
            aSelectedContexts.forEach((element) => {
              //MessageToast.show(element.sPath);
              var oData = jQuery
                .ajax({
                  type: "PATCH",
                  contentType: "application/json",
                  url: "/odata/v4/electronics" + element.sPath,
                  data: JSON.stringify({ is_vendor: true }),
                })
                .then(element.requestRefresh());
            });
          },
          SetVendor: function (oBindingContext, aSelectedContexts) {
            aSelectedContexts.forEach((element) => {
              //MessageToast.show(element.sPath);
              var oData = jQuery
                .ajax({
                  type: "PATCH",
                  contentType: "application/json",
                  url: "/odata/v4/electronics" + element.sPath,
                  data: JSON.stringify({ is_vendor: true }),
                })
                .then(element.requestRefresh());
            });
          },
    };
});
