require 'rails_helper'

describe V1::ContactsController, type: :controller do
    it 'request index and return 200 OK' do
        request.accept = 'application/vnd.api+json'
        get :index
        expect(response.status).to eql(200)
    end

    it 'request index and return 406 OK' do
        get :index
        expect(response.status).to eql(406)
    end
end
