class PathBuilder
  attr_reader :params

  def initialize(*args)
    @path = []
    @params = {}
  end

  def [](*args)
    @path += args
    self
  end

  def method_missing(method, *args)
    @path << method
    args.each { |arg| arg.is_a?(Hash) ? @params.merge!(arg) : @path << arg }
    self
  end

  def to_s
    "/#{@path.join("/")}"
  end
  alias :path :to_s

  def inspect
    "#<#{self.class} @path=\"#{self.to_s}\" @params=#{@params.inspect}>"
  end
end