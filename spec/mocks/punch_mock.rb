require 'active_mocker/mock'

class PunchMock < ActiveMocker::Mock::Base

  class << self

    def attributes
      @attributes ||= HashWithIndifferentAccess.new({"id"=>nil, "current_date"=>nil, "department"=>nil, "initials"=>nil, "week_end_date"=>nil, "issue"=>"", "description"=>"", "start_time"=>nil, "end_time"=>nil, "activity"=>nil, "notes"=>"", "user_id"=>nil, "created_at"=>nil, "updated_at"=>nil})
    end

    def types
      @types ||= ActiveMocker::Mock::HashProcess.new({ id: Fixnum, current_date: Date, department: String, initials: String, week_end_date: Date, issue: String, description: String, start_time: Time, end_time: Time, activity: String, notes: String, user_id: Fixnum, created_at: DateTime, updated_at: DateTime }, method(:build_type))
    end

    def associations
      @associations ||= {:user=>nil}
    end

    def mocked_class
      'Punch'
    end

    private :mocked_class

    def attribute_names
      @attribute_names ||= ["id", "current_date", "department", "initials", "week_end_date", "issue", "description", "start_time", "end_time", "activity", "notes", "user_id", "created_at", "updated_at"]
    end

    def primary_key
      "id"
    end

  end

  ##################################
  #   Attributes getter/setters    #
  ##################################

  def id
    read_attribute(:id)
  end

  def id=(val)
    write_attribute(:id, val)
  end

  def current_date
    read_attribute(:current_date)
  end

  def current_date=(val)
    write_attribute(:current_date, val)
  end

  def department
    read_attribute(:department)
  end

  def department=(val)
    write_attribute(:department, val)
  end

  def initials
    read_attribute(:initials)
  end

  def initials=(val)
    write_attribute(:initials, val)
  end

  def week_end_date
    read_attribute(:week_end_date)
  end

  def week_end_date=(val)
    write_attribute(:week_end_date, val)
  end

  def issue
    read_attribute(:issue)
  end

  def issue=(val)
    write_attribute(:issue, val)
  end

  def description
    read_attribute(:description)
  end

  def description=(val)
    write_attribute(:description, val)
  end

  def start_time
    read_attribute(:start_time)
  end

  def start_time=(val)
    write_attribute(:start_time, val)
  end

  def end_time
    read_attribute(:end_time)
  end

  def end_time=(val)
    write_attribute(:end_time, val)
  end

  def activity
    read_attribute(:activity)
  end

  def activity=(val)
    write_attribute(:activity, val)
  end

  def notes
    read_attribute(:notes)
  end

  def notes=(val)
    write_attribute(:notes, val)
  end

  def user_id
    read_attribute(:user_id)
  end

  def user_id=(val)
    write_attribute(:user_id, val)
    association = classes('User').try(:find_by, id: user_id)
    write_association(:user,association) unless association.nil?
  end

  def created_at
    read_attribute(:created_at)
  end

  def created_at=(val)
    write_attribute(:created_at, val)
  end

  def updated_at
    read_attribute(:updated_at)
  end

  def updated_at=(val)
    write_attribute(:updated_at, val)
  end

  ##################################
  #         Associations           #
  ##################################

# belongs_to
  def user
    @associations[:user]
  end

  def user=(val)
    @associations[:user] = val
    write_attribute(:user_id, val.id) if val.respond_to?(:persisted?) && val.persisted?
    if ActiveMocker::Mock.config.experimental
      val.punches << self if val.respond_to?(:punches=)
      val.punch = self if val.respond_to?(:punch=)
    end
    val
  end

  def build_user(attributes={}, &block)
    association = classes('User').try(:new, attributes, &block)
    write_association(:user, association) unless association.nil?
  end

  def create_user(attributes={}, &block)
    association = classes('User').try(:create,attributes, &block)
    write_association(:user, association) unless association.nil?
  end
  alias_method :create_user!, :create_user


  module Scopes

  end

  extend Scopes

  class ScopeRelation < ActiveMocker::Mock::Association
    include PunchMock::Scopes
  end

  private

  def self.new_relation(collection)
    PunchMock::ScopeRelation.new(collection)
  end

  public

  ##################################
  #        Model Methods           #
  ##################################


  private

  def self.reload
    load __FILE__
  end

end