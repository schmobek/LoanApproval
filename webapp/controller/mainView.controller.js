sap.ui.define([



	"sap/ui/core/mvc/Controller"
], function (Controller) {
	"use strict";

	return Controller.extend("ifb.loan.LoanApplication.controller.mainView", {
		submitRequest: function () {
			var token = this._fetchToken();
			this._startInstance(token);
		},
		
		_fetchToken: function () {
			var token;
			$.ajax({
				url: "/bpmworkflowruntime/rest/v1/xsrf-token",
				method: "GET",
				async: false,
				headers: {
					"X-CSRF-Token": "Fetch"
				},
				success: function (result, xhr, data) {
					token = data.getResponseHeader("X-CSRF-Token");
				}
			});
			return token;
		},

		_startInstance: function (token) {
			var loanModel = this.getView().getModel("LoanApplication");
			$.ajax({
				url: "/bpmworkflowruntime/rest/v1/workflow-instances",
				method: "POST",
				async: false,
				contentType: "application/json",
				headers: {
					"X-CSRF-Token": token
				},

				// build up string with numbers ( conversion to float )             
				data: JSON.stringify({
					"definitionId": "loanapproval",
					"context": {
						"applicant": {
							"PartnerID": "4711",
							"Rating": "AAB",
							"FirstName": loanModel.oData.FirstName ,
							"LastName":  loanModel.oData.LastName,
						},
						"amount": parseFloat( loanModel.oData.Amount ) ,
						"income": parseFloat( loanModel.oData.Income ),
						"currency": "USD"
					}
				}),
				success: function (result, xhr, data) {
					loanModel.setProperty("/result", JSON.stringify(result, null, 4));
				}
			});
		}
	});
});