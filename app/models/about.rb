# frozen_string_literal: true

class About
  class CategoryMods
    include ActiveModel::Serialization
    attr_reader :category_id, :moderators

    def initialize(category_id, moderators)
      @category_id = category_id
      @moderators = moderators
    end
  end

  include ActiveModel::Serialization
  include StatsCacheable

  attr_accessor :moderators,
                :admins

  def self.stats_cache_key
    'about-stats'
  end

  def self.fetch_stats
    About.new.stats
  end

  def initialize(user = nil)
    @user = user
  end

  def version
    Discourse::VERSION::STRING
  end

  def https
    SiteSetting.force_https
  end

  def title
    SiteSetting.title
  end

  def locale
    SiteSetting.default_locale
  end

  def description
    SiteSetting.site_description
  end

  def moderators
    @moderators ||= User.where(moderator: true, admin: false)
      .human_users
      .order("last_seen_at DESC")
  end

  def admins
    @admins ||= User.where(admin: true)
      .human_users
      .order("last_seen_at DESC")
  end

  def stats
    @stats ||= {
       topic_count: Topic.listable_topics.count,
       post_count: Post.count,
       user_count: User.real.count,
       topics_7_days: Topic.listable_topics.where('created_at > ?', 7.days.ago).count,
       topics_30_days: Topic.listable_topics.where('created_at > ?', 30.days.ago).count,
       posts_7_days: Post.where('created_at > ?', 7.days.ago).count,
       posts_30_days: Post.where('created_at > ?', 30.days.ago).count,
       users_7_days: User.where('created_at > ?', 7.days.ago).count,
       users_30_days: User.where('created_at > ?', 30.days.ago).count,
       active_users_7_days: User.where('last_seen_at > ?', 7.days.ago).count,
       active_users_30_days: User.where('last_seen_at > ?', 30.days.ago).count,
       like_count: UserAction.where(action_type: UserAction::LIKE).count,
       likes_7_days: UserAction.where(action_type: UserAction::LIKE).where("created_at > ?", 7.days.ago).count,
       likes_30_days: UserAction.where(action_type: UserAction::LIKE).where("created_at > ?", 30.days.ago).count
    }
  end

  def category_moderators
    category_ids = Guardian.new(@user).allowed_category_ids
    return [] if category_ids.blank?
    results = DB.query(<<~SQL, category_ids: category_ids)
      SELECT c.id category_id, array_agg(gu.user_id) user_ids
      FROM categories c
      JOIN group_users gu
      ON gu.group_id = reviewable_by_group_id
      WHERE c.id IN (:category_ids)
      GROUP BY c.id
    SQL
    moderators = {}
    User.where(id: results.map(&:user_ids).flatten).each do |user|
      moderators[user.id] = user
    end
    moderators
    results.map do |row|
      CategoryMods.new(row.category_id, row.user_ids.map { |id| moderators[id] })
    end
  end
end
