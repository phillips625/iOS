//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

////////////////// Using SLRequest and the Account Framework
Both the SLRequest class and the Accounts Framework are required in order to interact with the API of a social network. Implementation follows a standard sequence of events which can be summarized as follows:
1. The application requests access to one of the user’s social network accounts as configured in the Settings app. This is achieved via a call to the requestAccessToAccountsWithType method of the ACAccountStore class, passing through as an argument the type of social network for which access is being requested together with a range of options depending on the target service.
2. An SLRequest instance is created and initialized with the URL required by the service for interaction, the HTTP request type to be used (GET, POST etc) and any additional parameters required by the API of the service.
3. The account object created in step 1 above is assigned to the account property of the SLRequest object created in step 2.
4. The request is sent to the target social network service via a call to the performRequestWithHandler method of the SLRequest object. The results from the request are passed to the handler code together with an NSError object containing information about the reason for any failure.

