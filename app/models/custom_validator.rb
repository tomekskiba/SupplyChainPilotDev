class CustomValidator < ActiveModel::Validator
  def validate(record)
    #record.name # Access the ActiveRecord model
    record.errors.add :on_hand
    options[:fields] # Access the options passed to the validator
  end
end


#validates_each :first_name, :last_name do |record, attr, value|
 #   record.errors.add(attr, 'Cannot start with a number') if value =~ /\A[0-9]/
#end
