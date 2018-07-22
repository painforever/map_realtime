Hutch::Logging.logger = Rails.logger
Hutch::Config.initialize
Hutch::Config.set(:mq_exchange, "my_app")
Hutch::Config.set(:mq_username, "guest")
Hutch::Config.set(:mq_password, "guest")
Hutch::Config.set(:mq_host, "localhost")
Hutch::Config.set(:mq_vhost, "/")
Hutch::Config.set(:mq_api_host, "localhost")
Hutch::Config.set(:mq_api_port, 15672)
Hutch::Config.set(:mq_api_ssl, false)
Hutch.connect