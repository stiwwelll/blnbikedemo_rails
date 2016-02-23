require 'rails_helper'

describe StaticPagesController, type: :controller do
  context "GET #index" do
    before do
      get :index
    end

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      expect(response).to render_template("index")
    end
  end

  context "GET #landing_page" do
    before do
      get :landing_page
    end

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the landing_page" do
      expect(response).to render_template("landing_page")
    end

  end

  context "GET #thank_you" do
    before do
      get :thank_you
    end

    it "sends an email" do
      expect { subject.thank_you }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end

  end

end
