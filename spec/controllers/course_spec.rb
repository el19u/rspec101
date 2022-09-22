require 'rails_helper'

RSpec.describe CoursesController do
  let(:courses) { create_list(:course, 2) }
  let(:course) { courses.first }

  describe "GET index" do
    let(:course_last) { courses.last }

    it "assigns courses" do
      get :index

      expect(assigns[:courses]).to eq([course, course_last])
    end

    it "render template" do
      get :index

      expect(response).to render_template("index")
    end
  end

  describe "GET show" do
    it "assigns course" do
      get :show, params: { id: course.id }

      expect(assigns[:course]).to eq(course)
    end

    it "render template" do
      get :show, params: { id: course.id }

      expect(response).to render_template("show")
    end
  end

  describe "GET new" do
    it "assigns course" do
      get :new

      expect(assigns[:course] ).to be_a_new(Course)
    end

    it "assigns course" do
      get :new

      expect(response).to render_template("new")
    end
  end

  describe "POST create" do
    it "create a new course record" do
      post :create, params: { course: attributes_for(:course) }

      expect change{ Course.count }.by(1)
    end

    it "redirects to courses_path" do
      post :create, params: { id: course.id, course: { title: course.title, description: course.description } }

      expect(response).to redirect_to(course_path(course))
    end

    it "fails to create a new course record" do
      post :create, params: { course: {title: nil} }

      expect change{ Course.count }.by(0)
    end

    it "redirects to new" do
      post :create, params: { course: {title: nil} }

      expect(response).to render_template("new")
    end
  end

  describe "GET edit" do
    it "assigns course" do
      get :edit, params: { id: course.id }

      expect(assigns[:course]).to eq(course)
    end

    it "render template" do
      get :edit, params: { id: course.id }

      expect(response).to render_template("edit")
    end
  end

  describe "PUT update" do
    it "updates course record" do
      put :update, params: { id: course.id, course: {title: "hello", description: "world"} }

      expect(course.reload.title).to eq("hello")
      expect(course.reload.description).to eq("world")
    end


  it "redirect to courses_path" do
      put :update, params: { id: course.id, course: {title: "hello", description: "world"} }

      expect(response).to redirect_to(course_path(course))
    end

    it "fails to update course record" do
      put :update, params: { id: course.id, course: {title: "hello", description: "world"} }
      course.title = nil

      expect(course.title).to eq(nil)
    end
  end
end