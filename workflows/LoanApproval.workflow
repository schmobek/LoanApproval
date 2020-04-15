{
	"contents": {
		"f0fc6695-ca48-46bd-a571-425c68fa15e1": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "loanapproval",
			"subject": "LoanApproval",
			"name": "LoanApproval",
			"documentation": "Test for loan approval",
			"lastIds": "9338c224-6518-43d3-98ae-a2dc7d222f13",
			"events": {
				"70ce8b4a-edd8-4c74-928f-70d39827b758": {
					"name": "StartEvent1"
				},
				"1e5f450a-439c-43bd-b67d-c6e925722f59": {
					"name": "EndEvent1"
				},
				"d479d3be-dba7-43de-b7ad-6ae84dbc626e": {
					"name": "CancelAfterOneHoer"
				}
			},
			"activities": {
				"f2041527-5869-4b33-9d31-25eea4ee8f3a": {
					"name": "ApproveLoan"
				},
				"442d0857-2b44-426d-b6b2-b870acdc234d": {
					"name": "ProcessReleaseRule"
				},
				"38371633-79b0-4ab9-bbde-cca31c75d815": {
					"name": "PrepareRules"
				},
				"dd191ddf-cb33-4fe2-95a1-de885cf27d04": {
					"name": "ApprovalRequired"
				}
			},
			"sequenceFlows": {
				"51e7784f-70a0-4722-943a-9fb81df314d4": {
					"name": "SequenceFlow1"
				},
				"55628935-e5cb-490d-a10d-e6538467794c": {
					"name": "SequenceFlow2"
				},
				"7f9cc8f4-1079-42fd-b2d8-7fece129df65": {
					"name": "SequenceFlow3"
				},
				"953b5959-5576-464d-b6fe-af5f2be7a27a": {
					"name": "SequenceFlow6"
				},
				"98be232a-e3ee-45ad-8fa8-20943126223b": {
					"name": "SequenceFlow7"
				},
				"314107da-ac5a-4096-a46b-4aeb866e9fae": {
					"name": "No"
				},
				"4cf0be76-f70a-45a7-8d9c-65636aecba67": {
					"name": "Yes"
				}
			},
			"diagrams": {
				"a2d7e1b9-6098-49f0-9e8e-952c0cdd3559": {}
			}
		},
		"70ce8b4a-edd8-4c74-928f-70d39827b758": {
			"classDefinition": "com.sap.bpm.wfs.StartEvent",
			"id": "startevent1",
			"name": "StartEvent1",
			"sampleContextRefs": {
				"7209c59b-270f-425e-ac71-6e516a90da52": {}
			}
		},
		"1e5f450a-439c-43bd-b67d-c6e925722f59": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent1",
			"name": "EndEvent1"
		},
		"d479d3be-dba7-43de-b7ad-6ae84dbc626e": {
			"classDefinition": "com.sap.bpm.wfs.BoundaryEvent",
			"isCanceling": true,
			"id": "boundarytimerevent1",
			"name": "CancelAfterOneHoer",
			"attachedToRef": "f2041527-5869-4b33-9d31-25eea4ee8f3a",
			"eventDefinitions": {
				"9423d4f5-04e9-42d9-a5f1-4f76fa8bd098": {}
			}
		},
		"f2041527-5869-4b33-9d31-25eea4ee8f3a": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Approve Loan Application for ${context.applicant.PartnerID}",
			"description": "The following loan application was requested by ${context.applicant.FirstName} ${context.applicant.LastName}. Please validate and process ",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"userInterface": "sapui5://html5apps/bpmformplayer/com.sap.bpm.wus.form.player",
			"recipientUsers": "S0013821860",
			"formReference": "/forms/LoanApproval/ApproveLoan.form",
			"userInterfaceParams": [{
				"key": "formId",
				"value": "approveloan"
			}, {
				"key": "formRevision",
				"value": "1.0"
			}],
			"customAttributes": [],
			"id": "usertask1",
			"name": "ApproveLoan"
		},
		"442d0857-2b44-426d-b6b2-b870acdc234d": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "RULES_SERVICE",
			"path": "/rules-service/rest/v1/rule-services/java/Origination/CheckApproval",
			"httpMethod": "POST",
			"xsrfPath": "/rules-service/v1/rules/xsrf-token",
			"requestVariable": "${context.LoanRequest}",
			"responseVariable": "${context.LoanRequestResult}",
			"id": "servicetask1",
			"name": "ProcessReleaseRule"
		},
		"38371633-79b0-4ab9-bbde-cca31c75d815": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/LoanApproval/PrepareRules.js",
			"id": "scripttask1",
			"name": "PrepareRules",
			"documentation": "Prepare for rule mapping"
		},
		"dd191ddf-cb33-4fe2-95a1-de885cf27d04": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway3",
			"name": "ApprovalRequired",
			"default": "314107da-ac5a-4096-a46b-4aeb866e9fae"
		},
		"51e7784f-70a0-4722-943a-9fb81df314d4": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow1",
			"name": "SequenceFlow1",
			"sourceRef": "70ce8b4a-edd8-4c74-928f-70d39827b758",
			"targetRef": "38371633-79b0-4ab9-bbde-cca31c75d815"
		},
		"55628935-e5cb-490d-a10d-e6538467794c": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow2",
			"name": "SequenceFlow2",
			"sourceRef": "f2041527-5869-4b33-9d31-25eea4ee8f3a",
			"targetRef": "1e5f450a-439c-43bd-b67d-c6e925722f59"
		},
		"7f9cc8f4-1079-42fd-b2d8-7fece129df65": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow3",
			"name": "SequenceFlow3",
			"sourceRef": "d479d3be-dba7-43de-b7ad-6ae84dbc626e",
			"targetRef": "1e5f450a-439c-43bd-b67d-c6e925722f59"
		},
		"953b5959-5576-464d-b6fe-af5f2be7a27a": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow6",
			"name": "SequenceFlow6",
			"sourceRef": "442d0857-2b44-426d-b6b2-b870acdc234d",
			"targetRef": "dd191ddf-cb33-4fe2-95a1-de885cf27d04"
		},
		"98be232a-e3ee-45ad-8fa8-20943126223b": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow7",
			"name": "SequenceFlow7",
			"sourceRef": "38371633-79b0-4ab9-bbde-cca31c75d815",
			"targetRef": "442d0857-2b44-426d-b6b2-b870acdc234d"
		},
		"314107da-ac5a-4096-a46b-4aeb866e9fae": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow13",
			"name": "No",
			"sourceRef": "dd191ddf-cb33-4fe2-95a1-de885cf27d04",
			"targetRef": "1e5f450a-439c-43bd-b67d-c6e925722f59"
		},
		"4cf0be76-f70a-45a7-8d9c-65636aecba67": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${context.LoanRequestResult.Needs_Approval==true}",
			"id": "sequenceflow14",
			"name": "Yes",
			"documentation": "Approval Required",
			"sourceRef": "dd191ddf-cb33-4fe2-95a1-de885cf27d04",
			"targetRef": "f2041527-5869-4b33-9d31-25eea4ee8f3a"
		},
		"a2d7e1b9-6098-49f0-9e8e-952c0cdd3559": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"53e57860-1c0c-4e44-9230-ea1527142362": {},
				"a23a3094-47f6-40dc-9d7d-35e4d6e2e784": {},
				"82b68108-593e-443c-a80a-774879877345": {},
				"c83d7e3f-6b04-4fa7-a604-1fee4add5a44": {},
				"d2f72e33-2e51-46ab-9791-a91f024c9917": {},
				"deffbb97-c6dc-4f49-8161-ea6e2e43d7f0": {},
				"df1202bf-949b-4604-bb28-baeaa6893204": {},
				"73668495-ced3-4de8-b3c6-043d2c48af5b": {},
				"a7178098-f773-440e-a211-929e13d331c2": {},
				"723f6011-e4a3-4698-aa56-913fd98315f2": {},
				"60eb850d-f0c9-4c87-b149-3a58f594f137": {},
				"d5f25153-5e2b-4ee4-bff3-d869e7f7798e": {},
				"6e6dbc7c-8ef9-4622-9fcf-223dc790b8c5": {}
			}
		},
		"7209c59b-270f-425e-ac71-6e516a90da52": {
			"classDefinition": "com.sap.bpm.wfs.SampleContext",
			"reference": "/sample-data/LoanApproval/LoanRequestData.json",
			"id": "default-start-context"
		},
		"9423d4f5-04e9-42d9-a5f1-4f76fa8bd098": {
			"classDefinition": "com.sap.bpm.wfs.TimerEventDefinition",
			"timeDuration": "PT1H",
			"id": "timereventdefinition1"
		},
		"53e57860-1c0c-4e44-9230-ea1527142362": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": 12,
			"y": 73.99999970197678,
			"width": 32,
			"height": 32,
			"object": "70ce8b4a-edd8-4c74-928f-70d39827b758"
		},
		"a23a3094-47f6-40dc-9d7d-35e4d6e2e784": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 675.9999976158142,
			"y": 72.49999970197678,
			"width": 35,
			"height": 35,
			"object": "1e5f450a-439c-43bd-b67d-c6e925722f59"
		},
		"82b68108-593e-443c-a80a-774879877345": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "44,89.99999970197678 94,89.99999970197678",
			"sourceSymbol": "53e57860-1c0c-4e44-9230-ea1527142362",
			"targetSymbol": "a7178098-f773-440e-a211-929e13d331c2",
			"object": "51e7784f-70a0-4722-943a-9fb81df314d4"
		},
		"c83d7e3f-6b04-4fa7-a604-1fee4add5a44": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 505.9999988079071,
			"y": 12,
			"width": 100,
			"height": 60,
			"object": "f2041527-5869-4b33-9d31-25eea4ee8f3a",
			"symbols": {
				"9e55fc6c-d20a-480a-9add-5fa674398b6f": {}
			}
		},
		"d2f72e33-2e51-46ab-9791-a91f024c9917": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "505.9999988079071,12 470.99999940395355,12 470.99999940395355,167.99999940395355 640.9999982118607,167.99999940395355 640.9999982118607,89.99999970197678 675.9999976158142,89.99999970197678",
			"sourceSymbol": "c83d7e3f-6b04-4fa7-a604-1fee4add5a44",
			"targetSymbol": "a23a3094-47f6-40dc-9d7d-35e4d6e2e784",
			"object": "55628935-e5cb-490d-a10d-e6538467794c"
		},
		"deffbb97-c6dc-4f49-8161-ea6e2e43d7f0": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "555.9999988079071,88 555.9999988079071,122.99999940395355 640.9999982118607,122.99999940395355 640.9999982118607,89.99999970197678 675.9999976158142,89.99999970197678",
			"sourceSymbol": "9e55fc6c-d20a-480a-9add-5fa674398b6f",
			"targetSymbol": "a23a3094-47f6-40dc-9d7d-35e4d6e2e784",
			"object": "7f9cc8f4-1079-42fd-b2d8-7fece129df65"
		},
		"df1202bf-949b-4604-bb28-baeaa6893204": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 244.00000000000006,
			"y": 59.999999701976776,
			"width": 100,
			"height": 60,
			"object": "442d0857-2b44-426d-b6b2-b870acdc234d"
		},
		"73668495-ced3-4de8-b3c6-043d2c48af5b": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "344,89.99999970197678 394,89.99999970197678",
			"sourceSymbol": "df1202bf-949b-4604-bb28-baeaa6893204",
			"targetSymbol": "60eb850d-f0c9-4c87-b149-3a58f594f137",
			"object": "953b5959-5576-464d-b6fe-af5f2be7a27a"
		},
		"a7178098-f773-440e-a211-929e13d331c2": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 94,
			"y": 59.999999701976776,
			"width": 100,
			"height": 60,
			"object": "38371633-79b0-4ab9-bbde-cca31c75d815"
		},
		"723f6011-e4a3-4698-aa56-913fd98315f2": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "194,89.99999970197678 244,89.99999970197678",
			"sourceSymbol": "a7178098-f773-440e-a211-929e13d331c2",
			"targetSymbol": "df1202bf-949b-4604-bb28-baeaa6893204",
			"object": "98be232a-e3ee-45ad-8fa8-20943126223b"
		},
		"60eb850d-f0c9-4c87-b149-3a58f594f137": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 394,
			"y": 68.99999970197678,
			"object": "dd191ddf-cb33-4fe2-95a1-de885cf27d04"
		},
		"d5f25153-5e2b-4ee4-bff3-d869e7f7798e": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "436,89.99999970197678 470.99999940395355,89.99999970197678 470.99999940395355,167.99999940395355 640.9999982118607,167.99999940395355 640.9999982118607,89.99999970197678 675.9999976158142,89.99999970197678",
			"sourceSymbol": "60eb850d-f0c9-4c87-b149-3a58f594f137",
			"targetSymbol": "a23a3094-47f6-40dc-9d7d-35e4d6e2e784",
			"object": "314107da-ac5a-4096-a46b-4aeb866e9fae"
		},
		"6e6dbc7c-8ef9-4622-9fcf-223dc790b8c5": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "436,89.99999970197678 470.99999940395355,89.99999970197678 470.99999940395355,12 505.9999988079071,12",
			"sourceSymbol": "60eb850d-f0c9-4c87-b149-3a58f594f137",
			"targetSymbol": "c83d7e3f-6b04-4fa7-a604-1fee4add5a44",
			"object": "4cf0be76-f70a-45a7-8d9c-65636aecba67"
		},
		"9e55fc6c-d20a-480a-9add-5fa674398b6f": {
			"classDefinition": "com.sap.bpm.wfs.ui.BoundaryEventSymbol",
			"x": 539.9999988079071,
			"y": 56,
			"object": "d479d3be-dba7-43de-b7ad-6ae84dbc626e"
		},
		"9338c224-6518-43d3-98ae-a2dc7d222f13": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"timereventdefinition": 1,
			"sequenceflow": 14,
			"startevent": 1,
			"boundarytimerevent": 1,
			"endevent": 1,
			"usertask": 1,
			"servicetask": 1,
			"scripttask": 1,
			"mailtask": 1,
			"exclusivegateway": 3,
			"parallelgateway": 2
		}
	}
}