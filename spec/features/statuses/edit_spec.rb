require "spec_helper"

describe "edit exist status" do

	let(:status) { Status.create(title: "title test", content: "content test") }

	def visit_status(status)
		visit "/statuses"
		within "#status_#{status.id}" do
			click_link "Edit"
		end

		expect(page).to have_content("Editing Status")
	end

	def edit_status(options={})
		fill_in "Title", with: options[:title]
		fill_in "Content", with: options[:content]

		click_button "Update Status"
		status.reload
	end

	it "Should Edit status with vaild data" do
		visit_status status
		
		edit_status title: "edited title", content: "edited content"
		expect(status.title).to eq("edited title")
		expect(status.content).to eq("edited content")
	end

	it "Should't Edit status with invaild data" do
		visit_status status
		
		edit_status title: "", content: ""
		expect(status.title).to eq("title test")
		expect(status.content).to eq("content test")
	end

	it "Should't Edit status with short title" do
		visit_status status
		
		edit_status title: "1", content: "123456"
		expect(status.title).to eq("title test")
		expect(status.content).to eq("content test")
	end

	it "Should't Edit status with short content" do
		visit_status status
		
		edit_status title: "12", content: "1234"
		expect(status.title).to eq("title test")
		expect(status.content).to eq("content test")
	end
end