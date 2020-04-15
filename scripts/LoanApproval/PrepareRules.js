// payload for rule service call

var LoanRequestData = $.context; 
var LoanRequest = {};

LoanRequest.__type__= "Request";
LoanRequest.Income   = LoanRequestData.income;
LoanRequest.Amount   = LoanRequestData.amount;
LoanRequest.Currency = LoanRequestData.currency;
LoanRequest.Rating   = LoanRequestData.applicant.Rating;

$.context.LoanRequest = LoanRequest;

/*
{
    "RuleServiceId": "1d30e5d50048494081be5654ea55aa63",
    "Vocabulary": [
        {
            "Input": {
                "VALUE": 5100
            }
        }
    ]
}


/*
// read from existing workflow context 
var productInfo = $.context.productInfo; 
var productName = productInfo.productName; 
var productDescription = productInfo.productDescription;

// read contextual information
var taskDefinitionId = $.info.taskDefinitionId;

// read user task information
var lastUserTask1 = $.usertasks.usertask1.last;
var userTaskSubject = lastUserTask1.subject;
var userTaskProcessor = lastUserTask1.processor;
var userTaskCompletedAt = lastUserTask1.completedAt;

var userTaskStatusMessage = " User task '" + userTaskSubject + "' has been completed by " + userTaskProcessor + " at " + userTaskCompletedAt;

// create new node 'product'
var product = {
		productDetails: productName  + " " + productDescription,
		workflowStep: taskDefinitionId
};

// write 'product' node to workflow context
$.context.product = product;
*/
