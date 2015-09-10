require "spec_helper"

describe "Creating new status" do
	
	#let(:status) { Status.create(title: "Title test data 1", content: "Content test data 1") }

	def create_status(options={})
		visit "/statuses"
		click_link "New Status"

		fill_in "Title", with: options[:title]
		fill_in "Content", with: options[:content]

		click_button "Create Status"
	end

	it "Should Create new status with vaild data" do

		create_status title: "Title test data 1", content: "Content test data 1"
		expect(page).to have_content "Status was successfully created."
		expect(Status.count).to eq(1)
	end

	it "Should't Create new status with Empty data" do
		create_status title: "", content: ""
		expect(page).to have_content "Content can't be blank"
		expect(Status.count).to eq(0)
	end

	it "Should't Create new status with Empty title" do
		create_status title: "", content: "test content"
		expect(page).to have_content "Title can't be blank"
		expect(Status.count).to eq(0)
	end

	it "Should't Create new status with Empty content" do
		create_status title: "test title", content: ""
		expect(page).to have_content "Content can't be blank"
		expect(Status.count).to eq(0)
	end

	it "Should't Create new status with short content" do
		create_status title: "test title", content: "hhh"
		expect(page).to have_content "Content is too short (minimum is 5 characters)"
		expect(Status.count).to eq(0)
	end

	it "Should't Create new status with short title" do
		create_status title: "1", content: "hhh 23 adad"
		expect(page).to have_content "Title is too short (minimum is 2 characters)"
		expect(Status.count).to eq(0)
	end
end