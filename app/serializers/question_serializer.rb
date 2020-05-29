class QuestionSerializer < ActiveModel::Serializer
    # Before rails sends JSON it will check to see if the model has a serializer with the same name. If rails finds a serializer it will automatically serialize the instances into a JSON response

  # attributes method provided by active model serializer. Define what gets returned as JSON within this method.
  # https://github.com/rails-api/active_model_serializers/blob/v0.10.6/docs/general/serializers.md

  # attributes is a method provided by active model serialzer
  # accepts symbols that correspond to a model's attributes

  # question = Question.find(1)
  # { id: 1, title: 'hello world', body: 'soem body data for this question', updated_at, created_at }
  attributes(
    :id,
    :title,
    :body,
    :hello_world,
    :like_count, 
    :created_at
  )

  belongs_to :user, key: :author
  has_many :answers

  class AnswerSerializer < ActiveModel::Serializer
    attributes(
      :id,
      :body,
      :created_at,
    )

    # belongs_to :user
  end

  def hello_world
    "hello world from serializer"
  end

  def like_count
    # object refers to the current instance being serialized.
    # it is like `self` in ruby or `this` in javascript
    object.likes.count
  end
end

# JSON api is a guide on how you should be formatting your JSON responses
# https://jsonapi.org/