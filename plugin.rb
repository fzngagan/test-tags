# frozen_string_literal: true

# name: test-tags
# about: A plugin to test tag ordering
# version: 0.1
# author: Faizaan

module ModifyTopicTagsMixin
  def all_tags
    return super unless SiteSetting.test_tags_enabled
    @tags = super.reverse
    @tags
  end
end

load File.expand_path("app/serializers/concerns/topic_tags_mixin.rb")
TopicTagsMixin.prepend ModifyTopicTagsMixin
