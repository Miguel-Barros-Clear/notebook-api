class Contact < ApplicationRecord
    belongs_to :kind

    def author
        "Miguel B."
    end

    def as_json(options={})
        super(methods: :author)
    end
end
