class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :group, optional: true
  validates :name, presence: true
  validates :amount, presence: true

  scope :join_scope, ->(id = params[:id]) { joins(:user).select('users.email,transactions.name,transactions.amount,transactions.created_at').where(group_id: id) }
  scope :where_destroy, ->(id = @group.id) { where(group_id: id).update_all(group_id: '') }

  scope :index_where_transaction, ->(id = current_user.id) { where(user_id: id).order(created_at: :desc).includes(:user) }
  scope :external_where_transaction, ->(id = current_user.id) { where(user_id: id, group_id: nil).order(created_at: :desc).includes(:user) }
end
