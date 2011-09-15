class UriBuilder
  def initialize(*args)
    @path = []
  end

  def [](*args)
    args.each do |arg|
      @path << arg
    end
    self
  end

  def method_missing(method, *args)
    @path << "#{method}"
    arg_handler(*args) unless args.empty?
    self
  end

  def arg_handler(*args)
    # override this to handle invocations
  end

  def to_path
    result = "#{@path.join("/")}"
  end
end