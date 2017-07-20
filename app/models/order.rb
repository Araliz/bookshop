class Order < ActiveRecord::Base
  include Statesman::Adapters::ActiveRecordQueries
  belongs_to :shipping_type
  belongs_to :user
  has_one :order_address
  accepts_nested_attributes_for :order_address
  has_many :line_items
  has_many :books, through: :line_items
  has_many :transitions, class_name: "OrderTransition", autosave: false

  # Initialize the state machine
  def state_machine
    @state_machine ||= OrderStateMachine.new(self, transition_class: OrderTransition,
                                                  association_name: :transitions)
  end

  # Optionally delegate some methods
  delegate :can_transition_to?, :transition_to!, :transition_to, :current_state,
            to: :state_machine

  def self.transition_class
    OrderTransition
  end

  def self.initial_state
    OrderStateMachine.initial_state
  end

  def self.transition_name
    :transitions
  end

  def total_cost
    line_items.map { |e| e.full_price}.sum + shipping_type.cost
  end

end
