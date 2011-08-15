require "test_helper"

class ManageGeneratorTest < Rails::Generators::TestCase
  tests Sunrise::Scaffold::ManageGenerator
  destination File.expand_path("../../tmp", __FILE__)
  setup :prepare_destination

  test "Generate manage templates for single model" do
    run_generator %w(post)
    
    assert_file "app/controllers/manage/posts_controller.rb"
    assert_file "app/helpers/manage/posts_helper.rb"
    assert_file "spec/controllers/manage/posts_controller_spec.rb"
    
    # Views
    ["edit", "_form", "index", "_model_filter", "new", "_post", "show"].each do |file|
      assert_file "app/views/manage/posts/#{file}.html.erb"
    end
  end
  
  test "Generate manage templates for multiplay models" do
    run_generator %w(comment --parent=post)
    
    assert_file "app/controllers/manage/comments_controller.rb"
    assert_file "app/helpers/manage/comments_helper.rb"
    assert_file "spec/controllers/manage/comments_controller_spec.rb"
    # Views
    ["edit", "_form", "index", "_model_filter", "new", "_comment", "show"].each do |file|
      assert_file "app/views/manage/comments/#{file}.html.erb"
    end
  end
end
