module ApplicationHelper

  def transform_boolean_value_to_yes_or_no(value)
    value ? "Yes" : "No"
  end

end
