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
      def save
        task = Task.create(title: title, user_id: user_id)
        Memo.create(url: url, region: region, phone_number: phone_number, ceo: ceo, content: content, task_id: task.id)
      end
end