require 'rails_helper'

RSpec.describe CoursesController do
  let(:courses) { create_list(:course, 2) }
  let(:course) { courses.first }

  describe "GET index" do
    let(:course_last) { courses.last }

    it "assigns @courses" do
      get :index

      expect(assigns[:courses]).to eq([course, course_last])
    end

    it "render template" do
      get :index

      expect(response).to render_template("index")
    end
  end

  describe "GET show" do
    it "assigns @course" do
      get :show, params: { id: course.id }

      expect(assigns[:course]).to eq(course)
    end

    it "render template" do
      get :show, params: { id: course.id }

      expect(response).to render_template("show")
    end
  end

  describe "GET new" do
    it "assigns @course" do
      get :new

      expect(assigns[:course] ).to be_a_new(Course)
    end

    it "assigns @course" do
      get :new

      expect(response).to render_template("new")
    end
  end

end