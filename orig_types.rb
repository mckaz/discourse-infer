### Type annotations for type checked methods are below.
## Methods located in ~/discourse/app/models/user.rb
RDL.orig_type User, 'self.new_from_params', '({ name: String, email: String, password: String, username: String }) -> User', typecheck: :later, wrap: false
RDL.orig_type User, 'self.find_by_username', '(String) -> User', typecheck: :later, wrap: false
RDL.orig_type User, 'self.username_available?', "(String, ?String) -> %bool", typecheck: :later, wrap: false
RDL.orig_type User, :featured_user_badges, '(?Integer) -> %any', typecheck: :later, wrap: false
RDL.orig_type User, :email_confirmed?, '() -> %bool', typecheck: :later, wrap: false
RDL.orig_type User, :activate, '() -> %bool or nil', typecheck: :later, wrap: false
RDL.orig_type User, :number_of_deleted_posts, '() -> Integer', typecheck: :later, wrap: false
RDL.orig_type User, :number_of_flags_given, '() -> Integer', typecheck: :later, wrap: false
RDL.orig_type User, :create_user_profile, '() -> UserProfile', typecheck: :later, wrap: false
RDL.orig_type User, :create_user_option, '() -> UserOption', typecheck: :later, wrap: false
RDL.orig_type User, :create_email_token, '() -> EmailToken', typecheck: :later, wrap: false
RDL.orig_type User, :update_username_lower, '() -> String', typecheck: :later, wrap: false
RDL.orig_type User, :seen_before?, '() -> %bool', typecheck: :later, wrap: false
## Methods located in ~/discourse/app/models/email_token.rb
RDL.orig_type EmailToken, 'self.active', '() -> ActiveRecord_Relation<EmailToken>', wrap: false, typecheck: :later
## Methods located in ~/discourse/app/models/post.rb
RDL.orig_type Post, :seen?, '(User) -> %bool', typecheck: :later, wrap: false
RDL.orig_type Post, 'self.find_by_detail', '(String, String) -> Post', typecheck: :later, wrap: false
RDL.orig_type Post, :has_active_flag?, '() -> %bool', typecheck: :later, wrap: false
RDL.orig_type Post, :is_flagged?, '() -> %bool', typecheck: :later, wrap: false
RDL.orig_type Post, :is_reply_by_email?, '() -> %bool', typecheck: :later, wrap: false
RDL.orig_type Post, :add_detail, "(String, String, ?String) -> PostDetail", typecheck: :later, wrap: false
RDL.orig_type Post, :limit_posts_per_day, '() -> RateLimiter', typecheck: :later, wrap: false
RDL.orig_type Archetype, 'self.private_message', '() -> String', typecheck: :later, wrap: false
## Methods located in ~/discourse/app/models/group.rb
RDL.orig_type Group, :posts_for, '(Guardian, ?Hash<Symbol, Integer>) -> ActiveRecord_Relation<JoinTable<Post, User or Topic or Category>>', typecheck: :later, wrap: false
RDL.orig_type Group, :messages_for, '(Guardian, ?Hash<Symbol, Integer>) -> ActiveRecord_Relation<JoinTable<Post, User or Topic or Category>>', typecheck: :later, wrap: false
RDL.orig_type Group, :mentioned_posts_for, '(Guardian, ?Hash<Symbol, Integer>) -> ActiveRecord_Relation<JoinTable<Post, User or Topic or Category or GroupMention>>', typecheck: :later, wrap: false
RDL.orig_type Group, 'self.trust_group_ids', '() -> Array<Integer>', typecheck: :later, wrap: false
RDL.orig_type Group, 'self.desired_trust_level_groups', '(Integer) -> Array<Integer>', typecheck: :later, wrap: false
RDL.orig_type Group, 'self.user_trust_level_change!', '(Integer, Integer) -> Array<Integer>', typecheck: :later, wrap: false
RDL.orig_type Group, 'self.refresh_automatic_group!', '(Symbol) -> Group', typecheck: :later, wrap: false
RDL.orig_type Group, 'self.lookup_group', "(Symbol) -> Group", typecheck: :later, wrap: false
## Methods located in ~/discourse/app/models/draft.rb
RDL.orig_type Draft, 'self.find_draft', '(User or Integer, String) -> Draft', typecheck: :later, wrap: false
## Methods located in ~/discourse/app/models/topic.rb
RDL.orig_type Topic, :update_action_counts, '() -> %bool', typecheck: :later, wrap: false
RDL.orig_type Topic, :has_topic_embed?, '() -> %bool', typecheck: :later, wrap: false
RDL.orig_type Topic, :expandable_first_post?, '() -> %bool', typecheck: :later, wrap: false
## Methods located in ~/discourse/app/models/notification.rb
RDL.orig_type Notification, 'self.remove_for', '(Integer, Integer) -> Integer', typecheck: :later, wrap: false
RDL.orig_type Notification, :post, '() -> Post', typecheck: :later, wrap: false


## Type annotations for variables and unchecked methods are below. The methods are from the Discourse app, or from external libraries.
RDL.orig_type Badge, 'self.trust_level_badge_ids', '() -> [1,2,3,4]', wrap: false
RDL.orig_type User, :email, '() -> String', wrap: false
RDL.orig_type User, :email=, '(String) -> String', wrap: false
RDL.orig_type User, :password=, '(String) -> String', wrap: false
RDL.orig_type User, 'self.reserved_username?', "(String) -> %bool", wrap: false
RDL.orig_type EmailToken, 'self.valid_after', '() -> DateTime', wrap: false
RDL.orig_type EmailToken, 'self.confirm', '(String) -> %bool', wrap: false
RDL.orig_type ActiveRecord::Base, 'self.with_deleted', '() -> ``RDL::Type::GenericType.new(RDL::Type::NominalType.new(ActiveRecord_Relation), DBType.rec_to_nominal(trec))``', wrap: false
RDL.orig_type PostActionType, 'self.notify_flag_type_ids', '() -> Array<Integer>', wrap: false
RDL.orig_type PostActionType, 'self.flag_types_without_custom', '() -> Hash<Symbol, Integer>', wrap: false
RDL.orig_var_type User, :@raw_password, "String"
RDL.orig_var_type User, :@password_required, "%bool"
RDL.orig_type User, :new_user_posting_on_first_day?, '() -> %bool', wrap: false
RDL.orig_type SiteSetting, 'self.max_replies_in_first_day', '() -> Integer'
RDL.orig_type RateLimiter, :initialize, '(User, String, Integer, Integer, ?{global: %bool}) -> self', wrap: false
RDL.orig_type Post, 'self.types', '() -> Hash<Symbol, Integer>', wrap: false
RDL.orig_type I18n, 'self.t', '(String) -> String', wrap: false
RDL.orig_type UsernameValidator, :initialize, '(String) -> self', wrap: false
RDL.orig_type UsernameValidator, :valid_format?, '() -> %bool', wrap: false
RDL.orig_type Group, 'self.visibility_levels', '() -> Hash<Symbol, Integer>', wrap: false
RDL.orig_type Theme, :included_themes, '() -> Array<Theme>', wrap: false
RDL.orig_type SiteSetting, 'self.embed_truncate?', '() -> %bool', wrap: false
RDL.orig_type MiniSqlMultisiteConnection, 'exec', "(String) -> %any", wrap: false
RDL.orig_type ActiveRecord::AttributeMethods::ClassMethods, 'attribute_names', '() -> Array<String>', wrap: :false
RDL.orig_type ActiveRecord_Relation, :attribute_names, '() -> Array<String>', wrap: false
RDL.orig_type ActiveRecord_Relation, :active, '() -> self', wrap: false
RDL.orig_type Object, :blank?, '() -> %bool', wrap: false
RDL.orig_type Integer, :day, '() -> ActiveSupport::Duration', wrap: false
RDL.orig_type ActiveSupport::Duration, :to_i, '() -> Integer', wrap: false
RDL.orig_type TopicGuardian, :filter_allowed_categories, '(t) -> t', wrap: false
RDL.orig_type ActiveRecord::Base, 'self.exec_sql', '(String) -> %bool', wrap: false
RDL.orig_type ActiveRecord::Base, 'self.reset_counters', '(Integer, Symbol) -> Integer', wrap: false
