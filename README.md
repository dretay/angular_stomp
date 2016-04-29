# An WebStomp-Based resource / service example for AngularJS
This is an example project demonstrating how to build an AngularJS WebStomp resource. It will allow you to have AngularJS services that emit objects that get and update state through a RabbitMQ broker.

## Important Files
### `resources/WebStompResource.coffee`
This is an example AngularJS resource providing the underlying transport mechanism between your AngularJS application and the STOMP / RabbitMQ broker. You shouldn't need to delve too deeply into this file since it is mostly just invoked by other stuff.

### `resources/WebStompEntity.coffee`
This is the class that your AngularJS services should extend. It exposes  standard CRUD `get` `update` `delete` and `save` methods that your service may invoke.

### `services/example.coffee`
This is an example service using the AngularJS stomp abstraction. Note that you can subscribe to topics, as well as send RPC requests for data. Each CRUD verb also supports inbound and outbound transforms in case you need to modify the data client-side before giving it to the application.

### `controllers/controls.coffee`
This is an example controller invoking the stomp service. An important thing to note is that you need to pass the controller scope into the service when you initially query for data. This is necessary for memory management - if you didn't pass in a scope the service would never know the page's lifecycle status and would not properly clean up connections and data when using client-side routing.