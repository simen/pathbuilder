class UriBuilder
  def initialize
    @path = []
  end

  def method_missing(method, *args)
    @path << "#{method}"
    args.each do |arg|
      @path << arg
    end
    self
  end

  def to_path
    result = @path.join("/")
  end
end