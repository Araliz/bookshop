class OrderStateMachine
 include Statesman::Machine

 state :new, initial: true
 state :confirmed
 state :in_progress
 state :shipped
 state :cancelled

 transition from: :new,           to: [:confirmed, :cancelled]
 transition from: :confirmed,     to: [:in_progress, :cancelled]
 transition from: :in_progress,   to: [:shipped, :cancelled]
 transition from: :shipped,       to: :cancelled

 after_transition(to: :confirmed) do |order, transition|
   OrderMailer.order_confirmation(order).deliver
 end
 after_transition(to: :cancelled) do |order, transition|
   OrderMailer.order_cancelled(order).deliver
 end
 after_transition(to: :in_progress) do |order, transition|
   OrderMailer.order_in_progress(order).deliver
 end
 after_transition(to: :shipped) do |order, transition|
   OrderMailer.order_shipped(order).deliver
 end

end
