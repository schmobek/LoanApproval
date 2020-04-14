sap.ui.define([
	"sap/ui/core/mvc/Controller"
], function (Controller) {
	"use strict";

	return Controller.extend("ifb.loan.LoanApplication.controller.mainView", {
		submitRequest: function () {
			//var userModel = this.getView().getModel("user");
			var loanModel = this.getView().getModel("loanapplication");

			var context = JSON.stringify({
				"definitionId": "loanapprovaltest",
				"context": {
					"applicant": {
						"PartnerID": "4711",
						"Rating": "AAB",
						"FirstName": loanModel.oData.FirstName,
						"LastName": loanModel.oData.LastName
					},
					"amount": loanModel.oData.Amount,
					"income": loanModel.oData.Income,
					"currency": "USD"
				}
			});

			$.ajax({
				type: "GET",
				url: "/bpmworkflowruntime/v1/xsrf-token",
				headers: {
					"x-csrf-token": "Fetch"
				},
				success: function (data, statusText, xhr) {
					var token = xhr.getResponseHeader("X-CSRF-Token");

					$.ajax({
						type: "POST",
						url: "/bpmworkflowruntime/v1/workflow-instances",
						data: context,
						headers: {
							"x-csrf-token": token
						},
						success: function () {
							sap.m.MessageToast.show("Your user creation request has been submitted for approval!");
						},
						error: function (errMsg) {
							sap.m.MessageToast.show("XSRF token request didn't work: " + errMsg.statusText);
						},
						dataType: "json",
						contentType: "application/json"
					});
				},
				error: function (errMsg) {
					sap.m.MessageToast.show("Didn't work: " + errMsg.statusText);
				},
				contentType: "application/json"
			});
		}
	});
});