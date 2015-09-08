class Animal < ActiveRecord::Base 
    belongs_to :tribe 
    self.inheritance_column = :race 

    validates :race, presence: true

    scope :lions, -> { where(race: 'Lion') } 
		scope :meerkats, -> { where(race: 'Meerkat') } 
		scope :wild_boars, -> { where(race: 'WildBoar') }

		delegate :lions, :meerkats, :wild_boars, to: :animals

		def talk 
    	raise 'Abstract Method' 
		end

    # We will need a way to know which animals
    # will subclass the Animal model
    def self.races
      %w(Lion WildBoar Meerkat)
    end

end


