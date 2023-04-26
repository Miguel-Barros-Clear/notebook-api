module V1
  class ContactSerializer < ActiveModel::Serializer
    attributes :id, :name, :email, :birthdate #, :author

    belongs_to :kind do
      link(:related) { v1_contact_kind_url(object.kind.id) }
    end

    has_many :phones do
      link(:related) { v1_contact_phones_url(object.id) }
    end

    has_one :address do
      link(:related) { v1_contact_address_url(object.id) }
    end

    meta do
      {
        author: "Miguel"
      }
    end

    def attributes(*args)
          h = super(*args)
          # h[:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank?)
          h[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
          h
      end
  end
end