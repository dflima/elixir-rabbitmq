{:ok, connection} = AMQP.Connection.open()
{:ok, channel} = AMQP.Channel.open(connection)

AMQP.Queue.declare(channel, "hello")
AMQP.Basic.publish(channel, "", "hello", "Hello, world!")

IO.puts(" [x] Sent 'Hello, world!'")

AMQP.Connection.close(connection)
