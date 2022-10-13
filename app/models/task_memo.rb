class TaskMemo
    include ActiveModel::Model
    attr_accessor :title,:url,:region,:phone_number,:ceo,:content,:task,:user_id
    with_options presence: true do
        validates :title
        validates :url
        validates :region
        validates :phone_number
        validates :ceo
        validates :content
        validates :user_id
      end

    delegate :persisted?, to: :task

  def initialize(attributes = nil, task: Task.new)
    @task = task
    attributes ||= default_attributes
    super(attributes)
  end

  def save
    return if invalid?

    ActiveRecord::Base.transaction do
      task.assign_attributes(title: title, user_id: user_id)
      memos =  Memo.new(url: url, region: region, phone_number: phone_number, ceo: ceo, content: content)
      task.memo = memos
      task.save!
    end
    rescue ActiveRecord::RecordInvalid
      false
  end

  def to_model
    task
  end

  private

  attr_reader :task

  def default_attributes
    {
      user_id: task.user_id,
      title: task.title,
      url: task.memo&.url,
      region: task.memo&.region,
      phone_number: task.memo&.phone_number,
      ceo: task.memo&.ceo,
      content: task.memo&.content
    }
  end
end