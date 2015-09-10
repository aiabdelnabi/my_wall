require "spec_helper"

describe "Create new Comment" do
	let(:status) { Status.create(title: "test title", content: "test content") }

	def visit_comment(status)
		visit "/statuses"

		within "#status_#{status.id}" do
			click_link "Comments"
		end
	end

	it "Should Create New Comment with Vaild Data" do
		visit_comment status

		fill_in "Body", with: "New Comment"

		click_button "Create Comment"
		expect(page).to have_content("New Comment")
		expect(status.comments.count).to eq(1)
	end

	it "Should't Create New Comment with Empty Data" do
		visit_comment status

		fill_in "Body", with: ""
		
		click_button "Create Comment"
		expect(status.comments.count).to eq(0)
		expect(page).to have_content "Body can't be blank"
	end
end