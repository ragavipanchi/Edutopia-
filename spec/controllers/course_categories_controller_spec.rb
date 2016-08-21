require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe CourseCategoriesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # CourseCategory. As you add validations to CourseCategory, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CourseCategoriesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all course_categories as @course_categories" do
      course_category = CourseCategory.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:course_categories)).to eq([course_category])
    end
  end

  describe "GET #show" do
    it "assigns the requested course_category as @course_category" do
      course_category = CourseCategory.create! valid_attributes
      get :show, params: {id: course_category.to_param}, session: valid_session
      expect(assigns(:course_category)).to eq(course_category)
    end
  end

  describe "GET #new" do
    it "assigns a new course_category as @course_category" do
      get :new, params: {}, session: valid_session
      expect(assigns(:course_category)).to be_a_new(CourseCategory)
    end
  end

  describe "GET #edit" do
    it "assigns the requested course_category as @course_category" do
      course_category = CourseCategory.create! valid_attributes
      get :edit, params: {id: course_category.to_param}, session: valid_session
      expect(assigns(:course_category)).to eq(course_category)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new CourseCategory" do
        expect {
          post :create, params: {course_category: valid_attributes}, session: valid_session
        }.to change(CourseCategory, :count).by(1)
      end

      it "assigns a newly created course_category as @course_category" do
        post :create, params: {course_category: valid_attributes}, session: valid_session
        expect(assigns(:course_category)).to be_a(CourseCategory)
        expect(assigns(:course_category)).to be_persisted
      end

      it "redirects to the created course_category" do
        post :create, params: {course_category: valid_attributes}, session: valid_session
        expect(response).to redirect_to(CourseCategory.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved course_category as @course_category" do
        post :create, params: {course_category: invalid_attributes}, session: valid_session
        expect(assigns(:course_category)).to be_a_new(CourseCategory)
      end

      it "re-renders the 'new' template" do
        post :create, params: {course_category: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested course_category" do
        course_category = CourseCategory.create! valid_attributes
        put :update, params: {id: course_category.to_param, course_category: new_attributes}, session: valid_session
        course_category.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested course_category as @course_category" do
        course_category = CourseCategory.create! valid_attributes
        put :update, params: {id: course_category.to_param, course_category: valid_attributes}, session: valid_session
        expect(assigns(:course_category)).to eq(course_category)
      end

      it "redirects to the course_category" do
        course_category = CourseCategory.create! valid_attributes
        put :update, params: {id: course_category.to_param, course_category: valid_attributes}, session: valid_session
        expect(response).to redirect_to(course_category)
      end
    end

    context "with invalid params" do
      it "assigns the course_category as @course_category" do
        course_category = CourseCategory.create! valid_attributes
        put :update, params: {id: course_category.to_param, course_category: invalid_attributes}, session: valid_session
        expect(assigns(:course_category)).to eq(course_category)
      end

      it "re-renders the 'edit' template" do
        course_category = CourseCategory.create! valid_attributes
        put :update, params: {id: course_category.to_param, course_category: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested course_category" do
      course_category = CourseCategory.create! valid_attributes
      expect {
        delete :destroy, params: {id: course_category.to_param}, session: valid_session
      }.to change(CourseCategory, :count).by(-1)
    end

    it "redirects to the course_categories list" do
      course_category = CourseCategory.create! valid_attributes
      delete :destroy, params: {id: course_category.to_param}, session: valid_session
      expect(response).to redirect_to(course_categories_url)
    end
  end

end
