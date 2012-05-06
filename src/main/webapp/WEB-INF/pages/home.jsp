<%@ include file="/WEB-INF/pages/includes/taglibs.jsp"%>

<section id="content" class="cf">

	  <h2 class="head">Welcome</h2>

      <div id="content" class="prepend-1 span-17 prepend-top last">
          <ul id="messages">
              <li id="placeHolder">Waiting...</li>
          </ul>
      </div>
      <div id="stats" class="prepend-1 span-4 append-1 prepend-top last">
          <table id="asynchHttpStats">
              <caption>AsynchHttp Stats</caption>
              <thead>
                  <tr>
                      <th></th>
                      <th></th>
                  </tr>
              </thead>
              <tbody>
                  <tr>
                      <td>Protocol</td>
                      <td id="transportType">N/A</td>
                  </tr>
              </tbody>
          </table>
          <table id="chartableStats">
              <caption>Stats</caption>
              <thead>
                  <tr>
                      <th scope="col"></th>
                      <th scope="col"></th>
                  </tr>
              </thead>
              <tbody>
	                  <tr>
	                      <th scope="row" style="color: #1751A7"># of Callbacks</th>
	                <td id="numberOfCallbackInvocations">0</td>
	            </tr>                   
	            <tr>
	                <th scope="row" style="color: #A74217"># Errors</th>
	                <td id="numberOfErrors">0</td>
	            </tr>
	        </tbody>
	    </table>
	</div>
       
</section>

<script type="text/javascript">


if (!window.WebSocket)
    alert("WebSocket not supported by this browser");

    $(function() {

        var asyncHttpStatistics = {
                transportType: 'N/A',
                responseState: 'N/A',
                numberOfCallbackInvocations: 0,
                numberOfErrors: 0
            };

        var connectedEndpoint;
        var callbackAdded = false;

        function refresh() {

            console.log("Refreshing data tables...");

            $('#transportType').html(asyncHttpStatistics.transportType);
            $('#responseState').html(asyncHttpStatistics.responseState);
            $('#numberOfCallbackInvocations').html(asyncHttpStatistics.numberOfCallbackInvocations);
            $('#numberOfErrors').html(asyncHttpStatistics.numberOfErrors);

        }

        function callback(response) {
            asyncHttpStatistics.numberOfCallbackInvocations++;
            asyncHttpStatistics.transportType = response.transport;
            asyncHttpStatistics.responseState = response.responseState;

            $.atmosphere.log('info', ["response.state: " + response.state]);
            $.atmosphere.log('info', ["response.transport: " + response.transport]);
            if (response.transport != 'polling' && response.state != 'connected' && response.state != 'closed') {
                $.atmosphere.log('info', ["response.responseBody: " + response.responseBody]);
                if (response.status == 200) {
                    var data = response.responseBody;
                    
                    if (data) {

                      try {
                    
	                      var visible = $('#placeHolder').is(':visible');
	
	                      if (data.length > 0 && visible) {
	                          $("#placeHolder").fadeOut();
	                      }
	
	                      if (data.length > 0) {
	
	                      	$('#messages').prepend($('<li></li>').text(" Message Received: " + data).fadeIn());
	
	                      }  
                     } catch (error) {
                         asyncHttpStatistics.numberOfErrors++;
                         console.log("An error ocurred: " + error);
                     }
                } else {
                    console.log("response.responseBody is null - ignoring.");
                }
              }
           }

           refresh();
        }

        $.atmosphere.subscribe("<c:url value='/subscribe/'/>",
				                !callbackAdded? callback : null,
				        		$.atmosphere.request = {transport: 'websocket'});

        connectedEndpoint 	= $.atmosphere.response;
        callbackAdded 		= true;
    });


</script>

