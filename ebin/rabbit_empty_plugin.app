{application, rabbit_empty_plugin,
 [{description, "RabbitMQ Empty Plugin"},
  {vsn, "0.1.0"},
  {modules, [rabbit_empty_plugin,
             rabbit_empty_sup,
             rabbit_empty_worker]},
  {registered, []},
  {env, []},
  {applications, [kernel, stdlib, rabbit, amqp_client]},
  {mod, {rabbit_empty_plugin, []}}
 ]}.
