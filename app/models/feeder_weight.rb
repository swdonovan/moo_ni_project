class FeederWeight < ApplicationRecord
  belongs_to :feeder_cow

  enum weight_type: [:working, :incoming, :outgoing]




private

  def self.group_by_cow_id
    feeder_cows = self.all.group_by(&:feeder_cow_id)
  end

  def self.group_cow_objects_by_weights
    self.all.group_by(&:weight)
  end

  def self.group_numbers_by_weights
    self.group(:weight).order('count_id asc').count('id')
  end

  def self.max_weight
    self.maximum(:weight)
  end

  def self.min_weight
    self.minimum(:weight)
  end

  def self.all_incoming_weights
    self.where(weight_type: 'incoming')
  end

  def self.all_working_weights
    self.where(weight_type: 'working')
  end

  def self.all_outgoing_weights
    self.where(weight_type: 'outgoing')
  end

  def self.max_incoming_weight_numb
    self.all_incoming_weights.maximum(:weight)
  end

  def self.min_incoming_weight_numb
    self.all_incoming_weights.minimum(:weight)
  end

  def self.max_outgoing_weight_numb
    self.all_outgoing_weights.maximum(:weight)
  end

  def self.min_outgoing_weight_numb
    self.all_outgoing_weights.minimum(:weight)
  end

  def self.max_working_weight_numb
    self.all_working_weights.maximum(:weight)
  end

  def self.min_working_weight_numb
    self.all_working_weights.minimum(:weight)
  end
end
