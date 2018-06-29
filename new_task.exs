{:ok, connection} = AMQP.Connection.open
{:ok, channel} = AMQP.Channel.open(connection)

AMQP.Queue.declare(channel, "hello", durable: true)

message =
  case System.argv do
    []    -> "Hello, world!"
    words -> Enum.join(words, " ")
  end

AMQP.Basic.publish(channel, "", "task_queue", message, persistent: true)
IO.puts " [x] Sent '#{message}'"

AMQP.Connection.close(connection)
