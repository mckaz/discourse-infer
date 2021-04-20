# typed: strong
class [s]User
  # RDL Type: (([ []: (:email) -> XXX ] and [ []: (:name) -> XXX ] and [ []: (:password) -> XXX ] and [ []: (:username) -> XXX ])) -> XXX
  sig { params(params: T.untyped).returns(T.untyped) }
  def new_from_params(params); end

  # RDL Type: (XXX) -> User
  sig { params(username: T.untyped).returns(User) }
  def find_by_username(username); end

  # RDL Type: (XXX, ?[ present?: () -> XXX ], { allow_reserved_username: ?[ !: () -> XXX ] }) -> (false or true)
  sig { params(username: T.untyped, email: T.untyped, allow_reserved_username: T.nilable(T.untyped)).returns(T.any(FalseClass, TrueClass)) }
  def username_available?(username, email = nil, allow_reserved_username: nil); end

  # RDL Type: ([ match?: (Regexp) -> XXX ]) -> XXX
  sig { params(username: T.untyped).returns(T.untyped) }
  def reserved_username?(username); end
end

class User
  # RDL Type: (?Number) -> Array<(Badge or BadgeType or GrantedBy or Post or Topic or User or UserBadge)>
  sig { params(limit: Integer).returns(T::Array[T.any(Badge, BadgeType, GrantedBy, Post, Topic, User, UserBadge)]) }
  def featured_user_badges(limit = nil); end

  # RDL Type: () -> (false or true)
  sig { returns(T.any(FalseClass, TrueClass)) }
  def email_confirmed?; end

  # RDL Type: () -> XXX
  sig { returns(T.untyped) }
  def activate; end

  # RDL Type: () -> Number
  sig { returns(Integer) }
  def number_of_deleted_posts; end

  # RDL Type: () -> Number
  sig { returns(Integer) }
  def number_of_flags_given; end

  # RDL Type: () -> UserProfile
  sig { returns(UserProfile) }
  def create_user_profile; end

  # RDL Type: () -> UserOption
  sig { returns(UserOption) }
  def create_user_option; end

  # RDL Type: () -> EmailToken
  sig { returns(EmailToken) }
  def create_email_token; end

  # RDL Type: () -> (false or true)
  sig { returns(T.any(FalseClass, TrueClass)) }
  def seen_before?; end

  # RDL Type: () -> (false or true)
  sig { returns(T.any(FalseClass, TrueClass)) }
  def new_user_posting_on_first_day?; end
end

class [s]EmailToken
  # RDL Type: () -> ActiveRecord_Relation<EmailToken>
  sig { returns(ActiveRecord_Relation[EmailToken]) }
  def active; end

  # RDL Type: () -> XXX
  sig { returns(T.untyped) }
  def valid_after; end

  # RDL Type: (XXX, { skip_reviewable: ?XXX }) -> nil
  sig { params(token: T.untyped, skip_reviewable: T.nilable(T.untyped)).void }
  def confirm(token, skip_reviewable: nil); end
end

class Post
  # RDL Type: ([ id: () -> XXX ]) -> (false or true)
  sig { params(user: T.untyped).returns(T.any(FalseClass, TrueClass)) }
  def seen?(user); end

  # RDL Type: () -> (false or true)
  sig { returns(T.any(FalseClass, TrueClass)) }
  def is_flagged?; end

  # RDL Type: () -> (false or true)
  sig { returns(T.any(FalseClass, TrueClass)) }
  def is_reply_by_email?; end

  # RDL Type: ((String or Symbol), (String or Symbol), ?((String or Symbol))) -> PostDetail
  sig { params(key: T.any(String, Symbol), value: T.any(String, Symbol), extra: T.any(String, Symbol)).returns(PostDetail) }
  def add_detail(key, value, extra = nil); end

  # RDL Type: () -> RateLimiter
  sig { returns(RateLimiter) }
  def limit_posts_per_day; end
end

class [s]Post
  # RDL Type: ((String or Symbol), (String or Symbol)) -> Post
  sig { params(key: T.any(String, Symbol), value: T.any(String, Symbol)).returns(Post) }
  def find_by_detail(key, value); end
end

class [s]Archetype
  # RDL Type: () -> String
  sig { returns(String) }
  def private_message; end
end

class Group
  # RDL Type: ([ filter_allowed_categories: (ActiveRecord_Relation<JoinTable<Post, (Category or Group or Topic or User)>>) -> XXX ], ?([ []: (:before_post_id) -> XXX ] and [ []: (:category_id) -> XXX ])) -> XXX
  sig { params(guardian: T.untyped, opts: T.untyped).returns(T.untyped) }
  def posts_for(guardian, opts = nil); end

  # RDL Type: ([ filter_allowed_categories: (ActiveRecord_Relation<JoinTable<Post, (Category or Topic or User)>>) -> XXX ], ?([ []: (:before_post_id) -> XXX ] and [ []: (:category_id) -> XXX ])) -> XXX
  sig { params(guardian: T.untyped, opts: T.untyped).returns(T.untyped) }
  def messages_for(guardian, opts = nil); end

  # RDL Type: ([ filter_allowed_categories: (ActiveRecord_Relation<JoinTable<Post, (Category or GroupMention or Topic or User)>>) -> XXX ], ?([ []: (:before_post_id) -> XXX ] and [ []: (:category_id) -> XXX ])) -> XXX
  sig { params(guardian: T.untyped, opts: T.untyped).returns(T.untyped) }
  def mentioned_posts_for(guardian, opts = nil); end
end

class [s]Group
  # RDL Type: () -> Array<Number>
  sig { returns(T::Array[Integer]) }
  def trust_group_ids; end

  # RDL Type: ([ +: (Number) -> XXX ]) -> Array<Number>
  sig { params(trust_level: T.untyped).returns(T::Array[Integer]) }
  def desired_trust_level_groups(trust_level); end

  # RDL Type: (Number, [ +: (Number) -> XXX ]) -> Array<Number>
  sig { params(user_id: Integer, trust_level: T.untyped).returns(T::Array[Integer]) }
  def user_trust_level_change!(user_id, trust_level); end

  # RDL Type: ((String or Symbol)) -> Group
  sig { params(name: T.any(String, Symbol)).returns(Group) }
  def refresh_automatic_group!(name); end

  # RDL Type: ((String or Symbol)) -> Group
  sig { params(name: T.any(String, Symbol)).returns(Group) }
  def lookup_group(name); end
end

class [s]Draft
  # RDL Type: ((Number and [ id: () -> XXX ]), (String or Symbol)) -> Draft
  sig { params(user: T.untyped, key: T.any(String, Symbol)).returns(Draft) }
  def find_draft(user, key); end
end

class Topic
  # RDL Type: () -> (false or true)
  sig { returns(T.any(FalseClass, TrueClass)) }
  def update_action_counts; end

  # RDL Type: () -> (false or true)
  sig { returns(T.any(FalseClass, TrueClass)) }
  def has_topic_embed?; end

  # RDL Type: () -> (false or true)
  sig { returns(T.any(FalseClass, TrueClass)) }
  def expandable_first_post?; end
end

class [s]Notification
  # RDL Type: ((Array<Number> or Number), (Array<Number> or Number)) -> Number
  sig { params(user_id: T.any(T::Array[Integer], Integer), topic_id: T.any(T::Array[Integer], Integer)).returns(Integer) }
  def remove_for(user_id, topic_id); end
end

class Notification
  # RDL Type: () -> Post
  sig { returns(Post) }
  def post; end
end

class [s]Badge
  # RDL Type: () -> Array<Number>
  sig { returns(T::Array[Integer]) }
  def trust_level_badge_ids; end
end

class [s]PostActionType
  # RDL Type: () -> XXX
  sig { returns(T.untyped) }
  def notify_flag_type_ids; end
end

class RateLimiter
  # RDL Type: (User, String, XXX, Number, { global: ?((false or true)) }) -> self
  sig do
    params(
      user: User,
      type: String,
      max: T.untyped,
      secs: Integer,
      global: T.nilable(T.any(FalseClass, TrueClass))
    ).returns(T.self_type)
  end
  def initialize(user, type, max, secs, global: nil); end
end

class UsernameValidator
  # RDL Type: ([ unicode_normalize: () -> XXX ]) -> self
  sig { params(username: T.untyped).returns(T.self_type) }
  def initialize(username); end

  # RDL Type: () -> XXX
  sig { returns(T.untyped) }
  def valid_format?; end
end
