class Talk < Ohm::Model
  attribute :title
  attribute :description
  attribute :author

  collection :comments, :Comment

  def validate
    assert_present :title
    assert_present :description
    assert_present :author
  end

end
