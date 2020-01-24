FactoryBot.define do
  factory(:user) do
    name {'Michael Bluth'}
    email {'user@user.com'}
    password {'user'}
    admin { false}
  end
  
  factory(:admin) do
    name {"Kissin' Kate Barlow"}
    email {'admin@admin.com'}
    password {'admin'}
    admin { true }
  end

  factory(:product) do
    name { "Dishwasher"}
    cost { 985 }
    country_of_origin { "Japan" }    
  end
end