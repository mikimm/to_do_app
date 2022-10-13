class TaskMemo
    include ActiveModel::Model
    attr_accessor :url,:region,:phone_number,:ceo,:content,:task_id,:id,:title,:user_id,:created_at,:updated_at
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
        task = Task.create(title: title, user_id: user_id,id: id,created_at: created_at,updated_at: updated_at)
        Memo.create(url: url, region: region, phone_number: phone_number, ceo: ceo, content: content, task_id: task.id)
      end

      def update(params,task_memo)
        task_memo.update(params)
      end
end