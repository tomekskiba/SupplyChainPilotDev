class User < ActiveRecord::Base

  devise :database_authenticatable,
         :registerable,
         :confirmable,
         :lockable,
         :recoverable,
         :trackable,
         :validatable,
         :timeoutable


  has_many :user_solution_xrefs
  has_many :solutions, :through => :user_solution_xrefs
  has_many :user_apd_supply_xrefs
  has_many :apd_supplies, :through => :user_apd_supply_xrefs
  has_many :user_capd_supply_xrefs
  has_many :capd_supplies, :through => :user_capd_supply_xrefs
  has_many :user_ancillary_supply_xrefs
  has_many :ancillary_supplies, :through => :user_ancillary_supply_xrefs

  has_many :orders

  attr_accessor :solution_ids
  attr_accessor :solution_ids_all
  attr_accessor :user_solution_xrefs_line_max
  attr_accessor :apd_supply_ids
  attr_accessor :apd_supply_ids_all
  attr_accessor :user_apd_supply_xrefs_line_max
  attr_accessor :user_apd_supply_xrefs_units_per_cycle
  attr_accessor :capd_supply_ids
  attr_accessor :capd_supply_ids_all
  attr_accessor :user_capd_supply_xrefs_line_max
  attr_accessor :user_capd_supply_xrefs_units_per_cycle
  attr_accessor :ancillary_supply_ids
  attr_accessor :ancillary_supply_ids_all

  after_save :update_xrefs

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  date_regex = /\d{4}\-\d{2}\-\d{2}/
  alphanumeric_regex = /^(?=.*\d)(?=.*[A-Za-z])[A-Za-z0-9]/
  only_alpha = /^([A-Za-z])[A-Za-z]/
  zip_code_regex = /\A\d{5}\z|\A\d{5}\-\d{4}\z/
  phone_regex = /^\d{3}-\d{3}-\d{4}$/

  validates :password, :allow_nil => true,
            :allow_blank => true,
            :format => {:with => alphanumeric_regex, :message => " must be alphanumeric and is case sensitive"}
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :account_no, :presence => true,
            :length => {:minimum => 8, :maximum => 8},
            :numericality => {:integer_only => true, :message => " must be numeric."}
  validates :primary_phone, :presence => true,
            :format => {:with => phone_regex, :message => " number must have correct format (xxx-xxx-xxxx)"}
  validates :mobile_phone, :allow_nil => true,
            :allow_blank => true,
            :format => {:with => phone_regex, :message => " number must have correct format (xxx-xxx-xxxx)"}
  validates :no_reserved_days, :presence => true,
            :numericality => {:greater_than_or_equal_to => 0, :message => " must be a number."}
  validates :no_delivery_cycle_days, :presence => true,
            :numericality => {:greater_than_or_equal_to => 0, :message => " must be a number."}
  validates :address1, :presence => true
  validates :city, :presence => true
  validates :state, :presence => true,
            :length => {:minimum => 2, :maximum => 2, :message => "is invalid (only 2 characters are allowed)"},
            :format => {:with => only_alpha, :message => "is invalid (only alphabetical letters are allowed)"}
  validates :postal_code, :presence => true,
            :format => {:with => zip_code_regex}
  validates :delivery_date, :presence => true,
            :format => {:with => date_regex}
  validates :JDE_reconciliation_date, :presence => true,
            :format => {:with => date_regex}
  validates :clinic_email, :allow_nil => true,
            :allow_blank => true,
            :format => {:with => email_regex}

  validate :solutions_and_supplies

  def solutions_and_supplies
    #validate solutions
    unless solution_ids.nil?
      unless are_they_all_blank?(solution_ids) and are_they_all_blank?(user_solution_xrefs_line_max)
        solution_ids_all.each do |id|
          index = solution_ids_all.index(id)
          check = 0
          line_max = user_solution_xrefs_line_max[index]
            # make sure that both "included?" and line max are specified
          if (solution_ids.include?(id)) then
            check+=1
          end
          if (!line_max.blank?) then
            check+=1
          end

          if check == 1
            errors.add("Dialysis Solution - ", 'For chosen solutions all fields are required')
            break
          end

          if !line_max.blank? and !is_numeric?(line_max)
            errors.add("Dialysis Solution - ", "Line Max cannot be blank and only whole numbers are permitted")
            break
          end
        end
      else
        errors.add("Dialysis Solution - ", "at least one Solution is required")
      end
    end

    validate_supplies(
        apd_supply_ids,
        apd_supply_ids_all,
        "APD Supplies - ",
        user_apd_supply_xrefs_line_max,
        user_apd_supply_xrefs_units_per_cycle
    )

    validate_supplies(
        capd_supply_ids,
        capd_supply_ids_all,
        "CAPD Supplies - ",
        user_capd_supply_xrefs_line_max,
        user_capd_supply_xrefs_units_per_cycle
    )
  end

  def validate_supplies(ids, ids_all, name, line_max_array, usage_array)
    unless ids.nil? and ids_all.nil?
      ids_all.each do |id|
        index = ids_all.index(id)
        check = 0
        line_max = line_max_array[index]
        usage = usage_array[index]
          # make sure that all of the fields are specified including checkbox
        if (ids.include?(id)) then
          check+=1
        end
        if (!line_max.blank?) then
          check+=1
        end
        if (!usage.blank?) then
          check+=1
        end

        if check == 1 or check == 2
          errors.add(name, 'For chosen supplies all fields are required')
          break
        end

        if !line_max.blank? and !is_numeric?(line_max)
          errors.add(name, "Line Max cannot be blank and only whole numbers are permitted")
          break
        end

        if !usage.blank? and !is_numeric?(usage)
          errors.add(name, "Individual Pieces per Cycle cannot be blank and only whole numbers are permitted")
          break
        end
      end
    end
  end

    #after_save callback to handle saving to xref tables
  def update_xrefs
    unless solution_ids.nil?
      self.user_solution_xrefs.each do |x|
        x.destroy
      end
      solution_ids.each do |s|
        unless s.blank? or s.nil?
          index = Integer(solution_ids_all.index(s))
          self.user_solution_xrefs.create(:solution_id => s, :line_max => user_solution_xrefs_line_max[index].strip) unless user_solution_xrefs_line_max[index].blank?
        end
      end
      reload
      self.solution_ids = nil
      self.solution_ids_all = nil
      self.user_solution_xrefs_line_max = nil
    end

    unless apd_supply_ids.nil?
      self.user_apd_supply_xrefs.each do |m|
        m.destroy
      end
      apd_supply_ids.each do |g|
        unless g.blank? or g.nil?
          index = Integer(apd_supply_ids_all.index(g))
          self.user_apd_supply_xrefs.create(:apd_supply_id => g, :line_max => user_apd_supply_xrefs_line_max[index].strip, :units_per_cycle => user_apd_supply_xrefs_units_per_cycle[index]) unless user_apd_supply_xrefs_line_max[index].blank? or user_apd_supply_xrefs_units_per_cycle[index].blank?
        end
      end
      reload
      self.apd_supply_ids = nil
      self.apd_supply_ids_all = nil
      self.user_apd_supply_xrefs_line_max = nil
      self.user_apd_supply_xrefs_units_per_cycle = nil
    end

    unless capd_supply_ids.nil?
      self.user_capd_supply_xrefs.each do |m|
        m.destroy
      end
      capd_supply_ids.each do |g|
        unless g.blank? or g.nil?
          index = Integer(capd_supply_ids_all.index(g))
          self.user_capd_supply_xrefs.create(:capd_supply_id => g, :line_max => user_capd_supply_xrefs_line_max[index].strip, :units_per_cycle => user_capd_supply_xrefs_units_per_cycle[index]) unless user_capd_supply_xrefs_line_max[index].blank? or user_capd_supply_xrefs_units_per_cycle[index].blank?
        end
      end
      reload
      self.capd_supply_ids = nil
      self.capd_supply_ids_all = nil
      self.user_capd_supply_xrefs_line_max = nil
      self.user_capd_supply_xrefs_units_per_cycle = nil
    end

    unless ancillary_supply_ids.nil?
      self.user_ancillary_supply_xrefs.each do |m|
        m.destroy
      end
      ancillary_supply_ids.each do |g|
        self.user_ancillary_supply_xrefs.create(:ancillary_supply_id => g) unless g.blank?
      end
      reload
      self.ancillary_supply_ids = nil
      self.ancillary_supply_ids_all = nil
    end
  end


    # new function to set the password without knowing the current password used in our confirmation controller.
  def attempt_set_password(params)
    p = {}
    p[:password] = params[:password]
    p[:password_confirmation] = params[:password_confirmation]
    update_attributes(p)
  end

    # new function to return whether a password has been set
  def has_no_password?
    self.encrypted_password.blank?
  end

    # new function to provide access to protected method unless_confirmed
  def only_if_unconfirmed
    unless_confirmed { yield }
  end


  def password_required?
    # Password is required if it is being set, but not for new records
    if !persisted?
      false
    else
      !password.nil? || !password_confirmation.nil?
    end
  end


    #prevent data lost on validation callback
    #sollutions
  def restore_solutions_line_max(i)
    unless (user_solution_xrefs_line_max.nil? and i.nil?)
      user_solution_xrefs_line_max[Integer(i)].to_s
    end
  end

  def include_solution?(solution_object)
    unless  solution_ids.nil?
      if solution_ids.include? solution_object.id.to_s
        true
      else
        false
      end
    else
      self.solutions.include?(solution_object)
    end
  end

  def get_solution_ids_array_index(solution_id)
    unless solution_ids_all.nil?
      unless solution_ids_all.index(solution_id.to_s).nil?
        Integer(solution_ids_all.index(solution_id.to_s))
      end
    end
  end

    #apd supplies
  def restore_apd_supplies_line_max(id)
    unless (user_apd_supply_xrefs_line_max.nil? or id.nil?)
      unless get_apd_supply_ids_array_index(id).nil?
        user_apd_supply_xrefs_line_max[get_apd_supply_ids_array_index(id)].to_s
      end
    end
  end

  def restore_apd_supplies_usage(id)
    unless (user_apd_supply_xrefs_units_per_cycle.nil? or id.nil?)
      user_apd_supply_xrefs_units_per_cycle[get_apd_supply_ids_array_index(id)].to_s unless get_apd_supply_ids_array_index(id).nil?
    end
  end

  def include_apd_supply?(apd_supply_object)
    unless  apd_supply_ids.nil?
      if apd_supply_ids.include? apd_supply_object.id.to_s
        true
      else
        false
      end
    else
      self.apd_supplies.include?(apd_supply_object)
    end
  end

  def get_apd_supply_ids_array_index(apd_supply_id)
    unless apd_supply_ids_all.nil?
      unless apd_supply_ids_all.index(apd_supply_id.to_s).nil?
        Integer(apd_supply_ids_all.index(apd_supply_id.to_s))
      end
    end
  end

    #capd supplies
  def restore_capd_supplies_line_max(id)
    unless (user_capd_supply_xrefs_line_max.nil? or id.nil?)
      user_capd_supply_xrefs_line_max[get_capd_supply_ids_array_index(id)].to_s
    end
  end

  def restore_capd_supplies_usage(id)
    unless (user_capd_supply_xrefs_units_per_cycle.nil? or id.nil?)
      user_capd_supply_xrefs_units_per_cycle[get_capd_supply_ids_array_index(id)].to_s
    end
  end

  def include_capd_supply?(capd_supply_object)
    unless  capd_supply_ids.nil?
      if capd_supply_ids.include? capd_supply_object.id.to_s
        true
      else
        false
      end
    else
      self.capd_supplies.include?(capd_supply_object)
    end
  end

  def get_capd_supply_ids_array_index(capd_supply_id)
    unless capd_supply_ids_all.nil?
      unless capd_supply_ids_all.index(capd_supply_id.to_s).nil?
        Integer(capd_supply_ids_all.index(capd_supply_id.to_s))
      end
    end
  end

    #ancillary supplies
  def include_ancillary_supply?(ancillary_supply_object)
    unless  ancillary_supply_ids.nil?
      if ancillary_supply_ids.include? ancillary_supply_object.id.to_s
        true
      else
        false
      end
    else
      self.ancillary_supplies.include?(ancillary_supply_object)
    end
  end


  private

  def are_they_all_blank?(arr)
    result = true
    arr.each do |x|
      if x != ""
        result = false
        break
      end
    end

    return result
  end

  def is_numeric?(val)
    val.strip.to_s.match(/^(0|[1-9][0-9]*)$/) == nil ? false : true
  end

    #print errors for supplies and solutions
  def validate_tables_input(var, name, err_desc)
    unless (var).nil?
      var.each do |x|
        if x.blank? or !is_numeric?(x)
          errors.add(name, err_desc)
          break
        end
      end
    end
  end

end