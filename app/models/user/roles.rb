module User::Roles
  extend ActiveSupport::Concern

  included do
  end

  def roles=(roles)
    self.roles_mask = (roles & Manticore::Config.roles).map { |r| 2**Manticore::Config.roles.index(r) }.inject(0, :+)
  end

  def roles
    Manticore::Config.roles.reject do |r|
      ((roles_mask || 0) & 2**Manticore::Config.roles.index(r)).zero?
    end
  end

  def has_role?(role)
    roles.include?(role.to_s)
  end

  # Role Inheritance
  def role?(base_role)
    Manticore::Config.roles.index(base_role.to_s) <= Manticore::Config.roles.index(role)
  end
end
