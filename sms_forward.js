// This is a simple AWS Lambda for forwarding SMS messages on twilio.

console.log('Loading function');
var queryString = require('querystring');

exports.handler = function(event, context) {
    var output = '<?xml version="1.0" encoding="UTF-8"?>';
    qryObject = queryString.parse(event.reqbody);

    output+='<Response><Message to="+14155551212">';
    output+= qryObject['From'] + " : " + qryObject['Body'];
    output+='</Message></Response>';

    context.succeed(output);
};
