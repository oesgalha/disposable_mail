class DisposableValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if DisposableMail.include?(value)
      record.errors.add(attribute, 'Mail domain not allowed')
    end
  end
end
