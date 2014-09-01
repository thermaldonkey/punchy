require 'rails_helper'

describe PunchesController, active_mocker: true do
  # This should return the minimal set of attributes required to create a valid
  # Punch. As you add validations to Punch, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { attributes_for(:punch) }

  let(:user) { create(:user) }

  before { sign_in user }

  describe "GET index" do
    it "assigns all punchs as @punchs" do
      punch = create(:punch, user: user)
      get :index, {}
      assigns(:punchs).should eq([punch])
    end
  end

  describe "GET new" do
    it "assigns a new punch as @punch" do
      get :new, {}
      assigns(:punch).should be_a_new(Punch)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Punch" do
        expect {
          post :create, {:punch => valid_attributes}
        }.to change(Punch, :count).by(1)
      end

      it "assigns a newly created punch as @punch" do
        post :create, {:punch => valid_attributes}
        assigns(:punch).should be_a(Punch)
        assigns(:punch).should be_persisted
      end

      it "redirects to the punchs index" do
        post :create, {:punch => valid_attributes}
        response.should redirect_to(action: :index, notice: "Punch was successfully created.")
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved punch as @punch" do
        # Trigger the behavior that occurs when invalid params are submitted
        Punch.any_instance.stub(:save).and_return(false)
        post :create, {:punch => { "value" => "invalid value" }}
        assigns(:punch).should be_a_new(Punch)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Punch.any_instance.stub(:save).and_return(false)
        post :create, {:punch => { "value" => "invalid value" }}
        response.should render_template("new")
      end
    end
  end
end
