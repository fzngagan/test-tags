# frozen_string_literal: true

# name: test-tags
# about: A plugin to test tag ordering
# version: 0.1
# author: Faizaan


after_initialize do
  module ModifyTopicTagsMixin
    def all_tags
      return super unless SiteSetting.test_tags_enabled
      @tags = super.reverse
      @tags
    end
  end

  TopicTagsMixin.prepend ModifyTopicTagsMixin
end
