class Notification < ApplicationRecord
   default_scope->{order(created_at: :desc)}
  belongs_to :micropost, optional: true
  belongs_to :comment, optional: true
  belongs_to :user, optional: true
end
