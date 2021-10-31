logg_dev = Application.environment.eql?('production') ? STDOUT : Application.root.concat('/', Settings.logger.path)
logger = Ougai::Logger.new(logg_dev, level: Settings.logger.level)
logger.formatter = Ougai::Formatters::Readable.new

logger.before_log = lambda do |data|
  data[:service] = { name: Settings.app.name }
  data[:request_id] ||= Thread.current[:request_id]
end

Application.logger = logger
