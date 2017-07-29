#### Blocmetrics<br><small>analytics service to track events on websites.</small>

##### Use Case:
- A client-side JavaScript snippet that allows a user to track events on their website.
- A server-side API that captures and saves those events to a database.
- A Rails application that displays the captured event data for a user.

##### User Story
| User Story | Difficulty Rating |
|:---|:---:|
As a user, I want to sign up for a free account by providing a name, password, and email | 2
As a user, I want to sign in and out of Blocmetrics | 2
As a user, I want to register an application with Blocmetrics for tracking | 3
As a user, I want events associated with registered applications | 3
As a developer, I want to receive incoming events in an API controller | 2
As a user, I want to use JavaScript to capture client-side events in my application | 2
As a user, I want to see a graph of events for each registered application | 3


The following javascript was added to my application.js file for my portfolio appliction at [cm-ds.herokuapp.com](http://cm-ds.herokuapp.com).
The click handler updates events from my index page letting me know which posts or portfolio-posts are clicked.

__application.js__ for [cm-ds.herokuapp.com](http://cm-ds.herokuapp.com).
```javascript

var blocmetrics = {};

blocmetrics.report = function(eventName) {
  var event = { event: { name: eventName}};
  
  var request = new XMLHttpRequest();
  
  request.open("POST", "https://bloc-m4-specialization-cerrillomedia.c9users.io:8080/api/events", true);
  
  request.setRequestHeader('Content-Type', 'application/json');
  
  request.send(JSON.stringify(event));
  
};

// Turbolinks overrides the normal page loading process, the event that this relies on will not be fired.
// changing the usual Javascript/JQuery load methods requires TurboLinks to load completely.
$(document).on('turbolinks:load', function () {
  $('.post-button').click( function(e) {
    var data_type = $(this).data();
    $.each(data_type, function(key, value) {
      blocmetrics.report(value);
    });
  });
  
});
```