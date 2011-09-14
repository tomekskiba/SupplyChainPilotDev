class Order < ActiveRecord::Base

  belongs_to :user

  has_many :order_solution_xrefs
  has_many :solutions, :through => :order_solution_xrefs
  has_many :user_solutions_xrefs, :through => :solutions

  has_many :order_apd_supply_xrefs
  has_many :apd_supplies, :through => :order_apd_supply_xrefs
  has_many :user_apd_supply_xrefs, :through => :apd_supplies

  has_many :order_capd_supply_xrefs
  has_many :capd_supplies, :through => :order_capd_supply_xrefs
  has_many :user_capd_supply_xrefs, :through => :capd_supplies

  has_many :order_ancillary_supply_xrefs
  has_many :ancillary_supplies, :through => :order_ancillary_supply_xrefs


  attr_accessor :solution_ids
  attr_accessor :order_solution_xrefs_on_hand
  attr_accessor :order_solution_xrefs_usage_per_week

  attr_accessor :apd_supply_ids
  attr_accessor :order_apd_supply_xrefs_on_hand

  attr_accessor :capd_supply_ids
  attr_accessor :order_capd_supply_xrefs_on_hand

  attr_accessor :ancillary_supply_ids

  $OUT_OF_SUPPLIES_ALERT = "The calculations indicate that you may run out of this item before your next delivery.   A Baxter HomeCare Services Representative will review your order after you submit it and provide you further assistance via email."


    #numeric_regex = /[0-9]{5}(?:-[0-9]{4})?/

  validates_acceptance_of :baxter_terms
  validates :supplies_counted_at, :presence => true
  validate :solutions_and_supplies

  def solutions_and_supplies
    validate_tables_input(
        order_solution_xrefs_on_hand,
        "Dialysis Solution - ",
        "on Hand cannot be blank and must be numeric"
    )

    validate_tables_input(
        order_solution_xrefs_usage_per_week,
        "Dialysis Solution - ",
        "Usage / Week cannot be blank and must be numeric"
    )

    validate_tables_input(
        order_apd_supply_xrefs_on_hand,
        "APD Supplies - ",
        "on Hand cannot be blank and must be numeric"
    )

    validate_tables_input(
        order_capd_supply_xrefs_on_hand,
        "CAPD Supplies - ",
        "on Hand cannot be blank and must be numeric"
    )
  end

  after_save :update_xrefs


  def update_xrefs

    unless solution_ids.nil?
      self.order_solution_xrefs.each do |x|
        x.destroy
      end

      i = 0
      solution_ids.each do |s|
        if i != 0
          self.order_solution_xrefs.create(
              :solution_id => s, :on_hand => order_solution_xrefs_on_hand[i-1], :usage_per_week => order_solution_xrefs_usage_per_week[i-1]
          ) unless ((order_solution_xrefs_on_hand[i-1].blank?) && (order_solution_xrefs_usage_per_week[i-1].blank?))
        end
        i = i + 1
      end

      reload
      self.solution_ids = nil
      self.order_solution_xrefs_on_hand = nil
      self.order_solution_xrefs_usage_per_week = nil
    end

    unless apd_supply_ids.nil?
      self.order_apd_supply_xrefs.each do |m|
        m.destroy
      end
      apd_supply_ids.each do |g|
        x = Integer(apd_supply_ids.index(g)) - 1
          #logger.info("apdXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"+apd_supply_ids.index(g).to_s+" " + order_apd_supply_xrefs_usage_per_week[x])
        self.order_apd_supply_xrefs.create(
            :apd_supply_id => g,
            :on_hand => order_apd_supply_xrefs_on_hand[x]
        ) unless order_apd_supply_xrefs_on_hand[x].blank? or g.blank?
      end
      reload
      self.apd_supply_ids = nil
      self.order_apd_supply_xrefs_on_hand = nil
    end

    unless capd_supply_ids.nil?
      self.order_capd_supply_xrefs.each do |m|
        m.destroy
      end
      capd_supply_ids.each do |g|
        x = Integer(capd_supply_ids.index(g)) - 1
        self.order_capd_supply_xrefs.create(
            :capd_supply_id => g,
            :on_hand => order_capd_supply_xrefs_on_hand[x]
        ) unless order_capd_supply_xrefs_on_hand[x].blank? or g.blank?
      end
      reload
      self.apd_supply_ids = nil
      self.order_capd_supply_xrefs_on_hand = nil
    end

    unless ancillary_supply_ids.nil?
      self.order_ancillary_supply_xrefs.each do |m|
        m.destroy
      end
      ancillary_supply_ids.each do |g|
        self.order_ancillary_supply_xrefs.create(:ancillary_supply_id => g) unless g.blank?
      end
      reload
      self.ancillary_supply_ids = nil
    end
  end


    #prevent data lost on validation callback
  def restore_solutions_on_hand(i)
    unless (order_solution_xrefs_on_hand.nil? and i.nil?)
      order_solution_xrefs_on_hand[Integer(i)].to_s
    end
  end

  def restore_solutions_usage_per_week(i)
    unless (order_solution_xrefs_usage_per_week.nil? and i.nil?)
      order_solution_xrefs_usage_per_week[Integer(i)].to_s
    end
  end

  def get_solution_ids_array_index(solution_id)
    unless solution_ids.nil?
      unless solution_ids.index(solution_id.to_s).nil?
        Integer(solution_ids.index(solution_id.to_s))-1
      end
    end
  end

  def restore_apd_supplies_on_hand(i)
    unless (order_apd_supply_xrefs_on_hand.nil? and i.nil?)
      order_apd_supply_xrefs_on_hand[Integer(i)].to_s
    end
  end

  def get_apd_supply_ids_array_index(apd_supply_id)
    unless apd_supply_ids.nil?
      unless apd_supply_ids.index(apd_supply_id.to_s).nil?
        Integer(apd_supply_ids.index(apd_supply_id.to_s))-1
      end
    end
  end

  def restore_capd_supplies_on_hand(i)
    unless (order_capd_supply_xrefs_on_hand.nil? and i.nil?)
      order_capd_supply_xrefs_on_hand[Integer(i)].to_s
    end
  end

  def get_capd_supply_ids_array_index(capd_supply_id)
    unless capd_supply_ids.nil?
      unless capd_supply_ids.index(capd_supply_id.to_s).nil?
        Integer(capd_supply_ids.index(capd_supply_id.to_s))-1
      end
    end
  end

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

  def include_opt_in?
    if opt_in == "1"
      true
    end
  end

    #calculations
  def order_quantity_for_apd_supplies(apd_supply_id)
    calculate_supplies(
        user.user_apd_supply_xrefs.find_by_apd_supply_id(apd_supply_id).units_per_cycle,
        order_apd_supply_xrefs.find_by_apd_supply_id(apd_supply_id).on_hand
    )
  end

  def order_quantity_for_capd_supplies(capd_supply_id)
    calculate_supplies(
        user.user_capd_supply_xrefs.find_by_capd_supply_id(capd_supply_id).units_per_cycle,
        order_capd_supply_xrefs.find_by_capd_supply_id(capd_supply_id).on_hand
    )
  end

  def calculate_supplies(x, y)
    number_of_days_in_delivery_cycle = user.no_delivery_cycle_days
    total_days_of_supplies = number_of_days_in_delivery_cycle + user.no_reserved_days
    individual_pieces_per_cycle = x
    number_of_unites_used_per_cycle_plus_reserved_days = (individual_pieces_per_cycle * total_days_of_supplies) / number_of_days_in_delivery_cycle
    delivery_date = user.delivery_date.to_date
    supplies_counted_at_date = self.supplies_counted_at.to_date

    if delivery_date > supplies_counted_at_date
      number_of_days_till_delivery = delivery_date - supplies_counted_at_date
    else
      number_of_days_till_delivery = supplies_counted_at_date - delivery_date
    end
    number_of_days_till_delivery = (number_of_days_till_delivery).ceil
    logger.info("suppliesXXXXXXXXXXXXXXXXXXXXXXXXXXX--"+number_of_days_till_delivery)

      #usage_per_day = individual_pieces_per_cycle / number_of_days_in_delivery_cycle
    additional_units_needed = (individual_pieces_per_cycle.to_f /
        number_of_days_in_delivery_cycle * number_of_days_till_delivery)
    on_hand = y
      #on_hand_at_delivery = (on_hand - (number_of_days_till_delivery * usage_per_day)).round
    on_hand_at_delivery = (on_hand - additional_units_needed)
    on_hand_at_delivery2 = on_hand_at_delivery < 0 ? 0 : on_hand_at_delivery

    projected_order_quantity = (number_of_unites_used_per_cycle_plus_reserved_days - on_hand_at_delivery2).ceil
    projected_order_quantity = 0 if projected_order_quantity < 0

    vals = {
        "on_hand_at_delivery" => on_hand_at_delivery,
        "projected_order_quantity" => projected_order_quantity
    }

    return vals
  end

  def calculate_solutions(solution_id)
    number_of_days_in_delivery_cycle = user.no_delivery_cycle_days
    total_days_of_supplies = number_of_days_in_delivery_cycle + user.no_reserved_days
    delivery_date = user.delivery_date.to_date
    supplies_counted_at_date = self.supplies_counted_at.to_date

    if delivery_date > supplies_counted_at_date
      number_of_days_till_delivery = delivery_date - supplies_counted_at_date
    else
      number_of_days_till_delivery = supplies_counted_at_date - delivery_date
    end
    number_of_days_till_delivery = (number_of_days_till_delivery).ceil
    logger.info("solutionsYYYYYYYYYYYYYYYYYYYYY--"+number_of_days_till_delivery)

    usage_per_week = order_solution_xrefs.find_by_solution_id(solution_id).usage_per_week
    usage_per_day = (usage_per_week.to_f / 7) # float
    on_hand = order_solution_xrefs.find_by_solution_id(solution_id).on_hand
    on_hand_at_delivery = (on_hand - (number_of_days_till_delivery * usage_per_day.to_f))
    on_hand_at_delivery2 = on_hand_at_delivery < 0 ? 0 : on_hand_at_delivery

    projected_order_quantity = (usage_per_day * total_days_of_supplies - on_hand_at_delivery2).ceil
    projected_order_quantity = 0 if projected_order_quantity < 0

    vals = {
        "on_hand_at_delivery" => on_hand_at_delivery,
        "projected_order_quantity" => projected_order_quantity
    }

    return vals
  end


  private

  def is_numeric?(val)
    val.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
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
