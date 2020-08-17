class ApplicationRecord
  def update!(args)
    args.each do |k, v|
      instance_variable_set("@#{k}", v)
    end
  end
end
