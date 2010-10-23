describe "routing to trips" do
  it "routes /trips to trips#index" do
    { :get => "/trips" }.should route_to(
      :controller => "trips",
      :action => "index"
    )
  end
end