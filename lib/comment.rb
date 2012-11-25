class Comment < Ohm::Model
  attribute :body
  attribute :rating
  attribute :user

  reference :talk, :Talk

  def validate
    assert_present :body
    assert_present :user
    assert_present :rating
  end
end
