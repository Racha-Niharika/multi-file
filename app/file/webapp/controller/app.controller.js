sap.ui.define([
	"sap/ui/core/mvc/Controller",
	"sap/m/MessageToast"
],
	function (
		Controller,
		MessageToast
	) {
		"use strict";

		return Controller.extend("file.controller.app", {
			onInit: function () {
				console.log("init fired")
			},

			onAfterItemAdded: function (oEvent) {
                console.log("Hello")
				var item = oEvent.getParameter("item")
                console.log(item);
				this._createEntity(item)
				.then((id) => {
					this._uploadContent(item, id);
				})
				.catch((err) => {
					console.log(err);
				})
			},

			onUploadCompleted: function (oEvent) {
				var oUploadSet = this.byId("uploadSet");
				oUploadSet.removeAllIncompleteItems();
				oUploadSet.getBinding("items").refresh();
			},

			onOpenPressed: function (oEvent) {	
				// to be implemented			
			},

			_createEntity: function (item) {
					var data = {
						mediaType: item.getMediaType(),
						fileName: item.getFileName(),
						size: item.getFileObject().size
					};
                    console.log(data);
					var settings = {
						url: "/attachments/Files",
						method: "POST",
						headers: {
							"Content-type": "application/json"
						},
						data: JSON.stringify(data)
					}
	
				return new Promise((resolve, reject) => {
					$.ajax(settings)
						.done((results, textStatus, request) => {
							resolve(results.ID);
						})
						.fail((err) => {
							reject(err);
						})
				})				
			},

			_uploadContent: function (item, id) {
				var url = `/attachments/Files(${id})/content`
				item.setUploadUrl(url);	
				var oUploadSet = this.byId("uploadSet");
				oUploadSet.setHttpRequestMethod("PUT")
				oUploadSet.uploadItem(item);
			}			
		});
	});