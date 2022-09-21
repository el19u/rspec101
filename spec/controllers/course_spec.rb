require 'rails_helper'

RSpec.describe CoursesController do
  let(:courses) { create_list(:course, 2) }
  let(:course1) { courses.first }
  let(:course2) { courses.last }

  describe "GET index" do
    it "assigns @courses and render template" do
      get :index

      expect(assigns[:courses]).to eq([course1, course2])
    end

    it "render template" do
      get :index

      expect(response).to render_template("index")
    end
  end
end