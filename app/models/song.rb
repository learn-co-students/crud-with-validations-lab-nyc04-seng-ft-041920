class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: {scope: [:artist_name, :release_year]}
    validates :release_year, presence: true, if: :released
    validates :artist_name, presence: true

    validate :release_year_cannot_be_in_the_future

    def release_year_cannot_be_in_the_future
        if self.release_year
            if self.release_year > Time.now.year
                errors.add(:release_year, "can't be in the future")
            end
        end
    end

end
