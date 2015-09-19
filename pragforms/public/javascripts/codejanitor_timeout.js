//Modified from http://codejanitor.com/wp/2006/03/23/ajax-timeouts-with-prototype/
//More substantially rewritten than I originally hoped. (stu at relevancellc.com)
if (!Ajax.Timeout) {
  Ajax.Timeout = {
    callInProgress: function(xmlhttp) {
      switch (xmlhttp.readyState) {
        case 1: case 2: case 3:
        return true;
        break;
        // Case 4 and 0
        default:
        return false;
        break;
      }
    },
    //override in your own applications
    handler: function(request) {
      alert("Call failed to " + request.url);
    },
  }
}
Ajax.Responders.register({
  onCreate: function(request) {
    if (Ajax.Timeout.globalTimeout) {
      request['timeoutId'] = window.setTimeout(
        (function() {
          if (this.callInProgress(request.transport)) {
            request.transport.abort();
            this.lastTimeout = request;
            this.handler(request);
            //prevent status check from failing after abort (?)
            request.responseIsSuccess = function() {return false;}
            request.respondToReadyState(4);
          }
        }).bind(Ajax.Timeout),
      Ajax.Timeout.globalTimeout * 1000);
    }
  },
  onComplete: function(request) {
    if (request['timeoutId']) {
      window.clearTimeout(request['timeoutId']);
    }
  }
});  
